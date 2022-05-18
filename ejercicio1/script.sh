#!/bin/bash
menu="Menu principal
Opcion 1) Configurar variables
Opcion 2) Obtener Informe de la letra
Opcion 3) Guardar Informe
Opcion 4) Cambiar propietarios y permiso
opcion 5) Salir
Ingresar una opcion"


echo "$menu"

read opcion
echo "La opcion elegida es: " $opcion

while 
	$opcion==0
do
	read opcion

function configurarVariables(){
	echo "configurar variables"
}

configurarVariables

function obtenerInformeLetra(){
	echo 'obtener Informe Letra'
}

function obtenerInforme(){
	echo obtener Informe
}

function guardarInforme(){
	echo guardar Informe
}

function cambiarPropietariosYPermiso(){
	echo cambiar Propietarios
}

function salir(){
	echo salir
	exit 1;
}
if [$opcion == "1"]; 
then
	echo "watafac"
	configurarVariables
else
	obtenerInformeLetra
fi

salir
