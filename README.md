# 42_tests

This site is my personal testing/evaluating site for 42 projects.

I'm still at the start of setting this up - so if you have any ideas / add ons - let me know.

general tests:
- nm -u program // to see the external used functions
- input: wrong argc, digits mixed with letters
- check function limits (usleep has limit uint max for example)
- Check with ulimits
- Check with valgrind
- Check with funcheck (is limited with multiprocess stuff)
- Search for unprotected malloc / functions (even printf/write can fail - so let the evaluated people argue why the choose to not protect the malloc)
- Check if errors are printed in Standard error (fd=2)
- Check exits (especially if exit is not allowed)
- Let some function fail manually and see if everything is freed correctly (you can use static ints if some function is called more than once and for example let the 4. call of the function fail with some if + return/exit function which is used at that point
- 
