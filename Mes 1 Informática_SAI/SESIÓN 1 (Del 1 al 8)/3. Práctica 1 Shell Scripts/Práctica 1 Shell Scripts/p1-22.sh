#!/bin/bash

#22. Realizar un script que muestre la tabla de multiplicar de un número pasado por parámetro.

i=0
while [ $i -le 10 ]
do
	resultado=`expr $1 \* $i`
	echo $1x$i = $resultado
	i=`expr $i + 1`
done
