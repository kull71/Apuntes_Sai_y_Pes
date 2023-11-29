#!/bin/bash

#28. Realizar un script que imprima el siguiente menú:
#	1 - Sumar
#	2 - Restar
#	3 - Dividir
#	4 – Multiplicar
#	0 - Salir
#
#Después de mostrar el menú, se pedirá que se elija una opción. Si la opción elegida no está entre el 1 y el 4, se mostrará un mensaje de error. En caso de que la opción sea válida, se pedirán dos números por teclado y en función de la operación elegida, se devolverá el resultado por pantalla. 
#Cada operación será implementada haciendo uso de funciones.
#Si la opción elegida no es válida, se volverá a mostrar el menú.
#El programa terminará, cuando se pulse 0.


#Declaración de funciones
function suma (){
	echo "La suma es $(($1 + $2))"
}

function resta (){
	echo "La resta es $(($1 - $2))"
}

function multiplicacion (){
	echo "La multiplicación es $(($1 * $2))"
}

function division (){
	echo "La división es $(($1 / $2))"
}

#Programa principal
OPCION=1
while [ $OPCION -ne 0 ]
do
	
	echo "Programa calculadora"
	echo "1. Sumar"
	echo "2. Restar"
	echo "3. Multiplicar"
	echo "4. Dividir"
	echo "0. Salir"
	echo -n "Elige una opción: "
	read OPCION
	if [ $OPCION -ge 1 -a $OPCION -le 4 ]
	then
		echo -n "Introduce el primer número de la operación: "
		read NUM1
		echo -n "Introduce el segundo número de la operación: "
		read NUM2
		case $OPCION in
			1) suma $NUM1 $NUM2 ;;
			2) resta $NUM1 $NUM2;;
			3) multiplicacion $NUM1 $NUM2 ;;
			4) division $NUM1 $NUM2;;
			
		esac
		read #esperamos hasta que se pulse intro
	
	elif [ $OPCION -eq 0 ]
	then
		echo "Saliendo del programa..."
		exit 0
	else
		echo "La opción elegida es incorrecta"
	fi
done
