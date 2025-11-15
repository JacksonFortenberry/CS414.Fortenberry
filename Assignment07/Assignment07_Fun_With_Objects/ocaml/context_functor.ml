(* context_functor.ml *)

module type SORT = sig
  val sort : int list -> int list
end

module SortContext (S : SORT) = struct
  let execute_strategy lst = S.sort lst
end

module Quick = struct
  let sort = List.sort compare
end

module C = SortContext(Quick)

let () =
  let sorted = C.execute_strategy [5;2;9;1;5;6] in
  List.iter (fun x -> Printf.printf "%d " x) sorted;
  Printf.printf "\n"
