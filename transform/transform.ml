open Pt
open Location
open Sexplib
open Sexp
open Token
open Visit

let mk_bracket loc e =
  BracketExpression (loc,
    Token (loc, TK_LBRACK, "("),
    e,
    Token (loc, TK_RBRACK, ")"))
;;

let mk_braced loc e =
  CompoundStatement (loc,
    Token (loc, TK_LBRACE, "{"),
    e,
    Token (loc, TK_RBRACE, "}"))
;;

let mk_deref loc e =
  PointerDereference (loc, Token (loc, TK_STAR, "*"), e)
;;

let mk_add loc a b =
  Add (loc, a, Token (loc, TK_PLUS, "+"), b)
;;

let rec desugar e =
  let maybe_braced e =
    match e with
    | CompoundStatement (_, _, _, _) -> e
    | e -> mk_braced (location e) e
  in
  match e with

  (* a->b => ( *a ).b *)
  | PointerAccess (loc, lhs, op, member) ->
      StructAccess (loc,
      	mk_bracket loc (
          mk_deref loc (
            desugar lhs)),
        Token (loc, TK_PERIOD, "."),
        member)

  (* a[b] => ( *(a + b) ) *)
  | ArrayAccess (loc, lhs, lsqbrack, rhs, rsqbrack) ->
      mk_bracket loc (
        mk_deref loc (
          mk_bracket loc (
            mk_add loc (desugar lhs) (desugar rhs))))

  (* add explicit braces around for/while/if/do bodies *)
  | IfStatement (loc, if_, lbrack, cond, rbrack, then_stmt, else_, else_stmt) ->
      IfStatement (loc, if_, lbrack, cond, rbrack,
      	maybe_braced (desugar then_stmt),
        else_,
        maybe_braced (desugar else_stmt))
  | ForStatement (loc, for_, lbrack, init, init_semi, cond, cond_semi, inc, rbrack, stmt) ->
      ForStatement (loc, for_, lbrack, init, init_semi, cond, cond_semi, inc, rbrack,
      	maybe_braced (desugar stmt))

  (* other *)
  | e -> resume desugar e
;;

let main =
  let sexp = load_sexp "test.scm" in
  let code = pt_of_sexp sexp in

  let code = desugar code in

  let sexp = sexp_of_pt code in
  let _ = output_mach stdout sexp in
  output_string stdout "\n"
;;
