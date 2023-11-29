#!/bin/bash

for fichero in $*
do
	if [ -f $fichero ]
	then
		echo "Existe el fichero" $fichero
	
	else
		echo "ERROR, no existe" $fichero
	fi
done

