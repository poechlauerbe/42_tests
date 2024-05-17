# Minishell

Subject Version: 7.1 (English)

or like I would call it: minis-hell ;)

This is my dedicated testing site for the 42 minishell project in C.

## General

If you are evaluating somebody you can use this as an addon. __Make sure to also test what's inside the evaluation sheet!__

[Also see the general tests for all projects.](https://github.com/poechlauerbe/42_tests)

For testing use a suppression file (see folder) and something like this (with this commands the leak of commands like ls will not be shown):
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
6. error with pipe:
```
| echo hi
```
7. error with pipe:
```
echo hi | echo hi |
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
4. exit in pipe - shouldn't exit and shouldn't print anything:
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
echo          h           a
```

- should print an error:
```
"echo hi"
```
- should print: hi
```
"echo" hi
```

- should print a list of files in the actual directory:
```
"ls"
```

```
e"ch"o hi
```

### Single Quotes

- should print: hi
```
'echo' hi
```
- should print a list of files in the actual directory:
```
'ls'
```
- should print an error:
```
'echo hi'
```
- should print without expanding variables:
```
echo hi '$USER is great, home is $HOME'
```

### export

- check for resplitting
```
export a="s -lsa"
l$a
```

- check to not crash:
```
export a='"'
$a
```
- check to not crash:
```
export a='"'
echo $a
```

### cd

- special case which can crash a minishell:
```
mkdir a
cd a
mkdir b
cd b
rm -rf ../../a
```
- after all that this should cause an error:
```
cd ..
```
- after all that - this should work:
```
pwd
```
- after all that this sould work:
```
cd /bin/
```

### pwd
- invalid option error:
```
pwd -adsf
```
- prints working directory
```
pwd asdf asdf adsf
```

### Relative path
- go to /bin - then you can use standard commands
```
cd /bin
```
- Now test with relative path:
```
./ls
```
```
./cat
```

### Environment path
- first remove PATH - the commands shouldn't work after that.
```
unset PATH
```
- built-ins should work
```
echo hi
```
```
env
```

- then test things like - should always print error:
```
ls
```
```
cat
```
- this should still work:
```
/bin/ls
```
```
/bin/cat
```
- change to /bin/ - inside this directory the standard commands should work:
```
ls
```
```
cat
```

### Redirection

#### Input
- make sure to create the "exists"
```
< nonexistant
```
```
< exists
```
```
<nonexistant
```
```
<exists
```

```
< nonexist | < exists | < nonexistent
```

#### Output
- should print into a: hi (do this twice - it still should be only one hi inside)
```
echo hi > a
```
- should create 3 files(1,2,3) and write into three: hi this is a test
```
echo hi >1 >2 >3 this is a test
```
#### Append
- should print into b: hi (do this twice -there should be 2x hi inside)
```
echo hi > b
```
- should create 3 files(4,5,6) and write into three: hi this is a test (do it twice - and the message should be twice inside)
```
echo hi >>4 >>5 >>6 this is a test
```

#### Heredoc
- delimiter should be $USER
```
cat << $USER
```
- delimiter EOF (write f.e. $USER into the heredoc - should be expanded)
```
cat << EOF
```
- delimiter EOF (write f.e. $USER into the heredoc - should not be expanded)
```
cat << EOF""
```
- delimiter is "a c" without quotes
```
cat << "a c"
```
- check with "EOF " and " EOF" when in heredoc without quotes but with the spaces - shouldn't quit - quit only with "EOF"
```
cat << EOF
```
- press ctrl + d inside heredoc - should quit heredoc with a warning but not minishell
```
cat << EOF
```
-
```
cat << EOF
```
- check f.e. with ctrl + c if all heredocs are closed with one command
```
<< 1 | << 2 | << 3 cat
```

### Pipes

- basic pipe:
```
echo hi your pipe should work | cat | cat | cat | cat | cat | cat
```
- should stop after 5 seconds (check if child processes are processed in paralell)
```
 sleep 5 | sleep 5
```
- should print some garbage - dev/urandom is an endless file ("tail" instead of "head" - you can only stop with Ctrl + C)
```
cat /dev/urandom | head
```

### Environment variables
- should print with expanding the variables
```
echo hi "$USER is great, home is $HOME    and PWD:" $PWD
```
- command should be executed (resplitting)
```
export a="s -lsa"
```
```
l$a
```
- should print only new line:
```
echo $""
```
- should print $:
```
echo $
```

## Some go crazy

1. no sigpipe error when pressing enter (you have to press enter twice to get out of the cat's execution)
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

3. Ambigious redirection
```
export a="a b"
> $a
```
- should print three error messages:
```
export a="a b"
echo > $a | echo > $a | echo > $a | echo hi
```


echo hi < nonexist1 <nonexist2


__If you are not sure about some behaviour - compare with BASH!__
