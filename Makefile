# ---------------------------------------------------------------------------
#      make build    compile your engine, REPL and tests
#      make play     play an adventure with your engine
#      make test     run your test suite (test/test_student.ml)
#      make fmt      format your code
#      make handin   produce handin.tgz to upload to Autolab
#      make clean    remove build output and handin.tgz
# ---------------------------------------------------------------------------

HANDIN  := handin.tgz

#  What goes in the tarball.  bin/ is there for the grader who plays your REPL;
#  example_games/ holds your own adventure and the files your tests load.
#  provided/ is there so the tarball is a project that builds on its own --
#  test/dune names that library, so leaving it out breaks "dune build" for
#  whoever unpacks this.  We grade your lib/, test/test_student.ml and
#  example_games/ against our own copy of provided/, so editing it changes
#  nothing.
SUBMIT  := dune-project bin lib provided test example_games a2.txt

.DEFAULT_GOAL := help
.PHONY: help build play test fmt handin clean

help:
	@echo "make build    compile your engine, REPL and tests"
	@echo "make play     play an adventure with your engine"
	@echo "make test     run your test suite"
	@echo "make fmt      format your code"
	@echo "make handin   produce $(HANDIN) to upload to Autolab"
	@echo "make clean    remove build output and $(HANDIN)"

build: clean
	dune build --profile release

play:
	dune exec bin/main.exe --profile release

test: clean
	dune test --profile release

fmt:
	@dune fmt || true

handin:
	@rm -f $(HANDIN)
	@COPYFILE_DISABLE=1 tar --no-xattrs --exclude='_build' --exclude='._*' --exclude='.DS_Store' \
		-czf $(HANDIN) $(SUBMIT)
	@echo "Created $(HANDIN).  Contents:"
	@tar -tzf $(HANDIN) | sed 's/^/  /'

clean:
	dune clean
	rm -f $(HANDIN)
