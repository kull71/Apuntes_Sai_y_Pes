#!/bin/bash

#4. Modificar el script anterior para que la división se almacene en una variable llamada resultado y que se imprima su valor en pantalla.

a=20
b=5
resultado=`expr $a / $b`
echo $resultado
