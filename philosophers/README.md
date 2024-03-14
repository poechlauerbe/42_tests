# 42 Philosophers tests/evaluation

This is my dedicated testing site for the 42 Philosopher project in C:

[Also see the general tests for all projects.](https://github.com/poechlauerbe/42_tests)

## general stuff

1. Check for data races and lock errors with valgrind:
```valgrind --tools=helgrind```
	The execution of helgrind will slow down the whole execution of the process - so append the time to die a little
	_If you only get one statement that somebody died there is a big chance that you have to modify the monitoring loop with something like usleep(100). Don't forget to remove it for the standard test!_

- test with valgrind (for malloc errors)

- Use visualizer like https://nafuka11.github.io/philosophers-visualizer/ (to see if the patterns seem right)

- Use tester like https://github.com/dantonik/42-philosophers-tester

## Allowed functions:
> memset, printf, malloc, free, write, usleep, gettimeofday, pthread_create, pthread_detach, pthread_join, pthread_mutex_init, pthread_mutex_destroy, pthread_mutex_lock, pthread_mutex_unlock

__NO exit function ALLOWED!!!!__

## Some testcases and why (test it with and without helgrind):

1. Test on your own if a synchronization for odd numbers is implemented:
```
./philo 3 650 200 100 5

	at least repeating it 5-10 times (no one should die) - in case of problems use the visualizer

2. Test if the process is stopped immedeatly after someone dies:
```
./philo 3 650 200 10000 2

	if you have to wait ten seconds until the program ends - it's not good

3. Test if the process is stopped immedeatly after someone dies:
```
./philo 3 650 20000 100 2

	somebody should die during eating and the process should be stopped

4. Some other testcase:
```
./philo 2 650 600 200 2

	dietime should be arround 650. (max + 10ms)


Check in the code if this functions are protected/the errors are handled:
- malloc
- pthread_create (if this fails the loop with pthread_join/pthread_detach has to have a changed value - only wait for the created values)
- pthread_mutex_init (if the second mutex init fails, make sure the first one is destroyed)

I also implemented checking if this functions fail:
- usleep (will fail if input is higher than unsigned int max)
- gettimeofday
