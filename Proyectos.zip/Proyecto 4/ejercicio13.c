#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>
#include <limits.h>

bool is_prime(int const n)
{
    if( n <= 1)
        return false;
    for(int i = 2; i <= sqrt(n); i++)
        if(n % i == 0)
            return false;
    return true;
}
int nesimoPrimo(int N){
    int resultado, contador=0, posicion=0;
    resultado = 0;
    while ( contador < N ){
        if ( is_prime(posicion) == true){
            resultado = posicion;
            contador++;
        }
        else{
            resultado = resultado;
        }
        posicion++;
    }
    return resultado;
}

int main(void)
{
    int numero;
    printf("Ingrese el numero\n"); scanf("%d",&numero);
    assert( numero > 0);
    printf(("El enesimo primo es: %d"),nesimoPrimo(numero)); 
    return 0;
}