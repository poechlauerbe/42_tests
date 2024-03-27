# Minishell

or like I would call it: minis-hell ;)

This is my dedicated testing site for the 42 minishell project in C.

## General

If you are evaluating somebody you can use this as an addon. __Make sure to also test what's inside the evaluation sheet!__

[Also see the general tests for all projects.](https://github.com/poechlauerbe/42_tests)

For testing use a suppression file (see folder) and something like this:
```
valgrind --suppressions=suppresion.txt --leak-check=full --show-leak-kinds=all --track-origins=yes --show-mismatched-frees=yes	--track-fds=yes ./minishell
```
You can also make a makefile rule - then you don't have to type the whole command every time.

If the evaluated people provide a suppression file - make sure to check it.

__Attention - also some standard functions like ls can leak. If not sure - check bash with valgrind and then type in the same command.__

__For testing minishell a good idea is to test the commands again in an open bash shell.__

IN PROGRESS...

### echo
1. Test if the echo is not using /bin/echo - it should print: -e hallo
```
echo -e hallo
```
2. should print directly before the prompt: hi

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
Execute exit command with or without arguments.
Repeat multiple times with different arguments.


## Some testcases:

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



Return value of a process
Execute a simple command with an absolute path like /bin/ls, or any other command with arguments but without any quotes and double quotes. Then execute echo $?
Check the printed value. You can do the same in bash in order to compare the results.
Repeat multiple times with different commands and arguments. Try some wrong commands like '/bin/ls filethatdoesntexist'
Try anything like expr $? + $?
If something crashes, select the "crash" flag.
If something doesn't work, select the "incomplete work" flag.
Signals
ctrl-C in an empty prompt should display a new line with a new prompt.
ctrl-\ in an empty prompt should not do anything.
ctrl-D in an empty prompt should quit minishell --> RELAUNCH!
ctrl-C in a prompt after you wrote some stuff should display a new line with a new prompt.
The buffer should be clean too. Press "Enter" to make sure nothing from the previous line is executed.
ctrl-D in a prompt after you wrote some stuff should not do anything.
ctrl-\ in a prompt after you wrote some stuff should not do anything.
Try ctrl-C after running a blocking command like cat without arguments or grep “something“.
Try ctrl-\ after running a blocking command like cat without arguments or grep “something“.
Try ctrl-D after running a blocking command like cat without arguments or grep “something“.
Repeat multiple times using different commands.
If something crashes, select the "crash" flag.
If something doesn't work, select the "incomplete work" flag.
Double Quotes
Execute a simple command with arguments and, this time, use also double quotes (you should try to include whitespaces too).
Try a command like : echo "cat lol.c | cat > lol.c"
Try anything except $.
If something crashes, select the "crash" flag.
If something doesn't work, select the "incomplete work" flag.
Single Quotes
Execute commands with single quotes as arguments.
Try empty arguments.
Try environment variables, whitespaces, pipes, redirection in the single quotes.
echo '$USER' must print "$USER".
Nothing should be interpreted.
env
Check if env shows you the current environment variables.
export
Export environment variables, create new ones and replace old ones.
Check the result with env.
unset
Export environment variables, create new ones and replace old ones.
Use unset to remove some of them.
Check the result with env.
cd
Use the command cd to move the working directory and check if you are in the right directory with /bin/ls
Repeat multiple times with working and not working cd
Also, try '.' and '..' as arguments.
pwd
Use the command pwd.
Repeat multiple times in different directories.
Relative Path
Execute commands but this time use a relative path.
Repeat multiple times in different directories with a complex relative path (lots of ..).
Environment path
Execute commands but this time without any path (ls, wc, awk and so forth).
Unset the $PATH and ensure commands are not working anymore.
Set the $PATH to a multiple directory value (directory1:directory2) and ensure that directories are checked in order from left to right.
Redirection
Execute commands with redirections < and/or >
Repeat multiple times with different commands and arguments and sometimes change > with >>
Check if multiple tries of the same redirections fail.
Test << redirection (it doesn't have to update the history).
Pipes
Execute commands with pipes like 'cat file | grep bla | more'
Repeat multiple times with different commands and arguments.
Try some wrong commands like 'ls filethatdoesntexist | grep bla | more'
Try to mix pipes and redirections.
Go Crazy and history
Type a command line, then use ctrl-C and press "Enter". The buffer should be clean and there should be nothing left to execute.
Can we navigate through history using Up and Down? Can we retry some command?
Execute commands that should not work like 'dsbksdgbksdghsd'. Ensure minishell doesn't crash and prints an error.
'cat | cat | ls' should behave in a "normal way".
Try to execute a long command with a ton of arguments.
Have fun with that beautiful minishell and enjoy it!
Environment variables
Execute echo with some environment variables ($variable) as arguments.
Check that $ is interpreted as an environment variable.
Check that double quotes interpolate $.
Check that USER exists. Otherwise, set it.
echo "$USER" should print the value of the USER variable.
Bonus
Evaluate the bonus part if, and only if, the mandatory part has been entirely and perfectly done, and the error management handles unexpected or bad usage. In case all the mandatory points were not passed during the defense, bonus points must be totally ignored.

And, Or
Use &&, || and parenthesis with commands and ensure minishell behaves the same way bash does.
Wildcard
Use wildcards in arguments in the current working directory.
Surprise! (or not...)
Set the USER environment variable.
echo "'$USER'" should print the value of the USER variable.
echo '"$USER"' should print "$USER".
