(* strategies.ml *)

let rec bubble_pass lst =
  let rec aux acc = function
    | [] -> List.rev acc, []
    | [x] -> List.rev (x::acc), []
    | x::y::rest ->
      if x > y then aux (y::acc) (x::rest)
      else aux (x::acc) (y::rest)
  in
  aux [] lst

let bubblesort lst =
  let rec loop l =
    let l', _ = bubble_pass l in
    if l' = l then l else loop l'
  in
  loop lst

let quicksort lst = List.sort compare lst

let rec split = function
  | [] | [_] as l -> l, []
  | a::b::rest ->
    let l1, l2 = split rest in
    (a::l1, b::l2)

let rec merge cmp l1 l2 =
  match l1, l2 with
  | [], r | r, [] -> r
  | a::as_, b::bs ->
    if cmp a b then a :: merge cmp as_ (b::bs)
    else b :: merge cmp (a::as_) bs

let rec mergesort ?(cmp = compare) = function
  | [] | [_] as l -> l
  | l ->
    let a, b = split l in
    merge cmp (mergesort ~cmp a) (mergesort ~cmp b)
