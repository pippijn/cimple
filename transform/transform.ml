open Ast
open Location
open Flatten_opt
open Sexplib
open Sexp
open Visit

let main =
  let code = load_sexp "test.scm" in
  let _ =
    try
      output_hum stdout (
        sexp_of_ast (
          ast_of_sexp code))
    with
    	Conv_error.No_variant_match (_, x) ->
        output_hum stdout x
  in
    Pervasives.output_string stdout "\n"
;;
