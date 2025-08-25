type nat = Z | S of nat

let rec to_int = function
  | Z -> 0
  | S n -> 1 + to_int n

let rec of_int n =
  if n <= 0 then Z else S (of_int (n - 1))

let rec add x y =
  match x with
  | Z -> y
  | S x' -> S (add x' y)

let rec mul x y =
  match x with
  | Z -> Z
  | S x' -> add y (mul x' y)

let rec sub x y =
  match x, y with
  | x, Z -> x
  | Z, S _ -> Z
  | S x', S y' -> sub x' y'

let rec less x y =
  match x, y with
  | Z, Z -> false
  | Z, S _ -> true
  | S _, Z -> false
  | S x', S y' -> less x' y'

let rec div x y =
  match x, y with
  | _, Z -> failwith "division by zero"
  | Z, _ -> Z
  | _ ->
      if less x y then Z
      else S (div (sub x y) y)

let rec rem x y =
  match x, y with
  | _, Z -> failwith "mod by zero"
  | Z, _ -> Z
  | _ ->
      if less x y then x
      else rem (sub x y) y

(* Inline tests *)
let%test _ = to_int (add (of_int 2) (of_int 3)) = 5
let%test _ = to_int (mul (of_int 2) (of_int 3)) = 6
let%test _ = to_int (sub (of_int 5) (of_int 2)) = 3
let%test _ = to_int (sub (of_int 2) (of_int 5)) = 0
let%test _ = to_int (div (of_int 7) (of_int 3)) = 2
let%test _ = to_int (rem (of_int 7) (of_int 3)) = 1
let%test _ =
  let a = of_int 9 and b = of_int 4 in
  let q = div a b and r = rem a b in
  to_int (add (mul q b) r) = 9 && less r b
