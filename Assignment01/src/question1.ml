(* CS 414 – Assignment 01: Peano Arithmetic (OCaml Playground ready) *)

(* --- Peano naturals --- *)
type nat =
  | Z            (* zero *)
  | S of nat     (* successor *)

(* Helpers to convert for I/O *)
let rec to_int = function
  | Z -> 0
  | S n -> 1 + to_int n

let of_int n =
  let rec go acc k =
    if k <= 0 then acc else go (S acc) (k - 1)
  in
  if n < 0 then invalid_arg "of_int: negative" else go Z n

(* Pretty-printer (shows as an int) *)
let show_nat n = string_of_int (to_int n)

(* --- Basic Peano operations --- *)

(* Addition by Peano axioms:
   x + 0 = x
   x + S(y) = S(x + y) *)
let rec add x y =
  match x with
  | Z -> y
  | S x' -> S (add x' y)

(* Subtraction "clamped" at zero:
   sub_clamp x y = max(x - y, 0) *)
let rec sub_clamp x y =
  match x, y with
  | x, Z -> x
  | Z, _ -> Z
  | S x', S y' -> sub_clamp x' y'

(* Comparison: x <= y *)
let rec leq x y =
  match x, y with
  | Z, _ -> true
  | S _, Z -> false
  | S x', S y' -> leq x' y'

(* Strict comparison: x < y *)
let lt x y = leq (S x) y

(* Multiplication defined from addition:
   x * 0 = 0
   x * S(y) = x + (x * y)
   (equivalently, add y to itself x times) *)
let rec mul x y =
  match x with
  | Z -> Z
  | S x' -> add y (mul x' y)

(* Division with remainder by repeated subtraction.
   Requires divisor != 0.
   Returns (q, r) such that x = q*d + r and 0 <= r < d. *)
let div_rem x d =
  match d with
  | Z -> invalid_arg "div_rem: division by zero"
  | _ ->
    let rec loop n q =
      if lt n d then (q, n)
      else
        let n' = sub_clamp n d in
        loop n' (S q)
    in
    loop x Z

(* Convenience wrappers to return just quotient or remainder *)
let div x d = fst (div_rem x d)
let rem x d = snd (div_rem x d)

(* --- Demo / Tests (will print in the Playground) --- *)
let () =
  let nine = of_int 9 in
  let four = of_int 4 in
  let (q, r) = div_rem nine four in
  Printf.printf "%d / %d = %d, %d %% %d = %d\n"
    (to_int nine) (to_int four) (to_int q)
    (to_int nine) (to_int four) (to_int r);

  let three = of_int 3 in
  let five  = of_int 5 in
  let prod  = mul three five in
  Printf.printf "%d * %d = %d\n"
    (to_int three) (to_int five) (to_int prod);

  (* A couple more quick checks *)
  let seven = of_int 7 in
  let two   = of_int 2 in
  let (q2, r2) = div_rem seven two in
  Printf.printf "%d / %d = %d, %d %% %d = %d\n"
    (to_int seven) (to_int two) (to_int q2)
    (to_int seven) (to_int two) (to_int r2)
