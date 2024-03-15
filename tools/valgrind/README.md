# Valgrind

Valgrind is in my opinion one of the most important tools available on linux for testing leaks, open file descriptors, etc.

Also see in terminal:
```
man valgrind
```


## Standard use:
```
valgrind ./program
```
__ATTENTION: Valgrind can slow down the execution of your program immensly!__

## Tools = 1. option:

- --tool=<toolname> [default: memcheck]

## --verbose -v

## --quiet -q

## --trace-children=<yes|no> [default: no]

__ATTENTION: If you use the the terminal of VSCode - you will have some extra file descriptors - so better use a terminal outside of VSCODE like bash or zsh!__
