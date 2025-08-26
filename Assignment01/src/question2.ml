(* CS 414 – Assignment 01, Q2: Binary trees, prune, and level traversal *)

(* --- Binary tree type (as in lecture) --- *)
type 'a tree =
  | Leaf
  | Node of 'a * 'a tree * 'a tree

(* --- prune: remove all original leaves in one sweep ---
   If a node is a leaf (both children are Leaf), delete it (return Leaf).
   Otherwise, rebuild the node with pruned subtrees. *)
let rec prune = function
  | Leaf -> Leaf
  | Node (_, Leaf, Leaf) -> Leaf
  | Node (v, l, r) -> Node (v, prune l, prune r)

(* --- level_traversal: breadth-first (left-to-right) --- *)
let level_traversal (t : 'a tree) : 'a list =
  let rec bfs acc = function
    | [] -> List.rev acc
    | Leaf :: q -> bfs acc q
    | Node (v, l, r) :: q -> bfs (v :: acc) (q @ [l; r])
  in
  bfs [] [t]

(* --- helpers for demo output --- *)
let show_list string_of_x xs =
  "[" ^ String.concat "; " (List.map string_of_x xs) ^ "]"

(* --- Demo tree ---
        1
       / \
      2   3
     / \   \
    4   5   6
*)
let t =
  Node (1,
        Node (2, Node (4, Leaf, Leaf), Node (5, Leaf, Leaf)),
        Node (3, Leaf, Node (6, Leaf, Leaf)))

let () =
  let before = level_traversal t in
  Printf.printf "Level order (original): %s\n"
    (show_list string_of_int before);

  let t_pruned = prune t in
  let after = level_traversal t_pruned in
  Printf.printf "Level order (after prune): %s\n"
    (show_list string_of_int after);

  (* A couple edge cases *)
  let single = Node (42, Leaf, Leaf) in
  Printf.printf "Single-node level order: %s\n"
    (show_list string_of_int (level_traversal single));
  Printf.printf "Single-node after prune (should be empty): %s\n"
    (show_list string_of_int (level_traversal (prune single)));
