(* first find all abundant numbers under limit
 * second, find all numbers under limit that are the sum of two abundant numbers
 * left overs are summed
 *)

type status = Deficient of int | Perfect | Abundant of int

let limit = 28123;;

(* sum of proper divisors *)
let sum_of_pd (n: int) : int = 
  let lim = int_of_float (sqrt (float_of_int n)) in
  let is_square = ((lim * lim) = n) in
  let d = ref 1 in
  let sum = ref 0 in
  while !d <= lim do
    if (n mod !d) = 0 then (
        if ((!d = lim) && (is_square = true)) or (!d = 1) then
          sum := !sum + !d
        else
          sum := !sum + !d + (n / !d)
    );
    d := !d + 1
  done;
  !sum

(* status of a number *)
let get_status (n: int) : status =
  let sum = sum_of_pd n in
  if sum = n then Perfect
  else if sum > n then Abundant(sum)
  else Deficient(sum)
;;


(* event loop *)
let find (l: int) : int =
  (* all numbers we assume start out as non abundant *)
  let abundant_arr = Array.make (l) false in
  let sumabun_arr = Array.make (l) false in
  let sum = ref 0 in
  Array.iteri 
    (fun x _ ->
      (match get_status (x+1) with
      | Abundant(_) -> 
          Array.set abundant_arr x true;
          Array.iteri (
            fun y _ -> 
              if Array.get abundant_arr y && (x+y+1 < l) then
                Array.set sumabun_arr (y+x+1) true    
          ) abundant_arr;
      | _ -> ());
    ) 
    abundant_arr;
  Array.iteri (fun x v -> if (not v) then sum := !sum+(x+1); ()) sumabun_arr;
  !sum
;;

Printf.printf "%d\n" (find limit);;


(* TESTS *)

let test_status () = 
  assert ((get_status 28) = Perfect);
  (*
  (
    match (get_status 12) with
    | Perfect -> Printf.printf "Perfect%s\n" ""
    | Abundant(x) -> Printf.printf "%d\n" x
    | Deficient(x) -> Printf.printf "%d\n" x
  ); *)
  assert ((get_status 12) = Abundant 16);
  assert ((get_status 11) = Deficient 1);
  assert ((get_status 7) = Deficient 1);
  assert ((get_status 5) = Deficient 1);
  assert ((get_status 8) = Deficient 7);

;;

let tests () =
  test_status ();
;;

tests ();;