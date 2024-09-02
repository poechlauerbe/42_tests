# 42 so long tests/evaluation

Subject Version: 3 (English)

This is my dedicated testing site for the 42 so long project in C.

If you are evaluating somebody you can use this as an addon. __Make sure to also test what's inside the evaluation sheet!__

[Also see the general tests for all projects.](https://github.com/poechlauerbe/42_tests)

IN PROGRESS!!

- test with valgrind
```
valgrind ./so_long
```
With valgrind test:
- Create/rename and open map without .ber ending - shouldn't open
- Create/rename and open map with .ber + something ending - shouldn't open
- Create/rename and open map .ber.ber - should open
- Create/rename and open map .ber - discussable if it should open
- Test Esc Button
- Test Click on x
- Rename one of the sprites and then open the map

- Bonus rule should be extra!

- Change the permissions of a map:
```
chmod 000 invalid_no_rights.ber
```
