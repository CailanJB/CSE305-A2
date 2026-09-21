(**************************************************************************)
(*                                                                        *)
(*                       CSE 505 -- A2: Adventure                         *)
(*                                                                        *)
(*                          Local test runner                             *)
(*                                                                        *)
(*   Run with "make test" (or "dune test").  You do not need to edit this *)
(*   file -- write your tests in test_student.ml, and tests of your own   *)
(*   declarations in test_helpers.ml.                                     *)
(*                                                                        *)
(**************************************************************************)

let () =
  ignore
    (OUnit.run_test_tt_main
       (OUnit.TestList
          [
            OUnit.TestLabel ("graded", OUnit.TestList Test_student.all_tests);
            OUnit.TestLabel ("helpers", OUnit.TestList Test_helpers.all_tests);
          ]))
