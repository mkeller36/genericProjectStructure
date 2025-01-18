#include "simpleCalculator.h"


int main(void){
int y = simpleCalculator('+',1,4);
return y;
}

int simpleCalculator(char arg, int num1, int num2){
    if(arg == '+'){
        return num1 + num2;
    }
    return 0;
}