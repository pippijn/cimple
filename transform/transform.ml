open Ast
open Location
open Sexplib
open Sexp
open Token
open Visit

let bracket loc e =
  BracketExpression (loc,
    Token (loc, TK_LBRACK, "("),
    e,
    Token (loc, TK_RBRACK, ")"))
;;

let rec desugar e =
  match e with
  | PointerAccess (loc, lhs, op, member) ->
      StructAccess (loc,
      	bracket loc (PointerDereference (loc, Token (loc, TK_STAR, "*"), desugar lhs)),
        Token (loc, TK_PERIOD, "."),
        member)
  | ArrayAccess (loc, lhs, lsqbrack, rhs, rsqbrack) ->
      PointerDereference (loc,
        Token (loc, TK_STAR, "*"),
      	bracket loc (Add (loc, desugar lhs, Token (loc, TK_PLUS, "+"), desugar rhs)))
  | e -> resume desugar e
;;

let rec remove_casts e =
  match e with
  | TypeCast (loc, _, _, _, expr) -> expr
  | e -> resume remove_casts e
;;

let main =
  let code = ast_of_sexp (load_sexp "test.scm") in

  let code = desugar code in
  let code = remove_casts code in

  let sexp = sexp_of_ast code in
  let _ = output_hum stdout sexp
  in output_string stdout "\n"
;;
