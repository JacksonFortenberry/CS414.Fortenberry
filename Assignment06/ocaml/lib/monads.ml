(* ---------- 1.1  Generic MONAD signature ---------- *)
module type MONAD = sig
  type 'a t
  val return : 'a -> 'a t
  val bind   : 'a t -> ('a -> 'b t) -> 'b t
  val map    : ('a -> 'b) -> 'a t -> 'b t
end

(* ---------- infix helpers ---------- *)
module Make_infix (M : MONAD) = struct
  let ( >>= )  = M.bind
  let ( let* ) = M.bind
  let ( >|= ) m f = M.map f m
end

(* ---------- 1.2  Three concrete monads ---------- *)
module OptionM : MONAD = struct
  type 'a t = 'a option
  let return x = Some x
  let bind m f = match m with None -> None | Some x -> f x
  let map f m  = match m with None -> None | Some x -> Some (f x)
end
module O = Make_infix(OptionM)

module ResultM : MONAD = struct
  type 'a t = ('a, string) result
  let return x = Ok x
  let bind m f = match m with Error e -> Error e | Ok x -> f x
  let map f m  = match m with Error e -> Error e | Ok x -> Ok (f x)
end
module R = Make_infix(ResultM)

module ListM : MONAD = struct
  type 'a t = 'a list
  let return x = [x]
  let bind xs f = List.concat_map f xs
  let map  = List.map
end
module L = Make_infix(ListM)