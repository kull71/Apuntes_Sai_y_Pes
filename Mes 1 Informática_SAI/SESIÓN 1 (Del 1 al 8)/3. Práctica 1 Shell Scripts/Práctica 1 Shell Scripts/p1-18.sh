#!/bin/bash

#18. Realizar un script que indique si los ficheros pasados por parámetro existen o no existen.

#Mostramos error y finalizamos la ejecución si no se ejecuta con al menos un parámetro
if [ $# -eq 0 ]
then
	echo "Uso:$0 archivo1 [archivo2] [archivo3] ..."
	exit 1
fi

for fichero in $*
do
	if [ -f $fichero ]
	then
		echo "El fichero $fichero SI existe"
	
	else
		echo "NO existe ningún fichero con nombre $fichero"
	fi
done
