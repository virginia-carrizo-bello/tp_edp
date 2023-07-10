#!/bin/bash

IMG_COMP=$1
CHECKSUM=$2

if [[ $IMG_COMP =~ [*.gz] ]]
then
	if [[ -e $IMG_COMP && -f $CHECKSUM ]]
	then
		echo "Descomprimiendo..."
		tar xvf $IMG_COMP 
	else
		echo "Se debe especificar los archivos a descomprimir y el checksum"
	fi
else
	echo "Se debe ingresar un archivo que esté comprimido"
fi
echo "¡Descompresion exitosa!"
