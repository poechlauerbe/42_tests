# Minishell

or like I would call it: minis-hell ;)

This is my dedicated testing site for the 42 minishell project in C.

## General

If you are evaluating somebody you can use this as an addon. __Make sure to also test what's inside the evaluation sheet!__

[Also see the general tests for all projects.](https://github.com/poechlauerbe/42_tests)

For testing use a suppression file (see folder) and something like this:
```
valgrind --suppressions=suppression.txt --leak-check=full --show-leak-kinds=all --track-origins=yes --show-mismatched-frees=yes	--track-fds=yes ./minishell
```
You can also make a makefile rule - then you don't have to type the whole command every time.

If the evaluated people provide a suppression file - make sure to check it.

__Attention - also some standard functions like ls can leak. If not sure - check bash with valgrind and then type in the same command.__

__For testing minishell a good idea is to test the commands again in an open bash shell and compare the output.__

__Check return values with:__
```
echo $?
```

Allowed functions:
> add_history, access, chdir, close, closedir, dup, dup2, execve, exit, fstat, fork, free, getcwd, getenv, ioctl, isatty, kill, lstat, malloc, opendir, perror, pipe, printf, read, readdir, readlink, rl_clear_history, rl_on_new_line, rl_redisplay, rl_replace_line, sigaction, sigaddset, sigemptyset, signal, stat, strerror, tcgetattr, tcsetattr, tgetent, tgetflag, tgetnum, tgetstr, tgoto, tputs, ttyname, ttyslot, unlink, wait, wait3, wait4, waitpid, write

Check for allowed functions
```
nm -u
```

### General input

1. tabs check (remove semicolon after copying input)
```
			;
```
2. space (remove semicolon after copying input)
```
               ;
```
3. empty Prog (error expected)
```
""
```
4. empty Prog
```
" "
```
5. non existing command: (echo $? - should show 127)
```
asdf
```

### echo
1. Test if the echo is not using /bin/echo - it should print: -e hallo
```
echo -e hallo
```
2. should print directly before the prompt: "hi"

```
echo -nnnnnnnnnn -n -n -n -nnnnnnnnn hi
```
3. should print a new line
```
echo
```
4. should print a no new line - just the prompt
```
echo -n
```
5. should print a new line
```
echo ""
```

### exit
Check always with - best way to test exit: open minishell inside minishell and check the return value with:
```
echo $?
```
1. exit with no arguments - the return value is the return value of the last command. (example: adsf - return value is 127)
```
exit
```
2. exit with numeric arguments:
	- exit 123 - return value should be 123
```
exit 123
```
	- exit 257 -return value should be 1
```
exit 257
```
	- exit with value bigger than long max - return value 1 and exit
```
exit 1111111111111111111111111111111111
```
3. exit with wrong arguments:
	- exit asdf - exit and return value 2
```
exit asdf
```
	- no exit and return value 1
```
exit 123 asdf
```
4. exit in pipe - shouldn't exit and print anything:
```
exit | exit | exit
```

### Signals
1. Check for correct implementation of signal handling in case of minishell in minishell.
```
./minishell
```
Open minishell in minishell. presst Ctrl + c

Tip for executing with an non-english keayboard to do sigquit: switch to english keyboard ;)

### Double Quotes
```
echo "" "        h           a           "
```
should output something different than:
```
echo          h           a           "
```

### Single Quotes




### export



### cd



### pwd


### Environment path



### Redirection


### Pipes


### Environment variables



## Some go crazy

1. no sigpipe error
```
cat | cat | ls
```

2. no leaks
```
echo hi | < exist
```
```
echo hi | < not_exist
```
3. command should be executed
```
export a="s -lsa"
l$a
```

echo hi < nonexist1 <nonexist2
