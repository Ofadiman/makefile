.PHONY: greetings clean

FILES := one.txt two.txt three.txt

greetings:
	echo "Hello, World" > greetings.txt

variables:
	echo "FILES: ${FILES}"
	echo "FILES: $(FILES)"

# `clean` is often used as a target that removes the output of other targets.
clean:
	rm greetings.txt
