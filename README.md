# 42_tests

This site is my personal testing/evaluating site for 42 projects.

If you like it - it would be nice of you to leave a star :)

I'm still at the beginning of setting this up - so if you have any ideas / add ons - let me know.

general tests:
- nm -u program // to see the external used functions
- input: wrong argc, digits mixed with letters
- check function limits (usleep has limit uint max for example)
- Check with ulimits
- Check with valgrind (also with options like --track-fds=yes for open file descriptors)
	- valgrind --leak-check=full --show-leak-kinds=all --track-fds=yes
- Check with funcheck (is limited with multiprocess stuff)
- Check edgecases (INT_MAX, INT_MIN)
	- Int min: -2147483648
	- Int max: 2147483647
- Check not allowed input (empty quotes "", " ", wrong signs)
	- "" shouldn't be handled as 0
- Check too many/less arguments

Check the code:
- Search for unprotected malloc / functions (even printf/write can fail - so let the evaluated people argue why they choose to not protect something - mallocs have always to be protected)
- Check if errors are printed in Standard error (fd=2)
- Check exits in case of error (especially if exit is not allowed)
- Let some malloc/function fail manually and see if everything is freed correctly (you can use static ints if some function is called more than once and for example let the 4. call of the function fail with some if + return/exit function which is used at that point. Best place is to put it just before the malloc / function.

Know what you are doing - learn about your testing tools!
If you haven't accomplished a project - maybe try to test some project you find on github.

tests specially for the project - see other files in the github project
