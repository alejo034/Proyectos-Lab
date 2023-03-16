#include<stdio.h>

#include<assert.h>
#include <limits.h>

int pedirEntero (void){
  int x;
  printf("Ingrese un valor \n");
  scanf("%d",&x);
return x;
}
int main(void){
    int x, y, ax, ay;
    x = pedirEntero();
    y = pedirEntero();
    ax = x;
    ay = y;
    assert(ax==x && ay==y);
    x = x + 1;
    y = ax + ay;
    assert(x==ax+1 && y==ax+ay);
    printf("los nuevos valores de x e y son: %i %i", x, y);
    return 0;
}  