# The default shell is `/bin/sh` but can be changed using the `SHELL` variable.
SHELL = /bin/bash

# This sets the `-s` flag for every make invocation, ensuring that all targets run silently.
MAKEFLAGS += -s

# Use `*` wild card to search file system for matching filenames.
FILES = $(wildcard src/*.txt)

MAKE_VAR = I'm from make

# The first target is executed by default, while only `make' is run in the terminal.
all: pre1 pre2

pre1:
	echo "pre1"

pre2:
	echo "pre2"

greetings:
	echo "Hello! I hope you're having a fantastic day!" > src/greetings.txt

files:
	echo "FILES: $(FILES)"

# Print out file information about every text file in src directory.
print: $(FILES)
	ls -la $?

# All automatic variables are available here https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html but I don't think they are needed.
automatic_variables: pre1 pre2
	# The file name of the target of the rule (outputs: automatic_variables).
	echo $@
	# The names of all the prerequisites, with spaces between them. (outputs: pre1 pre2).
	echo $^

variables:
	# `SHELL_VAR` is only available in the current context. Next command won't be able to access `SHELL_VAR` value.
	SHELL_VAR="I'm from shell" && echo "Make variable \"$(MAKE_VAR)\", shell variable \"$$SHELL_VAR\"."

# `clean` is often used as a target that removes the output of other targets.
clean:
	rm src/*.txt
