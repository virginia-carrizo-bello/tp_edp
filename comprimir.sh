#!/bin/bash

touch lista_nombre_img.txt
touch lista_nombre_valido.txt
touch lista_nombre_a.txt


echo *.jpg  > lista_nombre_img.txt

for FOTO in $(ls *.jpg) 
do
	if [[ $FOTO =~ ^[A-Z] && $FOTO =~ [a-z]+$ ]]
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


