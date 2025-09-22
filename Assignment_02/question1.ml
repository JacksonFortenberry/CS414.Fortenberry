(* Question 1: Rose Trees *)

(* Define a rose tree type *)
type 'a rose = Node of 'a * 'a rose list

(* Count the total number of nodes *)
let rec tree_size t =
  match t with
  | Node(_, children) ->
      1 + List.fold_left (fun acc c -> acc + tree_size c) 0 children

(* Apply a function to all values *)
let rec tree_map f t =
  match t with
  | Node(v, children) ->
      Node(f v, List.map (tree_map f) children)

(* Fold tree values using a function *)
let rec tree_fold f t =
  match t with
  | Node(v, children) ->
      let child_results = List.map (tree_fold f) children in
      f v child_results

(* Print values preorder (root first, then children) *)
let rec print_tree_values t =
  match t with
  | Node(v, children) ->
      Printf.printf "%d " v;
      List.iter print_tree_values children

(* Example tree *)
let sample_tree =
  Node(10, [Node(5, []); Node(20, [Node(15, []); Node(25, [])])])

(* Run tests *)
let () =
  Printf.printf "Tree size: %d\n" (tree_size sample_tree);

  let sum = tree_fold (fun v subs -> v + List.fold_left (+) 0 subs) sample_tree in
  Printf.printf "Sum of values: %d\n" sum;

  Printf.printf "Preorder traversal: ";
  print_tree_values sample_tree;
  Printf.printf "\n"
