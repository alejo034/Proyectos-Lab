#include<stdio.h>
#include<assert.h>
#include <limits.h>

int pedirEntero (void){
  int x;
  printf("Ingrese un valor \n");
  scanf("%d",&x);
return x;
}
int suma_hasta (int N){
     int i, suma;
    i= suma =0;
  while(i<=N){
    suma = suma + i;
    i = i+1;}
    return suma;
}
int main(void){
    int x;
    x = pedirEntero();
    assert(x>0);
    printf("la suma de los primeros N naturales es : %d" ,suma_hasta(x));
return 0;
}