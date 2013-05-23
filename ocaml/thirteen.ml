(* care only about first 10 digits of a summed sequence of very large numbers,
 * but here's a practice implementation demonstrating 
 * Ocaml Big Nums anyways 
 *)

module B = Big_int

let filepath = "../files/13.txt"

let add () =
  let in_chan = open_in filepath in
  let sum = ref B.zero_big_int in
  try
    while true do
      let line = String.trim (input_line in_chan) in
      let next_num = B.big_int_of_string line in
      sum := B.add_big_int !sum next_num
    done
  with e -> 
    close_in_noerr in_chan;
    print_string (B.string_of_big_int !sum);
    (flush_all())
;;

add ();;