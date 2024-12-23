.PHONY: greetings clean

greetings:
	echo "Hello, World" > greetings.txt

# `clean` is often used as a target that removes the output of other targets.
clean:
	rm greetings.txt
