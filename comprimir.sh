#!/bin/bash

touch lista_nombre_img.txt
touch lista_nombre_valido.txt
touch lista_nombre_a.txt


if [[ -n "$(find . -type f -name '*jpg')" ]]
then

for FOTO in $(ls *.jpg) 
do
	echo $FOTO >> lista_nombre_img.txt

	IMG_NOMBRE=$(echo $FOTO | cut -d "." -f 1)

	if [[ $IMG_NOMBRE =~ ^[A-Z] && $IMG_NOMBRE =~ [a-z]$ ]]
	then
		echo $FOTO >> lista_nombre_valido.txt
	fi

	if [[ $FOTO == *a.jpg ]] 
	then
		echo $FOTO >> lista_nombre_a.txt
	fi
done
echo "Se comprimieron los siguentes archivos con exito, con el nombre \"arch_comp.tar.gz\":"

tar zcvf arch_comp.tar.gz lista_nombre_img.txt lista_nombre_valido.txt lista_nombre_a.txt *.jpg
exit 0
else
	echo "No se encontro ningun archivo .jpg"
	exit 1
fi
