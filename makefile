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

all:$(BIN)

# if you call make release, it will change the CFLAGS to use a different optimization, not include debugging info, and will clean the directory before making bin
release: CFLAGS=-Wall -O2 -DNDEBUG
release: clean
release: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(BINDIR)/* $(OBJ)/*

submit:
	$(RM) $(SUBMITNAME)
	zip $(SUBMITNAME) $(BIN)