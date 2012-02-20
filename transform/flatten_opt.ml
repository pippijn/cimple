open Ast
open Visit

let rec transform expr =
  match expr with
  | NodeOpt (_, node) -> node
  | e -> resume transform e
;;
