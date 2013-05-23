(* longest collatz sequence with starting number up to limit *)
let limit = 1000000

(* custom type for a maximum
 * storing the actual value of the maximum 
 * and the actual number it occurs at 
 *)
type max = {value: int; n: int; }

let rec next_collatz (n: int) : int = 
  if (n = 1) then 1
  else if (n mod 2) = 0 then 1 + (next_collatz (n / 2))
  else 1 + (next_collatz (3*n + 1))

let find_max () =
  let max = ref {value= 0; n= 0} in
  let rec traverse (n: int) : unit =
    if n < limit then (
      let len = next_collatz n in
      if len > (!max).value then 
        max := {value=len; n=n};
      traverse (n+1)
    );
  in traverse 1;
  Printf.printf "%d\n" !max.n
;;

find_max ();;