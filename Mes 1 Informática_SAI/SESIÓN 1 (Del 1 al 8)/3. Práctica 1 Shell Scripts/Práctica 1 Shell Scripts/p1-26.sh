#!/bin/ bash

if [ $# -eq 1 ]
then
	#Se comprueba que el parámetro pasado es un fichero
	#y que tiene permisos de lectura
	if [-f $1 -a -r $1 ]
	then
		cat $1

	else
		echo "El fichero no tiene permisos de lectura"
	fi
	
else
	echo "ERROR, No se ha pasado el fichero"
fi

