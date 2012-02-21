open Ast
open Sexplib
open Sexp

let location_of_sexp x =
  match x with
  | List [Atom ("loc");
      List [Atom (fl); Atom (fc)];
      List [Atom (ll); Atom (lc)];
      Atom (fn)] ->
        {
          first_line = int_of_string fl;
          first_column = int_of_string fc;
          last_line = int_of_string ll;
          last_column = int_of_string lc;
          file = fn
        }
  | _ -> raise (Conv_error.no_variant_match "location" x)
;;

let sexp_of_location loc =
  (*let _ =*)
  List [Atom ("loc");
    List [Atom (string_of_int loc.first_line); Atom (string_of_int loc.first_column)];
    List [Atom (string_of_int loc.last_line); Atom (string_of_int loc.last_column)];
    Atom (loc.file)]
  (*in Atom ("loc")*)
;;
