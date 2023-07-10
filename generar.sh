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
	curl -L https://thispersondoesnotexist.com/ --output img.tmp
	cp img.tmp $NOMBRE.jpg
	
	sleep 1
	
done

echo "Estas son las imagenes generadas y comprimidas en imagenes.tar.gz:"

tar jcvf imagenes.tar.gz *.jpg

md5sum imagenes.tar.gz > checksum.txt
