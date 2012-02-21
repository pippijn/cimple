open Sexplib
open Sexp

type location = {
  first_line : int;
  first_column : int;
  last_line : int;
  last_column : int;
  file : string;
}

let invalid_location = { 
  first_line = 0;
  first_column = 0;
  last_line = 0;
  last_column = 0;
  file = "<invalid>";
}


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
