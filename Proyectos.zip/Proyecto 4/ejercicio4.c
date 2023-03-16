#include <stdio.h>
#include <limits.h>
#include <stdlib.h>
#include <assert.h>
int pedirEntero(void){
    int x;
    printf("Ingrese un valor de\n"); 
    scanf("%d",&x);
    return x;
}

struct div_t{
    int cociente;
    int resto;
};

struct div_t division(int x, int y){
    struct div_t resultado;
    resultado.cociente = x / y;
    resultado.resto = x % y;
    return resultado;
}

int main()
{
    int x, y;
    x= pedirEntero();
    y = pedirEntero();
    assert(x>=0 && y>0);
    printf("Su cociente es %d y su resto es %d\n", division(x,y).cociente, division(x,y).resto);
    return 0;
}