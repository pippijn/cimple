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

let mk_deref loc e =
  PointerDereference (loc, Token (loc, TK_STAR, "*"), e)
;;

let mk_add loc a b =
  Add (loc, a, Token (loc, TK_PLUS, "+"), b)
;;

let rec desugar e =
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
  | e -> resume desugar e
;;

(* removes *all* casts, this is just for demonstration
 * purposes, not actually useful *)
let rec remove_casts e =
  match e with
  | TypeCast (loc, _, _, _, expr) -> remove_casts expr
  | e -> resume remove_casts e
;;

(* removes all brackets, so we can re-add them where required, later *)
let rec remove_brackets e =
  match e with
  | BracketExpression (loc, _, expr, _) -> remove_brackets expr
  | expr -> resume remove_brackets expr
;;

let main =
  let sexp = load_sexp "test.scm" in
  let code = pt_of_sexp sexp in

  let code = desugar code in
  let code = remove_casts code in
  let code = remove_brackets code in

  let sexp = sexp_of_pt code in
  let _ = output_mach stdout sexp in
  output_string stdout "\n"
;;
