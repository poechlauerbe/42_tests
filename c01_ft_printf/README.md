# 42 FT_PRINTF tests/evaluation

Subject Version: 10 (English)

ft_printf has to be tested with a main.
- check for return value. (lenght of string printed)
- tester like [francinette](https://github.com/xicodomingues/francinette/) ([install on 42 computer](https://github.com/WaRtr0/francinette-image))
- test the return values (should be the amount of chars)
- test paralell with the standard printf function from <stdio.h>

## Test main:
- change only the two statements where NULL is inside the ft_printf and printf function.
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

1. Test NULL
```
ft_printf(NULL);
```

2. Test all the different % + char
  - what happens when the char after the % is a valid format (%c, %d, ...)
  - what happens when the char after the % is an invalid format ('% ', %a, ...)

Example:
```
ft_printf("123 123 123 % 123");
```

3. Test edgecases like

```
ft_printf("%");
```