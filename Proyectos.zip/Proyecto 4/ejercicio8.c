#include <stdio.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

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
void intercambiar(int a[], int tam, int i, int j){
      int aux;
    assert(i!=j);
    aux = a[i];
    a[i]= a[j];
    a[j] = aux;
    imprimeArreglo(a, tam);
}
int main (){
    int p1, p2, ce;
    printf("ingrese el tamaño del array: \n");
    scanf("%d", &ce);
    int a[ce];
    assert(ce>0);
    pedirArreglo(a, ce);
    printf("su array actual es el siguiente \n"); imprimeArreglo(a, ce);
    printf("\ningrese la posicion que desea cambiar:  \n");
    scanf("%d", &p1);
    printf("ingrese la posicion que va a cambiar:  \n");
    scanf("%d",&p2);
    assert( p1 < ce && p2 < ce);
    printf("ahora su nuevo array es:  \n");
    intercambiar(a, ce, p1, p2);
    return 0;
}