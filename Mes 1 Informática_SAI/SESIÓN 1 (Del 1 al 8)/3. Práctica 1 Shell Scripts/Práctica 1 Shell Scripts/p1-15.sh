#!/bin/bash

#15. Realizar un script que reciba dos números por parámetro y muestre un mensaje indicando si ambos números son iguales, si el primer número es mayor o si el segundo número es mayor.

#Si se ejecuta con el número de parámetros correcto
if [ $# -eq 2 ]
then

	if [ $1 -gt $2 ]
	then
		echo "$1 es MAYOR que $2"

	elif [ $1 -eq $2 ]
	then
		echo "$1 es IGUAL a $2"

	else
		echo "$1 es MENOR que $2"
	fi

#Si se ejecuta con un número de parámetros incorrecto
else
	echo "ERROR: Ejecución con número de parámetros incorrecto"
	exit 1
fi
