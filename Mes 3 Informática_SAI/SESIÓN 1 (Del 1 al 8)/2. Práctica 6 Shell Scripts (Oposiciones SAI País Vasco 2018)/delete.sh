#!/bin/bash

#Función que explica como ejecutar el scripts
function f_uso(){
	echo "USO: $0 <fichero|directorio>"
	exit 1
}

#INICIO PROGRAMA

#Ejecución con número de parámetros correcto
if [ $# -eq 1 ]
then
	#Comprobamos si existe un fichero con el nombre que
	#se ha pasado como parámetro 	
	if [ -f $1 -o -d $1 ] 
	then
		if [ ! -d ~/TRASHDIR ]
		then
			mkdir ~/TRASHDIR && echo "Directorio TRASHDIR creado"
		fi
		
		mv $1 ~/TRASHDIR && echo ""$1" se ha movido al directorio TRASHDIR"
	
	#Si no es un archivo o directorio se muestra un mensaje	
	else
		echo "No existe ningún fichero o directorio llamado "$1""
	fi

#Ejecución con número de parámetros incorrecto
else
	echo "ERROR: Ejecución con número de parámetros incorrecto"
	f_uso
fi
