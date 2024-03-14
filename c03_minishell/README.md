# Minishell

or like I would call it: minis-hell ;)

This is my dedicated testing site for the 42 minishell project in C.

If you are evaluating somebody you can use this as an addon. __Make sure to also test what's inside the evaluation sheet!__

[Also see the general tests for all projects.](https://github.com/poechlauerbe/42_tests)

For testing use a suppression file (see folder) and something like this:
```
valgrind --suppressions=valgrind_ignore_leaks.txt --leak-check=full --show-leak-kinds=all --track-origins=yes --show-mismatched-frees=yes	--track-fds=yes ./minishell

You can also make a makefile rule - then you don't have to type the whole command every time.

If the evaluated people provide a suppression file - make sure to check it.

Attention - also some standard functions like ls can leak. If not sure - check bash with valgrind and then type in the same command.


IN PROGRESS...


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

export a="s -lsa"
l$a // command should be executed

echo hi < nonexist1 <nonexist2
