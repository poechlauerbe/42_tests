# 42 Philosophers tests/evaluation

IN PROGRESS

This is my dedicated testing site for the 42 Cub3D project in C.

If you are evaluating somebody you can use this as an addon. __Make sure to also test what's inside the evaluation sheet!__

[Also see the general tests for all projects.](https://github.com/poechlauerbe/42_tests)

## general stuff

1. Check without arguments
```
valgrind --leak-check=full --show-leak-kinds=all --track-fds=yes --track-origins=yes ./cub3D
```


## Check the code:

1. Check in the code if this functions are protected/the errors are handled:
- malloc

2. Check if the errors are handled properly and it will not come to leaks
