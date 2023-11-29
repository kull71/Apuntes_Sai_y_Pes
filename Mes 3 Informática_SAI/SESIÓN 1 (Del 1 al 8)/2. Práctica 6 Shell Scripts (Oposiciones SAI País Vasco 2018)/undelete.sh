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
	#Comprobamos si existe el fichero pasado como parámetro
	#dentro de la carpeta ~/TRASHDIR	
	if [ -f ~/TRASHDIR/$1 -o -d ~/TRASHDIR/$1 ] 
	then
		mv ~/TRASHDIR/$1 $PWD && echo ""$1" se ha movido al directorio actual de trabajo ($PWD)"		
	
	#Si no existe un archivo o directorio con tal nombre
	#en la carpeta ~/TRASHDIR que muestre un mensaje	
	else
		echo "No existe ningún fichero o directorio llamado "$1" en la carpeta TRASHDIR"
	fi

#Ejecución con número de parámetros incorrecto
else
	echo "ERROR: Ejecución con número de parámetros incorrecto"
	f_uso
fi
