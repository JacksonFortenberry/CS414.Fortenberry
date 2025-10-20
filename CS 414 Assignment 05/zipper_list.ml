(* A bidirectional list with a focus point *)

type 'a zipper = {
  left : 'a list;     (* elements before focus, reversed *)
  focus : 'a option;  (* current element in focus *)
  right : 'a list;    (* elements after focus *)
}

let empty = { left = []; focus = None; right = [] }

let is_empty z = (z.focus = None && z.left = [] && z.right = [])

let push_front x z =
  match z.focus with
  | None -> { left = []; focus = Some x; right = [] }
  | Some f -> { left = z.left; focus = Some x; right = f :: z.right }

let push_back x z =
  match z.focus with
  | None -> { left = []; focus = Some x; right = [] }
  | Some f -> { left = f :: z.left; focus = Some x; right = z.right }

let move_left z =
  match z.left with
  | [] -> z
  | x :: xs -> { left = xs; focus = Some x; right = (match z.focus with None -> z.right | Some f -> f :: z.right) }

let move_right z =
  match z.right with
  | [] -> z
  | x :: xs -> { left = (match z.focus with None -> z.left | Some f -> f :: z.left);
                 focus = Some x; right = xs }

let focus z = z.focus

(* Simple test *)
let () =
  let open Printf in
  let z = empty |> push_front 1 |> push_back 2 |> push_back 3 in
  let z = move_right z in
  match focus z with
  | None -> printf "No focus\n"
  | Some x -> printf "Focus is %d\n" x
