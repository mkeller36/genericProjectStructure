CC=clang						# Use GCC compiler
CFLAGS=-g -Wall					# 
OBJS=allocator.o memtest.o		# variable for .o files
BIN = main						# variable for binary
SUBMITNAME=project.zip			

all:$(BIN)

main: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o main

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) main *.o *.dSYM

submit:
	$(RM) $(SUBMITNAME)
	zip $(SUBMITNAME) $(BIN)