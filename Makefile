.PHONY: greetings clean

FILES := one.txt two.txt three.txt

# The first target is executed by default, while only `make' is run in the terminal.
all: greetings variables clean

greetings:
	echo "target name: $@"
	echo "Hello, World" > greetings.txt

variables:
	echo "target name: $@"
	echo "FILES: ${FILES}"
	echo "FILES: $(FILES)"

# `clean` is often used as a target that removes the output of other targets.
clean:
	echo "target name: $@"
	rm greetings.txt
