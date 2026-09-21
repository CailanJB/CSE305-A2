(**************************************************************************)
(*                                                                        *)
(*                       CSE 505 -- A2: Adventure                         *)
(*                                                                        *)
(*                     Your game state -- the model                       *)
(*                                                                        *)
(*   Replace each [failwith] below with your implementation, and the two  *)
(*   placeholder types with your own design.  state.mli fixes the names   *)
(*   and types we test against; you may ADD declarations to it, but not   *)
(*   change the ones that are there.                                      *)
(*                                                                        *)
(*   No printing to stdout/stderr here.                                   *)
(*   Every helper function needs a specification comment.                 *)
(*                                                                        *)
(**************************************************************************)

(* Replace with your own design: everything about the adventure itself. *)
type game = unit

(* Replace with your own design: everything that changes as the player plays. *)
type state = unit

let from_file (fname : string) : (game, string) result =
  failwith "Unimplemented: from_file"

let from_string (s : string) : (game, string) result =
  failwith "Unimplemented: from_string"

let win_msg (g : game) : string = failwith "Unimplemented: win_msg"
let init_state (g : game) : state = failwith "Unimplemented: init_state"

let desc_item (i : int) (g : game) : (string, string) result =
  failwith "Unimplemented: desc_item"

let item_name (i : int) (g : game) : (string, string) result =
  failwith "Unimplemented: item_name"

let find_item_by_name (g : game) (name : string) : (int, string) result =
  failwith "Unimplemented: find_item_by_name"

let desc_room (i : int) (g : game) (st : state) : (string, string) result =
  failwith "Unimplemented: desc_room"

let exits (i : int) (g : game) : int list option =
  failwith "Unimplemented: exits"

let cur_score (st : state) : int = failwith "Unimplemented: cur_score"
let cur_room (st : state) : int = failwith "Unimplemented: cur_room"
let inventory (st : state) : int list = failwith "Unimplemented: inventory"

let go (dir : string) (g : game) (st : state) : (state, string) result =
  failwith "Unimplemented: go"

let take (i : int) (g : game) (st : state) : (state, string) result =
  failwith "Unimplemented: take"

let drop (i : int) (g : game) (st : state) : (state, string) result =
  failwith "Unimplemented: drop"

let has_won (g : game) (st : state) : bool = failwith "Unimplemented: has_won"

let num_turns (g : game) (st : state) : int =
  failwith "Unimplemented: num_turns"

let quit (g : game) (st : state) : state = failwith "Unimplemented: quit"
