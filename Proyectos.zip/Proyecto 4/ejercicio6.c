#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#include <assert.h>
#define N 5
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
int sumatoria(int a[], int tam){
    int i, sm;
    i = sm = 0;
    while(i<=tam){
        sm= sm + a[i];
        i++;
    }
    printf("el valor de la sumatoria es: %d \n", sm);
}
int main (void){
    printf("se asume el tamano 5 para el arreglo. \n");
    int a[N];
    assert(N>0);
    pedirArreglo (a, N);
    sumatoria(a, N);
    return 0;
}