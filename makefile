# Use Clang compiler
CC=clang
# use options 
CFLAGS=-g -Wall
# directory variable
SRC=src
# directory variable
OBJ=obj
# SRCS equal all files in SRC var that end in .c
SRCS=$(wildcard $(SRC)/*.c)
# for every file that matches the src/*.c pattern in SRCS, create a matching .o file in OBJ directory
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))
BINDIR=bin
BIN = $(BINDIR)/main
SUBMITNAME=project.zip

# we set up the test directory similary to how we set up the src directory
TEST=tests
# save all files that end in .c in directory TEST to variable TESTS
TESTS=$(wildcard $(TEST)/*.c)
# for every filename in TESTS that ends in .c, make a matching binary file in TEST/bin
TESTBINS=$(patsubst $(TEST)/%.c, $(TEST)/bin/%, $(TESTS))

all:$(BIN)

# if you call make release, it will change the CFLAGS to use a different optimization, not include debugging info, and will clean the directory before making bin
release: CFLAGS=-Wall -O2 -DNDEBUG
release: clean
release: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

# Finds all .c files in SRC/ directory and creates object files of the same name
$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compiles all .c files in TEST and adds them to TEST/bin. Includes libraries contained in OBJS and in -1criterion (unit test framework)
$(TEST)/bin/%: $(TEST)/%.c
	$(CC) $(CFLAGS) $< $(OBJS) -o $@ -lcriterion

test: $(TEST)/bin $(TESTBINS)
	for test in $(TESTBINS); do ./$$test; done

# Remove all files in OBJ and BINDIR directories
clean:
	$(RM) $(BINDIR)/* $(OBJ)/*

# Removes previously zipped files and created ziped file of binaries 
submit:
	$(RM) $(SUBMITNAME)
	zip $(SUBMITNAME) $(BIN)