/*a) ejercicio01.c que lee una variable n de tipo int e imprime por pantalla “hola” n
veces. En esta ocasion el programa debe utilizar dos funciones a definir (ademas de la
funcion main). Programa en un archivo .c la funcion de prototipo:
void holaHasta(int n) que dado un int n, imprime n veces “Hola”. (Usar una bucle while). La funcion main
pide un numero en la entrada antes de llamar holaHasta (¿que funcion podes usar ya
implementada?). Usa la funcion assert (ver teorico) para chequear que x > 0.*/
#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
int cantidadeholas(void){
    int x;
    printf("ingrese la cantidad de holas que quiere imprimir: ");
    scanf("%d", &x);
    return x;
}
void holaHasta(int n){
    int i;
    i = 0;
    while(i<n){
        printf("hola!\n");
        i++;
    }
}
int main()
{
    int x;
    x = cantidadeholas();
    assert(x > 0);
    holaHasta(x);
return 0;
}