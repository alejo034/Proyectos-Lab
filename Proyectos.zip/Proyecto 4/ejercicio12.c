#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>
#include <limits.h>


typedef char clave_t;
typedef int valor_t;

typedef struct{
    clave_t clave;
    valor_t valor;
}asoc;

void pedirArregloAsoc(asoc a[], int nMax){
    int i;
    asoc pedir;
    i= 0;
    pedir.valor= 0;
    pedir.clave = ' ';
    while (i < nMax){
        printf("Ingrese un valor para la posicion %d\n",i);
        scanf("%d",&pedir.valor);
        printf("Ingrese una clave para la posicion %d\n",i); 
        scanf(" %c", &pedir.clave);
        a[i].valor = pedir.valor;
        a[i].clave = pedir.clave;
        i++;
    }
}

bool asocExiste(asoc a[], int tam, clave_t c){
    int contador = 0;
    while (contador < tam){
        if (a[contador].clave == c){
        return true;
        }
        contador++;
    }
    return false;
}

int main(){
    int cantElem;
    char clave;
    printf("Ingrese su Clave a comparar \n"); scanf("%c",&clave);
    printf("Ingrese el tamanio de su array: \n"); scanf("%d", &cantElem);
    asoc a[cantElem];
    assert(cantElem >0);
    pedirArregloAsoc(a, cantElem);
    printf(("%d"),asocExiste(a, cantElem, clave));
    return 0;
}