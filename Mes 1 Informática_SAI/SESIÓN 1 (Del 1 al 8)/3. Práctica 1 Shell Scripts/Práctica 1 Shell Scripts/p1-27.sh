#!/bin/bash

#27. Realizar un script que solo pueda ser ejecutado por el usuario root. En caso contrario devolverá una salida de error y mostrará un mensaje de error indicando que no somos root.

#Si la variable $UID tiene el valor 0 es porque es el usuario root
if [ $UID -eq 0 ]
then
	echo "Eres root, puedes ejecutar este script"
else
	echo "ERROR, no eres root"
	exit 1
fi
