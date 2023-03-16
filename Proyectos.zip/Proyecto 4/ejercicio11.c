#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>
#include <limits.h>
/* Funciones Auxiliares */
void pedirArreglo(float a[], int nMax){
    int i;
    float numArray;
    i= 0;
    numArray= 0.0;
    printf("ahora debera ingresar un valor para cada posicion! \n");
    while (i <= nMax){
        printf("Ingrese un valor para la posicion: %d\n",i);
        scanf("%f",&numArray);
        a[i] = numArray;
        i++;
    }
}

float sumatoria(float a[], int tam){
    int i =0; 
    float resultado = 0.0 ;

    while (i <= tam){
        resultado = resultado + a[i];
        i++;
    }
    return resultado;
}
struct datos_t
{
    float maximo;
    float minimo;
    float promedio;
};

struct datos_t stats(float a[], int tam){
    struct datos_t keonda;
    int con = 0;
    keonda.maximo= INT_MIN;
    keonda.minimo = INT_MAX;
    keonda.promedio = 0.0;
    while (con <= tam){
        if(a[con]<keonda.minimo){
            keonda.minimo = a[con];
        }
        else if(a[con]>keonda.maximo){
            keonda.maximo = a[con];
        }
        keonda.promedio = sumatoria(a, tam) / tam;
        con++;
    }
    return keonda;
}
int main(){
    int ce;
    printf("Ingrese el tamano de su array:\n");
     scanf("%d", &ce);
    float a[ce];
    assert(ce>0);
    pedirArreglo(a, ce);
    printf("el maximo del array es:  %.2f\n",stats(a, ce).maximo);
    printf("el minimo del array es:  %.2f\n",stats(a, ce).minimo);
    printf("el promedio del array es:  %.2f\n",stats(a, ce).promedio);
return 0.0;
}
