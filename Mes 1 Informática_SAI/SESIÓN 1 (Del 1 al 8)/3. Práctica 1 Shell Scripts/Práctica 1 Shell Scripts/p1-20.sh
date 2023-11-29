#!/bin/bash

#20. Realizar un script utilizando el bucle for que muestre el siguiente patrón:
#	1
#	12
#	123
#	1234
#	12345

for (( i=1; i<=5; i++ ))
do
	for (( j=1; j<=i; j++ ))
	do
		echo -n "$j"
	done
	echo ""
done
