#include <stdio.h>
#include <assert.h>
#include <limits.h>
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>

struct comp_t {
int menores;
int iguales;
int mayores;
};

void pedirArreglo (int a[], int nx){
    int i, va;
    i = va = 0;
    printf("usted ingresara los valores para cada posicion del arreglo.\n");
    while(i<=nx){
        printf("ingrese los valores: ");
        scanf("%d", &va);
        a[i] = va;
        i++;
    }
}
struct comp_t cuantos(int a[], int tam, int elem){
    struct comp_t keonda;
    int i;
    i=0;
    keonda.menores = 0;
    keonda.mayores = 0;
    keonda.iguales = 0;
    while(i <= tam){
        if(a[i]<elem){
            keonda.menores++;
        }
        else if (a[i]>elem){
            keonda.mayores++;
        }
        else if (a[i]==elem){
            keonda.iguales++;
        }
i++;}
return keonda;
}
int main (void){
    int ce, elemento;
    printf("ingrese el tamaño del array:  \n");
    scanf("%d", &ce);
    int a[ce];
    assert(ce>0);
    pedirArreglo (a,ce);
    printf("ahora ingresara un numero para realizar la funcion 'cuantos':   \n");
    scanf("%d", &elemento);
    printf("la cantidad de numeros menores al elemento que estan en el arreglo son:  %d\n",cuantos(a, ce, elemento).menores);
    printf("la cantidad de numeros mayores al elemento que estan en el arreglo son:  %d\n",cuantos(a, ce, elemento).mayores);
    printf("la cantidad de numeros iguales al elemento que estan en el arreglo son:  %d\n",cuantos(a, ce, elemento).iguales);
return 0;
}