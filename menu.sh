#!/bin/bash


echo "BIENVENIDO AL MENÚ DEL GENERADOR DE IMAGENES"

echo "RECORDA PREVIAMENTE GENERAR LAS IMAGENES PARA LUEGO PODER UTILIZAR LAS DEMAS HERRAMIENTAS"

echo "
1) Generar imagenes aleatorias 
 Deberas pasar por parametro la cantidad de imagenes a generar
-------------------------------------
2) Descomprir archivos
 Permite descomprimir archivos .gz
--------------------------------------
3) Recortar imagenes
 Recorta imagenes en un tamaño de 512x512
--------------------------------------
4) Comprimir archivos
 Comprime imagenes y archivos de utlidad
--------------------------------------
*) Salir del programa
--------------------------------------
 "
 
echo "PORFAVOR INGRESE UNA OPCION" 
read OPCION

while [[ $OPCION != "*" ]]
do

case $OPCION in
	1)
		echo "Ingrese la cantidad de imagenes a generar"
		read CANTIDAD
		bash generar.sh $CANTIDAD
		;;
	2)	bash descomprimir.sh imagenes.tar.gz checksum.txt
		;;
	3)	echo "Ingrese el nombre de la imagen a recortar"
		read NOMBRE_FOTO
		bash procesar.sh $NOMBRE_FOTO
		;;
	4)	bash comprimir.sh
		;;
	*)	echo "Ingrese una opcion valida"	
esac

echo "
--------------------------------------------
PORFAVOR INGRESE UNA OPCION o "*" PARA SALIR
"
read OPCION

done
echo "Saliendo..."
