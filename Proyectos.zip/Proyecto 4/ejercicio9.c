#include <stdio.h>
#include <assert.h>
#include <limits.h>
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>
#define N 4

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
int minimoPares(int a[], int tam){
    int i, res;
    i = 0;
    res = INT_MAX;
    while (i < tam){
        if (a[i]<= res && fmod(a[i], 2) == 0){
            res = a[i];
        }
        i++;
    }
    printf("el minimo de los pares es: %d\n", res);
    return res;

}

int minimoImpares(int a[], int tam){
    int i, res;
    i = 0;
    res = INT_MAX;
    while (i < tam){
        if (a[i]<= res && fmod(a[i], 2) == 1){
            res = a[i];
        }
        i++;
    }
    printf("el minimo de los impares es: %d\n", res);
    return res;

}
int main (void){
    printf("el tamaño del arreglo esta predeterminado en 4.  \n");
    int a[N];
    assert(N>0);
    pedirArreglo(a, N);
    printf("ahora se devolvera el elemento minimo par e impar. \n");
    minimoPares(a, N);
    minimoImpares(a, N);
}