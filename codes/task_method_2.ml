let extract_numbers_from_joy line =
  let reg = Str.regexp "[0-9]+" in
  let rec helper acc pos =
    try
      let _ = Str.search_forward reg line pos in
      let match_str = Str.matched_string line in
      let number = int_of_string match_str in
      helper (number :: acc) (Str.match_end ())
    with Not_found -> List.rev acc
  in
  helper [] 0

let handle_joy_line line =
  let numbers = extract_numbers_from_joy line in
  let joy_sum = List.fold_left (+) 0 numbers in
  (numbers, joy_sum)

let get_joy_lines_from_terminal () =
  let joy_lines = ref [] in
  try
    while true do
      let joy_line = input_line stdin in
      if joy_line = "STOP" then raise End_of_file;
      joy_lines := joy_line :: !joy_lines
    done; !joy_lines
  with End_of_file ->
    List.rev !joy_lines

let get_joy_lines_from_file filename =
  let joy_lines = ref [] in
  try
    let chan = open_in filename in
    try
      while true do
        joy_lines := input_line chan :: !joy_lines
      done; !joy_lines
    with End_of_file ->
      close_in chan;
      List.rev !joy_lines
  with Sys_error msg ->
    print_endline ("Error reading file: " ^ msg);
    []

let joy_main () =
  let joy_lines =
    if Array.length Sys.argv > 1 then
      let filename = Sys.argv.(1) in
      get_joy_lines_from_file filename
    else
      get_joy_lines_from_terminal ()
  in

  let results = List.map handle_joy_line joy_lines in

  let all_sums = List.map snd results in
  let grand_total = List.fold_left (+) 0 all_sums in

  List.iter (fun (numbers, joy_sum) ->
    let number_strings = List.map string_of_int numbers in
    if numbers = [] then print_endline "= 0"
    else print_endline (String.concat " + " number_strings ^ " = " ^ string_of_int joy_sum)
  ) results;

  let all_sum_strings = List.map string_of_int all_sums in
  if all_sums = [] then print_endline "= 0"
  else print_endline (String.concat " + " all_sum_strings ^ " = " ^ string_of_int grand_total)

joy_main()