#!/bin/bash
if [ $UID -ne 0 ]
then
  echo "ERROR. Este script solo lo ejecuta el root"
  exit 1
fi

#Función que recibe como parámetro el GID de un grupo de alumnos, y busca todos los
# alumnos quepertenecen a ese grupo e invoca a la función busca_scripts_alumno.
function alumnos_grupo() 
{
  gid_grupo=$1
  fichero_grupo=$gid_grupo"_"$(date +%m)
  echo "Seguimiento del Grupo: $gid_grupo" > $fichero_grupo
  numGrupo=$(grep $1: /etc/group | cut -d":" -f3)
  for alumno in $(grep '^[^:]*:[^:]*:[^:]*:'$numGrupo /etc/passwd | cut -d":" -f1)
  do
    busca_scripts_alumno $alumno $fichero_grupo
  done
}
#Función que busca el número de scripts de cada alumno, su nombre y contenido
#La función recibe como argumento el nombre de un alumno y el nombre del fichero
function busca_scripts_alumno()
{
  alumno=$1
  fich_alumno=$2
  nombre_alumno=$(cat /etc/passwd | grep ^$alumno: | cut -d":" -f5)
  echo "Usuario: $alumno /" $nombre_alumno >> $fich_alumno
  numero_scripts=0
  for fichero in $(find /home -user $alumno -type f -exec file {} \; 2> /dev/null | grep 'shell script' | cut -d":" -f1)
  do
    echo "Nombre del Script" $fichero >> $fich_alumno
    echo "Contenido del script" >> $fich_alumno
    cat $fichero >> $fich_alumno
    echo "Fichero copiado a `date`" >> $fichero
    numero_scripts=`expr $numero_scripts + 1`
  done
  echo "Total scripts incluidos para $nombre_alumno": $numero_scripts >> $fich_alumno
}

if (($# == 1)) && [ $(grep ^$1: /etc/group | cut -d":" -f3) -ge 1000 ]
then
  alumnos_grupo $1
else
  echo "Error en los argumentos"
  exit 1
fi
