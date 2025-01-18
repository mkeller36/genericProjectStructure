#include <criterion/criterion.h>

#include "../src/simpleCalculator.h"

extern int simpleCalculator(char arg, int num1, int num2);


Test(simpletests, addition){
    printf("Addition tests\n");
    int n = simpleCalculator('+', 2, 4);
    cr_assert(n = 6);
    cr_assert(n = 42,"This should fail, do not worry");
}