#!/bin/bash
existeLetra=0
existeDirectorio=0
existeUsuario=0

function configurarVariables(){
	echo "
	Ingrese la letra"
	read letraIngresada #falta validar
	echo $letraIngresada | tr [:upper:] [:lower:] | cat > letraMinuscula # creamos archivo con la letra ingresada convertida a minuscula
	read letraIngresada <letraMinuscula # guardamos el contenido del documento 'letraMinuscula' en la variable 'letra'
	rm letraMinuscula # borramos el archivo 'letraMinuscula'
	if [ $letraIngresada == 'a' ] || [ $letraIngresada == 'e' ] || [ $letraIngresada == 'i' ] || [ $letraIngresada == 'o' ] || [ $letraIngresada == 'u' ]; then
	 #La letra ingresada es vocal 
	 echo "Ingrese directorio"
		read directorioIngresado
		echo "Ingrese usuario"
		read usuarioIngresado
	
	else   # la letra ingresada no es vocal 
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
	echo 
	'cambiar Propietarios'
	cd $directorioIngresado
	sudo chown $usuarioIngresado solucion.txt  # cambio el propietario
	sudo chgrp $usuarioIngresado solucion.txt # cambio el grupo
	sudo chmod +rw  solucion.txt # doy permisos de escritura y lectura al usuario
	sudo chmod -x  solucion.txt # quito permisos de ejecucion al usuario
	#Permisos de escritura y lectura al grupo y al resto del mundo
	sudo chmod g+rw solucion.txt   # doy permisos de escritura y lectura al grupo 
	sudo chmod g-x solucion.txt	# quito permiso de ejecucion al grupo
	sudo chmod o+rw solucion.txt	# doy permisos de escritura y lectura al resto
	sudo chmod o-x solucion.txt	# quito permiso de ejecucion al resto
	cd ..
}

function salir(){
	echo "salir"
}

function mostrarMenu(){
	echo $menu
	datosIngresados="
	Se ha escogido la letra: $letraIngresada
	Se ha escogido el directorio: $directorioIngresado
	Se ha escogido el usuario: $usuarioIngresado
	Ingrese su eleccion: "
	#datosNoIngresados="
	#Aun no se ha escogido una letra
	#No se ha seleccionado un nombre de directorio
	#Aun no se ha escogido un usuario
	#Ingrese su eleccion: "

}
menu=("Configurar variables"
"Obtener Informe de la letra"
"Guardar Informe"
"Cambiar propietarios y permiso"
"Salir")


echo "$menu"
#if [  ]; then
#fi

PS3='
Ingrese su eleccion:
'
select opt in "${menu[@]}"
do
	mostrarMenu
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
			break
			;;
		*) echo "Opcion invalida $REPLY";;
	esac
done


