#!/bin/bash

function configurarVariables(){
	echo "Ingrese la letra"
	read letraIngresada #falta validar
	echo "Ingrese directorio"
	read directorioIngresado #falta validar
	echo "Ingrese usuario"
	read usuarioIngresado #Falta validar
}

function obtenerInformeLetra(){
	echo letra elegida $letraIngresada
	echo Palabras que comienzan con letra ingresada = 
	grep -c "^$letraIngresada" diccionario.txt #anda mal, cuenta todas las lineas
	echo Cantidad de palabras que finalizan con la letra seleccionada
	grep -c "$letraIngresada$" diccionario.txt #anda mal, cuenta todas las lineas
	echo Cantidad de palabras que contienen la letra ingresada: 
	grep -c "$letraIngresada" diccionario.txt
}

function guardarInforme(){
	echo "guardar Informe"
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
			echo "Usted eligio 3"
			;;
		"Cambiar propietarios y permiso")
			echo "usted eligio 4"
			;;
		"Salir")
			break
			;;
		*) echo "Opcion invalida $REPLY";;
	esac
done


