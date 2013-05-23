(* find first triangular number with over x divisors *)

let limit = 500;;

(* return a number's odd factors 
 * preconditions: divisor shouuldn't be one
 *)
let divide_odd (num: int) : int =
  let rec divide_odd_helper (num: int) (divisor: int) (occurences: int) : int =
      assert ((divisor mod 2) != 0);
      if (num = 1) then occurences
      else if (divisor > int_of_float (ceil (sqrt(float_of_int num)))) then (
        if (num mod divisor = 0) then occurences+1
        else 2*occurences
      )
      else if (num mod divisor) = 0 then
        (divide_odd_helper (num/divisor) divisor (occurences+1))
      else
        occurences * (divide_odd_helper num (divisor + 2) 1)
  in
  divide_odd_helper num 3 1
;;

assert ((divide_odd 5) = 2);;
assert ((divide_odd 15) = 4);;

let number_of_divisors (num: int) : int =
  let even_factor_count = ref 0 in
  let rec divide_even (num: int) : int =
    if (num mod 2) = 0 then (
      even_factor_count := !even_factor_count + 1;
      (divide_even (num/2))
    )
    else num
  in
  let odd_factor_count = divide_odd (divide_even num) in
  odd_factor_count * (!even_factor_count + 1)
;;

assert (number_of_divisors 28 = 6);;
assert (number_of_divisors 887040 = (9*3*2*2*2));;
assert (number_of_divisors 5520824 = 8);;
assert (number_of_divisors 2348290 = 16);;
assert (number_of_divisors 3528430 = 32);;
assert (number_of_divisors (11*13*17*7) = 16);;
assert (number_of_divisors (11*11*13*13*17*7) = 36);;
assert (number_of_divisors (11*11*11*11*11*13*13*17*7) = 72);;
assert (number_of_divisors (2*2*2*2*2*3*11*17) = 48);;
assert (number_of_divisors (2*2*2*2*2*3*3) = 18);;
assert (number_of_divisors (11*11*13*13*13*17*17*17*7*7) = 144);;

(*assert (number_of_divisors 48024900 = 405);;*)

let get_triangular (n: int) : int =
  ((n + 1) * n) / 2
;;

let rec search_for_first_limit (n: int) : unit =
  let number_of_factors = number_of_divisors (get_triangular n) in
  (*Printf.printf "%d\n" (number_of_factors);*)
  if number_of_factors >= limit then
    Printf.printf "Number is %d %d\n" n (get_triangular n)
  else
    search_for_first_limit (n+1)
;;

search_for_first_limit 1;;