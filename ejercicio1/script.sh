#!/bin/bash

function configurarVariables(){
	echo "configurar variables"
}

function obtenerInformeLetra(){
	echo "obtener Informe Letra"
}

function obtenerInforme(){
	echo "obtener Informe"
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
			echo "usted eligio 2"
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


