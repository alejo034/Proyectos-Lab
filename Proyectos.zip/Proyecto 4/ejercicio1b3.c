//cambio de variables
#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#include <math.h>
#include <limits.h>
int main(void){
    int x, y, z;
    printf("ingrese un valor para x, z e y: \n");
    scanf("%d", &x); scanf("%d", &z); scanf("%d", &y);
    assert(x!=y && x!=z);
    assert(y!=z);
    int az, ax, ay;
    az = x;
    ax = y;
    ay = z;
    printf("el nuevo valor de z es: %d\n", az);
    printf("el nuevo valor de x es: %d\n", ax);
    printf("el nuevo valor de y es: %d\n", ay);
    assert(az!=z);
    assert(ax!=x);
    assert(ay!=y);
return 0;
}