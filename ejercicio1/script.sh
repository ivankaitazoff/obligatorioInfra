#!/bin/bash

function configurarVariables(){
	echo "Ingrese la letra"
	read letraIngresada #falta validar
	echo "Ingrese directorio"
	read directorioIngresado
	echo "Ingrese usuario"
	read usuarioIngresado
}

function obtenerInformeLetra(){
	echo letra elegida $letraIngresada
	echo Palabras que comienzan con letra ingresada = 
	grep -c "^$letraIngresada" diccionario.txt
	echo Cantidad de palabras que finalizan con la letra seleccionada
	grep -c "$letraIngresada$" diccionario.txt
	echo Cantidad de palabras que contienen la letra ingresada: 
	grep -c "$letraIngresada" diccionario.txt
}

function guardarInforme(){
	mkdir $directorioIngresado/
	cp diccionario.txt $directorioIngresado/diccionario.txt	
	cd $directorioIngresado/
	date | cat > solucion.txt #'cat >' crea archivo nuevo solo con esa linea 
	echo Palabras que comienzan con letra ingresada: | cat >> solucion.txt
	grep -c "^$letraIngresada" diccionario.txt | cat >> solucion.txt
	echo Palabras que finalizan con letra ingresada: | cat >> solucion.txt
	grep -c "$letraIngresada$" diccionario.txt | cat >> solucion.txt
	echo Cantidad de palabras que contienen la letra ingresada:  = | cat >> solucion.txt
	grep -c "$letraIngresada" diccionario.txt | cat >> solucion.txt	
	rm diccionario.txt
	cd ..
	echo "Informe guardado"
}

function cambiarPropietariosYPermiso(){
	echo cambiar Propietarios
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
			break
			;;
		*) echo "Opcion invalida $REPLY";;
	esac
done


