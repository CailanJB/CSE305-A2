(**************************************************************************)
(*                                                                        *)
(*                       CSE 505 -- A2: Adventure                         *)
(*                                                                        *)
(*                            Your test suite                             *)
(*                                                                        *)
(*   Add black-box tests of State here, then run them with "make test".   *)
(*   Games are loaded from ../example_games/, which is where your own     *)
(*   adventure should go too.                                             *)
(*     - define [all_tests], and export nothing else;                     *)
(*     - do NOT run the tests from this file.  run_tests.ml does that;    *)
(*     - use only what the PROVIDED state.mli and command.mli declare.    *)
(*     - test your own declarations in test_helpers.ml;                   *)
(*     - load only adventure files that follow schema.json.               *)
(*   See Part 2 of the handout.                                           *)
(*                                                                        *)
(**************************************************************************)

open OUnit
open Gameengine

(*************************************************)
(*                                               *)
(*  For each function other than provided, pick  *)
(*  some representative cases from your suite    *)
(*  above and explain, per function, what        *)
(*  makes those cases interesting: a common      *)
(*  input, a boundary case, an example from the  *)
(*  writeup, a tricky part of the algorithm, a   *)
(*  case that exercises a particular helper.     *)
(*                                               *)
(*  Make each explanation specific to the        *)
(*  function, input and output it concerns --    *)
(*  "it is a boundary case" on its own says      *)
(*  nothing.  Aim for little overlap between the *)
(*  cases you pick for one function.             *)
(*************************************************)

(*  function1:
      1.
      2.
      3.
      4.

    function2:
      1.
      2.
      3.
      4.

    function3:
      1.
      2.
      3.
      4.

    function4:
      1.
      2.
      3.
      4.

    function5:
      1.
      2.
      3.
      4.

    function6:
      1.
      2.
      3.
      4.
*)

(********************************************)
(*                Game Setup                *)
(********************************************)

(** The root of the project. The ..s get us out of the test and build
    directories. This allows us to get to the example_games directory *)
let root = Sys.getcwd () ^ "/../example_games/"

let file_from_root fn = root ^ fn

let one_room_game =
  match State.from_file (file_from_root "one_room.json") with
  | Ok g -> g
  | Error s -> failwith ("Error Parsing the One-Room Game: " ^ s)

let org_init = State.init_state one_room_game

let two_room_game =
  match State.from_file (file_from_root "two_rooms.json") with
  | Ok g -> g
  | Error s -> failwith ("Error Parsing the Two-Room Game: " ^ s)

let trg_init = State.init_state two_room_game

(*******************************************)
(*        Testing Utility Functions        *)
(*******************************************)

let assert_string_eq s1 s2 _ = assert_equal s1 s2 ~printer:(fun x -> x)
let assert_int_eq x y _ = assert_equal x y ~printer:string_of_int

(***********************************************)
(*               One-room tests                *)
(***********************************************)

let one_room_parse =
  "One Room Parsing Tests"
  >::: [
         "Winning message"
         >:: assert_string_eq "You won!" (State.win_msg one_room_game);
         "Starting Room" >:: assert_int_eq 0 (State.cur_room org_init);
       ]

(***********************************************)
(*               Two-room tests                *)
(***********************************************)

(* Play the game *)

let go_other_cmd = Command.parse two_room_game "go other"
let go_first_cmd = Command.parse two_room_game "go first"

let turn1 =
  try
    match go_other_cmd with
    | Ok cmd -> Ok (Command.run_command two_room_game trg_init cmd)
    | Error e -> Error ("Command parse error: " ^ e)
  with
  | _ -> Error "fail"

(***********************************************)
(*            Run the Tests                    *)
(***********************************************)

let all_tests : test list = [ one_room_parse ]
