(* =========================================================
   General k-ary search tree with separation keys (pure/immutable)
   Invariant:
     - keys are strictly increasing (no duplicates)
     - List.length children = List.length keys + 1
     - For keys = [k0; k1; ...; k_{m-1}] and children = [c0; c1; ...; c_m]:
         all values in c0 < k0,
         all values in c1 are between k0 and k1,
         ...
         all values in c_m > k_{m-1}.
   ========================================================= *)

module GTree = struct
  type 'a t =
    | Empty
    | Node of {
        keys     : 'a list;     (* strictly increasing *)
        children : 'a t list;   (* length = length keys + 1 *)
      }

  (* ---------- Utilities ---------- *)

  let rec keys_strictly_increasing cmp = function
    | [] | [_] -> true
    | x :: y :: tl -> cmp x y < 0 && keys_strictly_increasing cmp (y :: tl)

  let index_for cmp x (keys : 'a list) : int =
    let rec aux i = function
      | [] -> i
      | k :: ks ->
          if cmp x k < 0 then i else aux (i + 1) ks
    in
    aux 0 keys

  let rec update_nth i (y : 'a) (xs : 'a list) : 'a list =
    match i, xs with
    | _, [] -> invalid_arg "update_nth: index out of bounds"
    | 0, _ :: tl -> y :: tl
    | n, hd :: tl -> hd :: update_nth (n - 1) y tl

  (* ---------- Height ---------- *)

  let rec height : 'a t -> int = function
    | Empty -> 0
    | Node { children; _ } ->
        1 + List.fold_left (fun acc c -> max acc (height c)) 0 children

  (* ---------- Higher-order traversals (fold style) ---------- *)

  (* In-order (generalized): c0, k0, c1, k1, ..., c_{m-1}, k_{m-1}, c_m *)
  let inorder_fold (f : 'acc -> 'a -> 'acc) (z : 'acc) (t : 'a t) : 'acc =
    let rec go acc = function
      | Empty -> acc
      | Node { keys; children } ->
          let rec step acc children keys =
            match children, keys with
            | c :: cs, k :: ks ->
                let acc = go acc c in
                let acc = f acc k in
                step acc cs ks
            | [c_last], [] ->
                go acc c_last
            | [], [] ->
                acc
            | _ ->
                failwith "inorder_fold: invariant violated"
          in
          step acc children keys
    in
    go z t

  (* Pre-order: visit all keys at node (left->right), then children left->right *)
  let preorder_fold (f : 'acc -> 'a -> 'acc) (z : 'acc) (t : 'a t) : 'acc =
    let rec go acc = function
      | Empty -> acc
      | Node { keys; children } ->
          let acc = List.fold_left f acc keys in
          List.fold_left (fun acc c -> go acc c) acc children
    in
    go z t

  (* Post-order: visit children left->right, then all keys (left->right) *)
  let postorder_fold (f : 'acc -> 'a -> 'acc) (z : 'acc) (t : 'a t) : 'acc =
    let rec go acc = function
      | Empty -> acc
      | Node { keys; children } ->
          let acc = List.fold_left (fun acc c -> go acc c) acc children in
          List.fold_left f acc keys
    in
    go z t

  (* Convenient list-returning traversals *)
  let inorder (t : 'a t) : 'a list =
    inorder_fold (fun acc x -> x :: acc) [] t |> List.rev

  let preorder (t : 'a t) : 'a list =
    preorder_fold (fun acc x -> x :: acc) [] t |> List.rev

  let postorder (t : 'a t) : 'a list =
    postorder_fold (fun acc x -> x :: acc) [] t |> List.rev

  (* ---------- Insert (duplicate-safe, preserves invariant) ---------- *)
  (* Straight k-ary search-tree insert (no B-tree rebalancing).
     - If value equals an existing key at a node, the tree is unchanged (no duplicates).
     - If we descend to an Empty child, we create a leaf with [x] and two Empty children. *)
  let rec insert (cmp : 'a -> 'a -> int) (x : 'a) (t : 'a t) : 'a t =
    match t with
    | Empty ->
        Node { keys = [x]; children = [Empty; Empty] }
    | Node ({ keys; children } as n) ->
        if List.exists (fun k -> cmp x k = 0) keys then t
        else
          let i = index_for cmp x keys in
          let ci = List.nth children i in
          let ci' = insert cmp x ci in
          let children' = update_nth i ci' children in
          Node { n with children = children' }

  (* ---------- Optional: lightweight structural validation ---------- *)
  let rec valid_shape cmp = function
    | Empty -> true
    | Node { keys; children } ->
        List.length children = List.length keys + 1
        && keys_strictly_increasing cmp keys
        && List.for_all (valid_shape cmp) children
end

(* ===========================
   Demo / Quick sanity checks
   =========================== *)

open GTree

let string_of_int_list xs =
  "[" ^ String.concat ", " (List.map string_of_int xs) ^ "]"

let () =
  let cmp = Stdlib.compare in
  let t =
    Empty
    |> insert cmp 5
    |> insert cmp 2
    |> insert cmp 8
    |> insert cmp 1
    |> insert cmp 3
    |> insert cmp 7
    |> insert cmp 9
    |> insert cmp 6
    |> insert cmp 5  (* duplicate: no effect *)
  in
  Printf.printf "height = %d\n" (height t);
  Printf.printf "inorder   = %s\n" (string_of_int_list (inorder t));
  Printf.printf "preorder  = %s\n" (string_of_int_list (preorder t));
  Printf.printf "postorder = %s\n" (string_of_int_list (postorder t));
  Printf.printf "valid_shape? %b\n" (valid_shape cmp t);
