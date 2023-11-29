#!/bin/bash

#Si no se ejecuta con el número de parámetros correcto muestra
#mensaje indicando la forma de ejecutarlo y finaliza la ejecución
#con código de error
if [ $# -ne 3 ]
then
	echo "USO: $0 num1 num2 num3"
	exit 1
fi


if [ $1 -gt $2 ] && [ $1 -gt $3 ]
then
	echo "$1 es el número más grande"

elif [ $2 -gt $1 ] && [ $2 -gt $3 ]
then
	echo "$2 es el número más grande"

elif [ $3 -gt $1 ] && [ $3 -gt $2 ]
then
	echo "$n3 es el número más grande"

elif [ $1 -eq $2 ] && [ $1 -eq $3 ] && [ $2 -eq $3 ]
then
	echo "Los tres números son iguales"

else
	echo "No se puede determinar que número es el más grande"
fi

