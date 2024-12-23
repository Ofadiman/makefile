# Makefile

Repository contains code examples from [makefile tutorial](https://makefiletutorial.com/) modified for my personal use cases.

## Makefile Syntax

```Make
targets: prerequisites
    command
    command
    command
```

- The `targets` are file names, separated by spaces. Typically, there is only one per rule.
- The `commands` are a series of steps typically used to make the target(s). These need to start with a tab character, not spaces.
- The `prerequisites` are also file names, separated by spaces. These files need to exist before the commands for the target are run. These are also called dependencies
