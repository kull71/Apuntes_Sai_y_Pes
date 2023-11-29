#!/bin/bash

#5. Encontrar los errores que hay sobre variables en el siguiente código

minombre=Alfonso
miapellido = Sanz #-----> ERROR 1: Hay espacios a ambos lados del =
miedad=41
echo "Mi nombre es $minombre"
echo "Mi apellido es $miapellido"
echo "Mi edad es miedad" #----> ERROR 2: Para imprimir o acceder al valor de una variable hay que colocar el símbolo del dólar por delante del nombre de la variable
