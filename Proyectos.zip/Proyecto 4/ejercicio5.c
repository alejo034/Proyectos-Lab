#include <stdio.h>
#include <limits.h>
#include <stdlib.h>
#include <assert.h>
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
void imprimeArreglo(int a[], int nx){
    int i;
    i = 0;
    while (i<=nx){
        printf("%d ", a[i]);
        i++;
    }
}
int main (void){
    int ce;
    printf("ingrese la cantidad de elementos: \n");
    scanf("%d", &ce);
    int a[ce];
    assert(ce>0);
    pedirArreglo(a, ce);
    printf("el arreglo quedo asi: \n");
    imprimeArreglo(a, ce);
    return 0;
}