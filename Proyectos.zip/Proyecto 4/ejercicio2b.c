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
    int x, y, z, ax, ay, az;
    x = pedirEntero();
    y = pedirEntero();
    z = pedirEntero();
    ax = x;
    ay = y;
    az = z;
    assert(ax==x);
    assert(ay==y);
    assert(az==z);
    x = ay;
    y = ax + ay + az;
    z = ax + ay;
    assert(x==ay);assert(y==ax+ay+az);assert(z==ax+ay);
    printf("los nuevos valores de x, z e y son: %i %i %i", x, z, y);
    return 0;
}