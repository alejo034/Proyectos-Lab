//absoluto
#include<stdio.h>
#include<assert.h>
#include <limits.h>
int main (){
    int x, b;
    printf("ingrese un numero: ");
    scanf("%d", &x);
    assert(x>INT_MIN && INT_MAX>x);
    if(x>0){
        printf("el valor absoluto de x es: %d", x);
    }
    else if (x<0){
        x= x*(-1);
        printf("el valor absoluto de x es: %d", x); 
    }
    assert(0<=x);
}