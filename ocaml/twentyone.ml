(* TWENTY ONE
 * An amicable number
 *)

let proper_divisors (n: int) : int list =
  let div_lim = int_of_float (sqrt (float_of_int n)) in
  let rec build_divisors n d lst = 
    if (d < div_lim) then (
      if ((n mod d) = 0) then (
        if (d != 1) then
          (n / d) :: (d :: (build_divisors n (d+1) lst))
        else if (d = div_lim) then
           d :: (build_divisors n (d+1) lst)
        else
          (d :: (build_divisors n (d+1) lst))
      )
      else (build_divisors n (d+1) lst)
    )
    else
      lst
  in
  build_divisors n 1 []
;;

let is_amicable (a: int) : bool =
  let sumation lst = 
    List.fold_left (fun n sum -> sum + n) 0 lst 
  in
  let a_divs = proper_divisors a in
  let sum_a = sumation a_divs in
  let b = sum_a in
  let b_divs = proper_divisors b in
  let sum_b = sumation b_divs in
  if (sum_b = a) && (a != b) then
    true 
  else
    false
;;

let find_amicables (n: int) : unit =
  let i = ref 0 in
  let sum = ref 0 in
  while !i < n do
    if is_amicable !i then
      sum := !sum + !i;
    i := !i + 1
  done;
  Printf.printf "%d\n" !sum
;;

find_amicables 10000;;