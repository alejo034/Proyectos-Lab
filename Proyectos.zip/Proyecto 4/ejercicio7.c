#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <limits.h>
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
bool existe_positivo(int a[], int tam){
    int i;
    i = 0;
    while(i<=tam){
        if(a[i]>0){
            return true;
        }
        i++;
    }
    return false;
}
bool todos_positivos(int a[], int tam){
    int i;
    i = 0;
    while(i<=tam){
        if (a[i]<0){
            return false;
        }
        i++;
    }
    return true;

}
int main(void){
    int op;
    printf("el tamaño del array esta determinado en 4. \n");
    int a[N];
    assert(N>0);
    pedirArreglo(a, N);
    printf("ahora decida que funcion desea usar: \n");
    printf("Debe escribir el num 1 o el num 2, \n");
    printf("1: EXIS_POS ,,,,,,,,,,, 2: TOD_POS \n");
    scanf("%d", &op);
    assert(op==1 || op==2);
    if(op==1){
        printf("el resultado de la funcion existe positivo es:  %d", existe_positivo(a, N));
    }
    else if (op==2){
        printf("el resultado de la funcion todos positivos es:  %d", todos_positivos(a, N));
    }
    return 0;
}
