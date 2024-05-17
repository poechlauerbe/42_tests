# 42 FT_PRINTF tests/evaluation

Subject Version: 10 (English)

ft_printf has to be tested with a main.
- check for return value. (lenght of string printed)
- tester like [francinette](https://github.com/xicodomingues/francinette/) ([install on 42 computer](https://github.com/WaRtr0/francinette-image))
- test the return values (should be the amount of chars)
- test paralell with the standard builtin from <stdio.h>

## Test main:
- change only the two statements where NULL is inside the ft_printf and printf function.
- your testing should also be with the -Werror -Wextra -Wall flags.
```
#include <stdio.h>
int main(void)
{
  int ret_val = 0;

  printf("your function:\n");
  ret_val = ft_printf(NULL);
  printf("\nReturn value of your function: %d\n", ret_val);
  printf("The standard function:\n");
  ret_val = printf(NULL);
  printf("\nReturn value of standard function: %d\n", ret_val);
}
```
