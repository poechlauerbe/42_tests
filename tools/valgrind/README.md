# Valgrind

IN PROGRESS

Valgrind is in my opinion one of the most important tools available on linux for testing leaks, open file descriptors, etc.

Also see in terminal:
```
man valgrind
```
Most of this is from the manual - and some comments from my side.

## Standard use:
```
valgrind ./program
```
__ATTENTION: Valgrind can slow down the execution of your program immensly!__
__ATTENTION: If you use the the terminal of VSCode - you will have some extra file descriptors - so better use a terminal outside of VSCODE like bash or zsh!__

## Tool selection:

- --tool=<toolname> [default: memcheck]

## Basic options:

### --help -h
- nothing to be said about that :)

### --verbose -v
- shows more details // to test

### --quiet -q
- useful for example when running scripts - it will only print something if there is an error // to test

### --trace-children=<yes|no> [default: no]
- Useful, when you have more than one process in you program.
- necessary for c02 pipex and c03 minishell

### --trace-children-skip=patt1,patt2,...
- only with --trace-children=yes

### --trace-children-skip-by-arg=patt1,patt2,...
- only with --trace-children=yes

### --child-silent-after-fork=<yes|no> [default: no]

### --vgdb=<no|yes|full> [default: yes]

#### --vgdb-error=<number> [default: 999999999]

#### --vgdb-stop-at=<set> [default: none]

### --track-fds=<yes|no|all> [default: no]

### --time-stamp=<yes|no> [default: no]

### --log-fd=<number> [default: 2, stderr]

### --log-file=<filename>

### --log-socket=<ip-address:port-number>

## ERROR-RELATED OPTIONS




## Nice stuff I don't use/define:

### --xml=<yes|no> [default: no]

#### --xml-fd=<number> [default: -1, disabled]

#### --xml-file=<filename>

#### --xml-socket=<ip-address:port-number>

#### --xml-user-comment=<string>

### --demangle=<yes|no> [default: yes]

### --num-callers=<number> [default: 12]

### --unw-stack-scan-thresh=<number> [default: 0] ,
### --unw-stack-scan-frames=<number> [default: 5]

### --error-limit=<yes|no> [default: yes]

### --error-exitcode=<number> [default: 0]

### --exit-on-first-error=<yes|no> [default: no]

### --error-markers=<begin>,<end> [default: none]

