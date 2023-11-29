#!/bin/bash

#7. Realizar un script que muestre el nombre del script, el número de parámetros que se le pasan, una lista con los parámetros recibidos, el identificador del usuario que ejecuta el script, el nombre de usuario, el directorio home del usuario y el directorio actual.

echo "El nombre del script es: $0"
echo "El número de parámetros pasados: $#"
echo "Lista de los parámetros pasados: $@"
echo "UID (Identificador de usuario): $UID"
echo "Nombre de usuario: $USER"
echo "Directorio home: $HOME"
echo "Directorio actual: $PWD"
