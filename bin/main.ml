(**************************************************************************)
(*                                                                        *)
(*                       CSE 505 -- A2: Adventure                         *)
(*                                                                        *)
(*                      Your user interface -- the REPL                   *)
(*                                                                        *)
(*   Play with "make play".  All printing belongs here (or in modules of  *)
(*   your own).                                                           *)
(*                                                                        *)
(**************************************************************************)

open Engine

(* [play g st] runs the read-eval-print loop: read a command from the player,
   parse it with [Command.parse], run it with [Command.run_command], print the
   result, and repeat until the player quits. *)
let play (g : State.game) (st : State.state) : unit =
  failwith "Unimplemented: play"

let () =
  print_endline "Welcome to the adventure game!";
  print_endline "Which adventure file would you like to play?";
  print_string ">> ";
  match read_line () with
  | exception End_of_file -> ()
  | file -> (
      match State.from_file (String.trim file) with
      | Ok g -> play g (State.init_state g)
      | Error msg -> print_endline ("Could not load the adventure: " ^ msg))
