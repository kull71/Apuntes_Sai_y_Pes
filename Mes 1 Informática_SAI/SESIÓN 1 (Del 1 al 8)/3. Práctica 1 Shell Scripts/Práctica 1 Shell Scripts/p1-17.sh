#!/bin/bash

#17. Realizar un script que solicite al usuario dos números por teclado y muestre un mensaje indicando si ambos números son iguales, si el primer número es mayor o si el segundo número es mayor.

echo -n "Introduzca el primer número: "
read num1
echo -n "Introduzca el segundo número: "
read num2

if [ $num1 -gt $num2 ]
then
	echo "$num1 es MAYOR que $num2"

elif [ $num1 -eq $num2 ]
then
	echo "$num1 es IGUAL a $num2"

else
	echo "$num1 es MENOR que $num2"
fi
