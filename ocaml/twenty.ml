module B = Big_int

let num = 100;;

let string_of_char = String.make 1

let sum_of_string (str: string) : int =
  let sum = ref 0 in
  String.iter (
    fun chr ->
      sum := (int_of_string (string_of_char chr)) + !sum;
  ) str;
  !sum

let sum_of_digits (n: int) : int = 
  let rec factorial (n: int) : B.big_int = 
    if n = 1 then B.unit_big_int
    else B.mult_int_big_int n (factorial (n-1))
  in
  let prod = factorial n in
  let str = B.string_of_big_int prod in
  (sum_of_string str)
;;

Printf.printf "%d\n" (sum_of_digits num);;
