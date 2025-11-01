(* ---------- monadic helpers ---------- *)
let ( let* ) = Option.bind          (* gives us Haskell/Reason-style let* *)

let safe_div a b =
  if b = 0 then None else Some (a / b)

(* ---------- the required pipeline ---------- *)
let triple_div x y z =
  let* a = safe_div x y in
  let* b = safe_div a z in
  Some b

(* ---------- extra-credit:  ((x/y)/z)/2  ---------- *)
let quad_div x y z =
  let* a = safe_div x y in
  let* b = safe_div a z in
  let* c = safe_div b 2 in
  Some c

(* ---------- quick tests ---------- *)
let () =
  assert (triple_div 36 3 2 = Some 6);
  assert (triple_div 36 0 2 = None);
  assert (quad_div 36 3 2 = Some 3);
  assert (quad_div 7 2 1 = None);          (* (7/2)/1)/2 = 3/2 = 1 (int-div) *)
  Printf.printf "All checks passed.\n"