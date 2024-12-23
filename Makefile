# Set environment variables from .env file.
include .env.public

# The default shell is `/bin/sh` but can be changed using the `SHELL` variable.
SHELL = /bin/bash

# This sets the `-s` flag for every make invocation, ensuring that all targets run silently.
MAKEFLAGS += -s

# Use `*` wild card to search file system for matching filenames.
FILES = $(wildcard src/*.txt)

MAKE_VAR = I'm from make

# Set environment variable for all shell commands run in the scope of makefile. This variable is not set in the main shell. 
export FAREWELL = See you around!

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

environment_variables:
	# Environment variables available in current shell are automatically available in make. For example, if I run `export GREETING="Hello, World!"` in the terminal, I can print that environment variable to the console from make.
	echo "$(GREETING)"
	echo "$(FAREWELL)"
	# `PUBLIC` variable is available because it was set by `include .env.public` at the top of the file.
	echo "$(PUBLIC)"

# `MAKE` is a special variable which allows to make nested make calls with make flags inherited from the main make call.
nested_make:
	$(MAKE) pre1	
	echo "doing some stuff..."
	$(MAKE) pre2	

# `clean` is often used as a target that removes the output of other targets.
clean:
	rm src/*.txt
