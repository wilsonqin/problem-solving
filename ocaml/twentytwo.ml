(* run 
 * ocamlc -o twentytwo str.cma twentytwo.ml 
 * to compile
 *)

module IntMap = Map.Make(struct type t = char let compare = compare end)

let filepath = "./../files/22.txt"

(* create a list from start int to end int *)
let create_list (st: int) (en: int) : int list =
  let rec r_create_list (i: int) : int list =
    if (i = en) then i :: []
    else i :: (r_create_list (i+1))
  in r_create_list st
;;

let alphabet () =
  let num_list = create_list 97 122 in
  List.map Char.chr num_list
;;

let alphabet_score () =
  let score_list = create_list 1 26 in
  List.combine (alphabet ()) score_list
;;

let char_score_map = 
  let score_map = ref IntMap.empty in
  let alphabet_score_list = alphabet_score () in
  List.iter (fun (chr,scr) -> score_map := (IntMap.add chr scr !score_map)) alphabet_score_list;
  !score_map
;;

let score_name (name: string) : int =
  let sum = ref 0 in
  String.iter (fun car -> sum := !sum + (IntMap.find car char_score_map)) (String.lowercase name);
  !sum
;;

let read_list (filepath: string) : string list =
  let in_channel = open_in filepath in
  let name_list = ref [] in
    try 
      while true do
        let line = String.trim (input_line in_channel) in
        let names = Str.split (Str.regexp ",") line in
        let cleaned_names = 
          List.map (fun s -> Str.global_replace (Str.regexp "\"") "" s) names
        in
        let scored_names =
          List.map (String.lowercase) cleaned_names
        in
        name_list := (List.append cleaned_names !name_list)
      done;
      []
    with End_of_file ->
      close_in in_channel;
      let sorted_list = List.sort (String.compare) !name_list in
      (*Printf.printf "%s\n" (List.hd (List.tl sorted_list))*)
      sorted_list
;;

let score_list (lst: string list) : int = 
  let sum = ref 0 in
  List.iteri (fun ind name -> sum := !sum + ((ind+1) * (score_name name))) lst;
  !sum
;;

Printf.printf "Score: %d\n" (score_list (read_list filepath)) ;;