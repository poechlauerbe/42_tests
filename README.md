# 42_tests

This site is my personal testing/evaluating site for 42 projects.

I'm still at the beginning of setting this up - so if you have any ideas / add ons - let me know.

general tests:
- nm -u program // to see the external used functions
- input: wrong argc, digits mixed with letters
- check function limits (usleep has limit uint max for example)
- Check with ulimits
- Check with valgrind
- Check with funcheck (is limited with multiprocess stuff)

Check the code:
- Search for unprotected malloc / functions (even printf/write can fail - so let the evaluated people argue why they choose to not protect something - mallocs have always to be protected)
- Check if errors are printed in Standard error (fd=2)
- Check exits (especially if exit is not allowed)
- Let some malloc/function fail manually and see if everything is freed correctly (you can use static ints if some function is called more than once and for example let the 4. call of the function fail with some if + return/exit function which is used at that point. Best place is to put it just before the malloc / function.

test specially for the project - see other files in the github project
