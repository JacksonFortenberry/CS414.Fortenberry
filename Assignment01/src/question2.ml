(* Question 2: Trees, prune and level traversal *)

type 'a tree =
  | Leaf
  | Node of 'a * 'a tree * 'a tree

let leaf = Leaf
let node x l r = Node (x, l, r)

let rec prune = function
  | Leaf -> Leaf
  | Node (_, Leaf, Leaf) -> Leaf
  | Node (x, l, r) -> Node (x, prune l, prune r)

let level_traversal t =
  let rec bfs acc = function
    | [] -> List.rev acc
    | Leaf :: qs -> bfs acc qs
    | Node (x, l, r) :: qs -> bfs (x :: acc) (qs @ [l; r])
  in
  bfs [] [t]

let sample_tree =
  node 1
    (node 2 (node 4 leaf leaf) (node 5 leaf leaf))
    (node 3 leaf (node 6 leaf leaf))

let () =
  let bfs_result = level_traversal sample_tree in
  Printf.printf "Level order: %s\n"
    (String.concat " " (List.map string_of_int bfs_result));
  let pruned = prune sample_tree in
  let bfs_pruned = level_traversal pruned in
  Printf.printf "After prune: %s\n"
    (String.concat " " (List.map string_of_int bfs_pruned))
