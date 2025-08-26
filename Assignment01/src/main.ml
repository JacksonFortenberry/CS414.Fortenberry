open Assignment01.Question1

let () =
  let a = of_int 9 and b = of_int 4 in
  let q = div a b and r = rem a b in
  Printf.printf "9 / 4 = %d, 9 %% 4 = %d\n" (to_int q) (to_int r)
