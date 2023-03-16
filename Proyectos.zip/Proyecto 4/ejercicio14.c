#include <stdio.h>
#include <assert.h>
#include <stdbool.h>
#include <limits.h>
#include <string.h>

typedef struct _persona {
    char *nombre;
    int edad;
    float altura;
    float peso;
}persona_t;

/*Funciones Auxiliares */
float sumatoria(persona_t a[], int tam){
    int i =0; 
    float resultado = 0;

    while (i < tam){
        resultado = resultado + a[i].peso;
        i++;
    } 
    return resultado;
}

/* Funciones A declarar */
float peso_promedio(persona_t arr[], unsigned int longitud)
{
    persona_t promedio;
    promedio.peso = sumatoria(arr,longitud) / longitud;
    return promedio.peso;
};
persona_t persona_de_mayor_edad(persona_t arr[], unsigned int longitud)
{
    persona_t maximo;
    unsigned int contador=0;
    maximo.edad = INT_MIN;
    maximo.nombre = " ";
    while (contador < longitud)
    {
        if (arr[contador].edad > maximo.edad)
        {
            maximo.edad = arr[contador].edad;
            maximo.nombre = arr[contador].nombre;
        }
        contador++;
    }
    return maximo;
};
persona_t persona_de_menor_altura(persona_t arr[], unsigned int longitud)
{
    persona_t minimo;
    unsigned int contador=0;
    minimo.altura = INT_MAX;
    minimo.nombre = " ";
    while(contador < longitud)
    {
        if (arr[contador].altura < minimo.altura)
        {
            minimo.altura = arr[contador].altura;
            minimo.nombre = arr[contador].nombre;
        }
        contador++;
    }
    return minimo;
};


/* Main */
int main(void) {
persona_t p1 = {"Paola", 21, 1.85, 75};
persona_t p2 = {"Luis", 54, 1.75, 69};
persona_t p3 = {"Julio", 40, 1.70, 80};
unsigned int longitud = 3;
persona_t arr[] = {p1, p2, p3};
printf("El peso promedio es %f\n", peso_promedio(arr, longitud));
persona_t p = persona_de_mayor_edad(arr, longitud);
printf("El nombre de la persona con mayor edad es %s\n", p.nombre);
p = persona_de_menor_altura(arr, longitud);
printf("El nombre de la persona con menor altura es %s\n", p.nombre);
return 0;
}