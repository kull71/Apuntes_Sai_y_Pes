#!/bin/bash

#24. Realizar un script al que se le pasa como parámetro un fichero y dice si existe, no existe o es un directorio.

if [ -f $1 ]
then
	echo El fichero $1 existe

elif [ -d $1 ]
then
	echo $1 es un directorio

else
	echo El fichero $1 no existe
fi
