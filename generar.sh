#!/bin/bash

echo "GENERANDO IMAGENES..."

CANT_IMG=$1

curl https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv > nombres.txt


for (( i=0; i<$CANT_IMG; i++ ))
do
	NUM_LINEA=$RANDOM
	while [[ $NUM_LINEA > 96222  ]]
	do
		NUM_LINEA=$RANDOM
	done

	NOMBRE=$(awk -v "variable=$NUM_LINEA" 'NR==variable' nombres.txt | cut -d "," -f 1 | tr " " "_")

	# utilziamos awk para buscar una linea especifica en el archivo "nombres.txt", con -v especificamos una varible
	# dentro de del programa awk es decir "variable=$NUM_LINEA", con NR estamos diciendo que si el NUM de Linea es igual a "variable"
	# dentro de nombres txt. luego con cut -d "," decirmos que corte con el delimitador "," y con "-f 1" que solo extraiga la primera
	# parte. por ultimo con tr modificamos los espacio por guiones bajos.

	curl -L https://thispersondoesnotexist.com/ --output img.tmp
	# -L es para que siga las redirecciones de la URL , "--output img.tmp" especifica el arch de salida en el que se guarda el resultado
	# de la solicitud

	cp img.tmp $NOMBRE.jpg

	sleep 1
	
done

echo "Estas son las imagenes generadas y comprimidas en imagenes.tar.gz:"

tar zcvf imagenes.tar.gz *.jpg

md5sum imagenes.tar.gz > checksum.txt
