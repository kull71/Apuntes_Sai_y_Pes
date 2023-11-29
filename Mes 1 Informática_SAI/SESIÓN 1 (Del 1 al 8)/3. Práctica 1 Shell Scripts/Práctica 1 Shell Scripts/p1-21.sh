#!/bin/bash

echo "Introduzca el primer número: "
read num1
echo "Introduzca el segundo número: "
read num2

resultado=`expr $num1 + $num2`
#Otra forma posible es: resultado=$(($num1+$num2))

echo "La suma de los dos números es: $resultado"

