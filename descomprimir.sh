#!/bin/bash

IMG_COMP=$1
CHECKSUM=$2

if [[ $IMG_COMP =~ .gz$ ]]
then
	if [[ -e $IMG_COMP && -f $CHECKSUM ]]
	then
		if [[ $(md5sum -c $CHECKSUM)  ]]
		then
			echo "Descomprimiendo..."
			tar xvf $IMG_COMP
			echo "¡Descompresion exitosa!"	
			exit 0
		else
			echo "ERROR: no se pudo descomprimir $IMG_COMP"
			exit 1
		fi
	else
		echo "Se debe especificar los archivos a descomprimir y el checksum"
		exit 1
	fi
else
	echo "Se debe ingresar un archivo que esté comprimido"
	exit 1
fi
