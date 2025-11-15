(* context_fun.ml *)

let sort_with strategy lst = strategy lst

let () =
  let data = [5;2;9;1;5;6] in
  let sorted = sort_with (fun l -> List.sort compare l) data in
  List.iter (fun x -> Printf.printf "%d " x) sorted;
  Printf.printf "\n"
