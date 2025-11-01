open Monads

let () =
  (* ---- Option ---- *)
  let o = O.(return 5 >>= fun x -> return (x + 1)) in
  Printf.printf "Option: %d\n" (match o with Some v -> v | None -> 0);

  (* ---- Result ---- *)
  let r = R.(return 20 >>= fun x -> if x = 0 then Error "zero" else Ok (100 / x)) in
  Printf.printf "Result: %s\n"
    (match r with Ok v -> string_of_int v | Error e -> "Error: " ^ e);

  (* ---- List ---- *)
  let ( let* ) = L.( let* ) in
  let pairs = L.(let* x = [1;2] in let* y = [10;20] in return (x,y)) in
  Printf.printf "List: %s\n"
    (String.concat "; " (List.map (fun (a,b) -> Printf.sprintf "(%d,%d)" a b) pairs))