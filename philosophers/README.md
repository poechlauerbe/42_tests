Special tests for the 42 Philosopher project in C:

Also see the general tests for all projects.

test with valgrind --tools=helgrind (for threads - seems to be more precise than fsanitize)
(if necessary put an usleep in the checker function - mine only worked then)
test with valgrind (for malloc errors)

Use visualizer like https://nafuka11.github.io/philosophers-visualizer/ (to see if the patterns seem right)

Use tester like https://github.com/dantonik/42-philosophers-tester

Allowed functions:
memset, printf, malloc, free, write,
usleep, gettimeofday, pthread_create,
pthread_detach, pthread_join, pthread_mutex_init,
pthread_mutex_destroy, pthread_mutex_lock,
pthread_mutex_unlock

Test on your own if a synchronization for odd numbers is implemented:
- Testcase: ./philo 3 650 200 100 5 // at least repeating it 5-10 times (no one should die) - in case of problems use the visualizer

NO exit function ALLOWED!!!!

Check in the code if this functions are protected/the errors are handled:
- malloc
- usleep (will fail if input is higher than unsigned int max)
- gettimeofday
- pthread_create (if this fails the loop with pthread_join/pthread_detach has to have a changed value - only wait for the created values)
- pthread_mutex_init
