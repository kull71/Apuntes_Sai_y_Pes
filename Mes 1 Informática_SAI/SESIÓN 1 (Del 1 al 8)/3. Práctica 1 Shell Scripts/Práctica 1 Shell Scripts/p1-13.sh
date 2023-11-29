#!/bin/bash

#13. Realizar un script que reciba un número por parámetro y, si es mayor que 100, muestre el mensaje "Número es mayor que 100". En caso contrario que muestre el mensaje “Número NO es mayor que 100”

if [ $1 -gt 100 ]
then
	echo "$1 es mayor que 100"

else
	echo "$1 NO es mayor que 100"
fi
