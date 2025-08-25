open Alcotest
open Assignment01

let n = Question1.of_int
let to_i = Question1.to_int

let test_add () =
  check int "2+3=5" 5 (to_i (Question1.add (n 2) (n 3)))

let test_mul () =
  check int "2*3=6" 6 (to_i (Question1.mul (n 2) (n 3)))

let test_sub_clamp () =
  check int "2-5=0 (clamped)" 0 (to_i (Question1.sub (n 2) (n 5)))

let test_div () =
  check int "7/3=2" 2 (to_i (Question1.div (n 7) (n 3)))

let test_rem () =
  check int "7 mod 3 = 1" 1 (to_i (Question1.rem (n 7) (n 3)))

let test_qr_identity () =
  let a, b = n 9, n 4 in
  let q, r = Question1.div a b, Question1.rem a b in
  check int "a = q*b + r" 9
    (to_i (Question1.add (Question1.mul q b) r));
  check bool "r < b" true (Question1.less r b)

let () =
  run "Assignment01 - Question1"
    [
      ("add", [ test_case "add" `Quick test_add ]);
      ("mul", [ test_case "mul" `Quick test_mul ]);
      ("sub", [ test_case "sub clamp" `Quick test_sub_clamp ]);
      ("div", [ test_case "div" `Quick test_div ]);
      ("rem", [ test_case "rem" `Quick test_rem ]);
      ("laws", [ test_case "q*b + r, r<b" `Quick test_qr_identity ]);
    ]
