#!/bin/bash
#Compruebo si el usuario es root 
if [ $UID -ne 0 ] 
then 
	echo "Este script solo lo puede ejecutar el root" 
	exit 1 
fi
#Funci�n que recibe como argumento un nombre de usuario, y devuelve el n�mero de 
#ficheros de los que es propietario 
function numFicheros_en_propiedad () 
{ 
	usuario=$1 
	numero_ficheros=$(find /home -user $usuario -type f 2> /dev/null | wc -l) 
	echo "N� Ficheros de los que es propietario:" $numero_ficheros 
}
#Funci�n que pas�ndole como argumento el nombre de un usuario, nos devuelve el n�mero de fichero que 
#puede #modificar, es decir, aquellos para los que tenga permiso de escritura (w) 
function numFicheros_modificables () 
{ 
	usuario=$1 
	$numero_ficheros_modificables=$(find /home -exec sudo -u $usuario test -w {} \; -print | wc -l) 
	echo "N� ficheros que puede modificar:" $numero_ficheros_modificables
}
#Funci�n que recibe por par�metro el nombre de un usuario, y devuelve el n�mero 
#de ficheros que tiene abiertos 
function numFicheros_abiertos() 
{ 
	usuario=$1 
	numFicheros=$(lsof -u "$usuario" 2> /dev/null | uniq | wc -l) 
	echo "N� Ficheros abiertos:" $numFicheros
} 
#Funci�n que recibe por par�metro el nombre de un usuario, y devuelve el nombre del fichero de su 
#propiedad, que se cre� en primer lugar en el sistema 
function fichero_mas_antiguo() 
{ 
	usuario=$1 
	f_mas_antiguo=$(find /home -user $usuario -type f -exec ls --full-time {} 2>/dev/null \; | sort -k6 | head -1 | cut -d" " -f9) 
	echo "Fichero m�s antiguo del usuario:" $f_mas_antiguo
}
#Funci�n que recibe el nombre de un usuario del sistema, y me devuelve el nombre del fichero, que ha sido m�s recientemente modificado 
function fichero_modificado_mas_reciente() 
{ 
	usuario=$1 
	f_modificado_mas_reciente=$(find /home -user $usuario -type f -exec ls -lc {} 2>/dev/null \; | sort -k6 | tail -1 |cut -d" " -f8) 
	echo "Fichero m�s recientemente modificado:" $f_modificado_mas_reciente
}
#Funci�n que recibe el nombre de un usuario y busca el fichero de menor tama�o, el tama�o medio y 
#el fichero de mayor tama�o, y los a�ade al informe 
function ficheros_por_tamano() 
{ 
	usuario=$1 
	tamano_mas_pequeno=$(find /home -user $usuario -type f -exec stat -c %s {} 2> /dev/null \; |sort -n | head -1) 
	tamano_mas_grande=$(find /home -user $usuario -type f -exec stat -c %s {} 2> /dev/null \; | sort -n | tail -1) 
	numero_ficheros=$(find /home -user $usuario -type f 2> /dev/null | wc -l)
	tamano_total=0 
	for tam in $(find /home -user $usuario -type f -exec stat -c %s {} 2> /dev/null \; | sort -n)
	do 
		tamano_total=`expr $tamano_total + $tam` 
	done 
	tamano_medio=`expr $tamano_total / $numero_ficheros` 
	echo "Tama�o fichero m�s peque�o:" $tamano_mas_pequeno
	echo "Tama�o medio de fichero:" $tamano_medio
	echo "Tama�o fichero m�s grande:" $tamano_mas_grande
} 
#Funci�n que recibe un nombre de usuario, y me devuelve el tipo de archivo m�s usual que tiene, para ello, buscamos los tipos de los 
#ficheros del usuario, buscamos el n�mero de ocurrencias de cada tipo, y nos quedamos con el de mayor n�mero de ocurrencias. 
function tipo_fichero_mas_usual() 
{ 
	usuario=$1 
	tipo_f_mas_usual=$(find /home -user $usuario -type f -exec file -b {} 2> /dev/null \; |cut -d"," -f1 | sort | uniq -c | sort -n | tail -1 | tr -d 0-9" ") 
	echo "Tipo m�s usual del usuario:" $tipo_f_mas_usual
}
#Funci�n que recibe un nombre de usuario, y a�ade al fichero informe.dat el informe de sus ficheros 
function crea_informe() 
{ 
	usuario=$1 
	echo "############################" 
	echo "Usuario: $usuario" 
	numFicheros_en_propiedad	$usuario 
	numFicheros_modificables $usuario 
	numFicheros_abiertos $usuario 
	fichero_mas_antiguo $usuario 
	fichero_modificado_mas_reciente $usuario 
	ficheros_por_tamano $usuario 
	tipo_fichero_mas_usual $usuario 
}
if (( $# == 2 )) && [ "$1" = "-u" ] && [ $(grep ^$2: /etc/passwd | cut -d: -f3) > "1000" ] 
then 
	usuario=$2 
	crea_informe $usuario 
else 
	if [ $# -eq 1 -a "$1" = "-c" ] then usuarios=$(who | cut -d" " -f1 | uniq) 
		for usuario in $usuarios 
		do 
			crea_informe $usuario 
		done 
	else 
		if [ $# -eq 0 ] 
		then 
			for usuario in $(cat /etc/passwd | cut -d: -f1) 
			do 
				if [ $(id -u $usuario) -ge 1000 ] 
				then 
					crea_informe $usuario 
				fi 
			done 
		else 
			echo "Error en los par�metros" 
			exit 1 
		fi 
	fi 
fi 
 