#!/bin/bash

function configurarVariables(){
	echo "Ingrese la letra"
	read letraIngresada #falta validar
	echo $letraIngresada | tr [:upper:] [:lower:] | cat > letraMinuscula
    	# vocales=("a" "e" "i" "o" "u") # Defino cuales son las vocales en minuscula
    	if [ $letraIngresada == 'a' ] || [ $letraIngresada == 'e' ] || [ $letraIngresada == 'i' ] || [ $letraIngresada == 'o' ] || [ $letraIngresada == 'u' ]; then   #No es vocal, tengo mostrar mensaje de error	
	 echo "Ingrese directorio"
		read directorioIngresado
		echo "Ingrese usuario"
		read usuarioIngresado
	
	else   # es vocal 
	echo La letra ingresada no es una vocal
	fi	
	}

function obtenerInformeLetra(){
	echo letra elegida $letraIngresada
	echo Palabras que comienzan con letra ingresada = 
	grep -c "^$letraIngresada" diccionario.txt  #cantidad comienzo
	echo Cantidad de palabras que finalizan con la letra seleccionada
	grep -c "$letraIngresada$" diccionario.txt  #cantidad fin
	echo Cantidad de palabras que contienen la letra ingresada: 
	grep -c "$letraIngresada" diccionario.txt  #cantidad contiene
}

function guardarInforme(){
	mkdir $directorioIngresado/  # crear carpeta
	cp diccionario.txt $directorioIngresado/diccionario.txt	
	cd $directorioIngresado/
	date | cat > solucion.txt #'cat >' crea archivo nuevo solo con esa linea 
	echo Palabras que comienzan con letra ingresada: | cat >> solucion.txt
	grep -c "^$letraIngresada" diccionario.txt | cat >> solucion.txt     #escribo info en archivo, cantidad comienzo
	echo Palabras que finalizan con letra ingresada: | cat >> solucion.txt
	grep -c "$letraIngresada$" diccionario.txt | cat >> solucion.txt     #escribo info en archivo, cantidad fin
	echo Cantidad de palabras que contienen la letra ingresada:  = | cat >> solucion.txt
	grep -c "$letraIngresada" diccionario.txt | cat >> solucion.txt	     #escribo info en archivo, cantidad contien
	rm diccionario.txt  #elimino el archivo
	cd ..
	echo "Informe guardado"
}

function cambiarPropietariosYPermiso(){
	echo cambiar Propietarios # revisar
	chown	users:Opcion1 diccionario.txt  # cambio el propietario
	chmod +wr  diccionario.txt # doy permisos de escritura y lectura
	chmod -wr  diccionario.txt # quito permisos de escritura y lectura
	#Permosos de escritura y lectura al grupo y al resto del mundo
	chmod g+wr diccionario.txt   # doy permisos de escritura y lectura al grupo 
	chmod o+wr diccionario.txt	# doy permisos de escritura y lectura al resto
}

function salir(){
	echo "salir"
}

menu=("Configurar variables"
"Obtener Informe de la letra"
"Guardar Informe"
"Cambiar propietarios y permiso"
"Salir")


echo "$menu"
PS3='Ingrese su eleccion: '
select opt in "${menu[@]}"
do
	case $opt in
		"Configurar variables")
			echo "usted eligio 1"
			configurarVariables
			;;
		"Obtener Informe de la letra")
			obtenerInformeLetra
			;;
		"Guardar Informe")
			guardarInforme
			;;
		"Cambiar propietarios y permiso")
			cambiarPropietariosYPermiso
			;;
		"Salir")
			rm letraMinuscula
			break
			;;
		*) echo "Opcion invalida $REPLY";;
	esac
done


