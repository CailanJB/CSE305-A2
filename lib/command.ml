(**************************************************************************)
(*                                                                        *)
(*                       CSE 505 -- A2: Adventure                         *)
(*                                                                        *)
(*                         Your player commands                           *)
(*                                                                        *)
(*   Replace each [failwith] below with your implementation, and the      *)
(*   placeholder type with your own design.  command.mli fixes the names  *)
(*   and types we test against.                                           *)
(*                                                                        *)
(*   Every helper function needs a specification comment.                 *)
(*                                                                        *)
(**************************************************************************)

(* Replace with your own design: one constructor per command the writeup
   requires. *)
type command = unit

let parse (g : State.game) (s : string) : (command, string) result =
  failwith "Unimplemented: parse"

let run_command (g : State.game) (st : State.state) (c : command) :
    State.state * string =
  failwith "Unimplemented: run_command"
