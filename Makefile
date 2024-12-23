.PHONY: all greetings clean variables print

# Use `*` wild card to search file system for matching filenames.
FILES := $(wildcard src/*.txt)

# The first target is executed by default, while only `make' is run in the terminal.
all: greetings clean

greetings:
	echo "target name: $@"
	echo "Hello! I hope you're having a fantastic day!" > src/greetings.txt

variables:
	echo "target name: $@"
	echo "FILES: $(FILES)"

# Print out file information about every text file in src directory.
print: $(FILES)
	ls -la $?

# `clean` is often used as a target that removes the output of other targets.
clean:
	echo "target name: $@"
	rm greetings.txt
