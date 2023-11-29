#!/bin/bash

#14. Realizar un script que muestre un mensaje de error si no se han pasado parámetros y si se le han pasado parámetros que los muestre por pantalla.

if [ $# -eq 0 ]
then
	echo "ERROR: Ejecución sin parámetros"
	exit 1

else
	echo "Parámetros: $*"
fi
