#!/bin/bash

IMG_ENTRADA=$1
IMG_NOMBRE=$(echo $IMG_ENTRADA | cut -d "." -f 1)

if [[ -e $IMG_ENTRADA ]]
then
	if [[ $IMG_NOMBRE =~ ^[A-Z] && $IMG_NOMBRE =~ [a-z]$ ]]
	then
		echo "Recortando imagen..."
		convert $IMG_ENTRADA -gravity center -resize 512x512+0+0 \-extent 512x512 $IMG_ENTRADA
		echo "Imagen recortada"
		exit 0
	else
		echo "Error: NO es un nombre valido para poder recortar"
		exit 1
	fi
else
	echo "La imagen no existe en este dir."
	exit 1
fi

