#!/bin/bash

#10. Realizar un script que sume dos números que se pasan como argumento a la línea de comandos, y si no son pasados se devolverá error y se mostrará un mensaje indicando la forma de ejecutar el script.

#Si no se han pasado 2 parámetros muestra mensaje de error y finaliza la ejecución
if [ $# -ne 2 ]
then
	echo "Uso: $0 x y"
	echo -e "\t donde x e y son dos números"
	exit 1 #Salida distinta de 0 para indicar que es salida error
fi

echo "La suma de $1 y $2 es `expr $1 + $2`"
