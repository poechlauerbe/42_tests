# 42 Philosophers tests/evaluation

This is my dedicated testing site for the 42 Philosopher project in C.

If you are evaluating somebody you can use this as an addon. __Make sure to also test what's inside the evaluation sheet!__

[Also see the general tests for all projects.](https://github.com/poechlauerbe/42_tests)

## general stuff

1. Check for data races and lock errors with valgrind:
```
valgrind --tool=helgrind ./philo
```
- The execution of helgrind will slow down the whole execution of the process - so append the time to die a little.
- _If you only get one statement that somebody died there is a big chance that you have to modify the monitoring loop with something like usleep(100). Don't forget to remove it for the standard test!_

- test with valgrind (for leaks) - in this case don't pay attention to the output - valgrind messes that up

- Use visualizer like https://nafuka11.github.io/philosophers-visualizer/ (to see if the patterns seem right)

- Use tester like https://github.com/dantonik/42-philosophers-tester (if something fails - try to reproduce it by hand, only use the hardcore tests for fun ;) )

## Allowed functions:
> memset, printf, malloc, free, write, usleep, gettimeofday, pthread_create, pthread_detach, pthread_join, pthread_mutex_init, pthread_mutex_destroy, pthread_mutex_lock, pthread_mutex_unlock

__NO exit function ALLOWED!!!!__

## Some testcases and why (test it with and without helgrind):

1. Test on your own if a synchronization for odd numbers is implemented:
- at least repeating it 5-10 times (no one should die) - in case of problems use the visualizer
```
./philo 3 650 200 100 5
```

2. Test if the process is stopped immedeatly after someone dies:
- if you have to wait ten seconds until the program ends - it's not good
```
./philo 3 650 200 10000 2
```

3. Test if the process is stopped immedeatly after someone dies:
- somebody should die during eating and the process should be stopped
```
./philo 3 650 20000 100 2
```

4. Some other testcase:
- dietime should be arround 650 (max + 10ms)
```
./philo 2 650 600 200 2
```
- Shouldn't run - eventually print some error:
```
./philo 2 800 200 200 0
```

- Shouldn't run and print some error:
```
./philo 3 600 200 200 -
```

Should print some error:
```
./philo 3 -600 200 200
```

5. Test with ulimit to check if the mallocs are protected
- __with ulimit you have to play arround a little to get the right size!!__

- just test if you get some error if there is not enough memory 
```
(ulimit -v 10000 ; ./philo 5 800 200 200)
```

```
(ulimit -v 130000 ; valgrind ./philo 5 800 200 200)
```

- Should print that the creation fails, but no other error.
```
(ulimit -v 520000 ; valgrind --tool=helgrind ./philo 200 800 200 200)
```

## Check the code:

1. Make sure there is no exit function

2. Check in the code if this functions are protected/the errors are handled:
- malloc
- pthread_create (if this fails the loop with pthread_join/pthread_detach has to have a changed value - only wait for the created values)
- pthread_mutex_init (if the second mutex init fails, make sure the first one is destroyed)

3. Check if the error is handled properly and it will not come to leaks

4. Check if the error is returned properly to the main.

_I also implemented checking if this functions fail:_
- _usleep (will fail if input is higher than unsigned int max)_
- _gettimeofday_
