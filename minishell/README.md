
For testing use a suppression file (see folder) and something like this:

valgrind --suppressions=valgrind_ignore_leaks.txt --leak-check=full --show-leak-kinds=all --track-origins=yes --show-mismatched-frees=yes	--track-fds=yes ./minishell

You can also make a makefile rule - then you don't have to type the whole command every time.

If the evaluated people provide a suppression file - make sure to check it.

Attention - also some standard functions like ls can leak. If not sure - check bash with valgrind and then type in the same command.


IN PROGRESS...


Some testcases:

cat | cat | ls // no sigpipe error

echo hi | < exist // no sigpipe error

export a="s -lsa"
l$a // command should be executed

echo hi < nonexist1 <nonexist2