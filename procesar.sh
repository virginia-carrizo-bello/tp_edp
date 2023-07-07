#!/bin/bash

IMG_ENTRADA=$1
NOMBRE_IMG=$(echo $IMG_ENTRADA)

if [[ -e $1 ]]
then
	if [[ $NOMBRE_IMG =~ ^[A-Z] && $NOMBRE_IMG =~ [a-z]+$ ]]
	then
		echo "Recortando imagen..."
		convert $IMG_ENTRADA -gravity center -resize 512x512+0+0 \-extent 512x512 $NOMBRE_IMG
		echo "Imagen recortada"
	else
		echo "Error: NO se pudo recortar la imagen"

	fi
else
	echo "Imagen inválida"
fi

