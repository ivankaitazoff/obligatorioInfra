#!/bin/bash
# Nombres de estudiantes:
#	Ivan Kaitazoff - 233940
#	Ma. Ximena chaves - 161267
#	Raquel brandariz - 188959
## Supuestos
#- El usuario debe estar creado antes de iniciar el programa
#	Para agregar nuevo usuario usar los siguientes comandos
#		sudo useradd [nombre_de_usuario]
#		sudo passwd [nombre_de_usuario] (para cambiar password del usuario recien creado)
#- En el ejercicio 1 

#Creamos variables que contienen 0 si no fueron creadas y 1 si fueron creadas correctamente
existeLetra=0	
existeDirectorio=0
existeUsuario=0
#En caso de que se ingrese un valor invalido cada uno de estos valores vuelven a 0

function configurarVariables(){
	echo "Ingrese la letra"
	read letraIngresada
	# Convertimos la letra ingresada en minuscula
	echo $letraIngresada | tr [:upper:] [:lower:] | cat > letraMinuscula # creamos archivo con la letra ingresada convertida a minuscula
	read letraIngresada <letraMinuscula # guardamos el contenido del documento 'letraMinuscula' en la variable 'letra'
	rm letraMinuscula # borramos el archivo 'letraMinuscula'
	# Validamos que la letra ingresada haya sido vocal minuscula
	if [ $letraIngresada == 'a' ] || [ $letraIngresada == 'e' ] || [ $letraIngresada == 'i' ] || [ $letraIngresada == 'o' ] || [ $letraIngresada == 'u' ]; then
	 	#La letra ingresada es vocal
		existeLetra=1
		echo "Ingrese directorio"
		read directorioIngresado
		if [[ "$directorioIngresado" =~ [^[:lower:]] ]]; then
    			# El directorio ingresado contiene algo distinto a letras minusculas
			echo "No se ha seleccionado un nombre de directorio"
			existeDirectorio=0
		else
    			# El directorio ingresado contiene solo letras minusculas
			existeDirectorio=1
			echo  "Ingrese usuario"
			read usuarioIngresado
			existeUsuario=1
		fi
	else   # la letra ingresada no es vocal 
		echo La letra ingresada no es una vocal
		existeLetra=0
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
	grep -c "$letraIngresada" diccionario.txt | cat >> solucion.txt	     #escribo info en archivo, cantidad contiene
	rm diccionario.txt  #elimino el archivo
	cd ..
	echo "Informe guardado"
}

function cambiarPropietariosYPermiso(){
	echo 'cambiar Propietarios'
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

menu=("Configurar variables"
"Obtener Informe de la letra"
"Guardar Informe"
"Cambiar propietarios y permiso"
"Salir")

function mostrarMenu(){
	echo
	echo "1) Configurar variables"
	echo "2) Obtener Informe de la letra"
	echo "3) Guardar Informe"
	echo "4) Cambiar propietarios y permiso"
	echo "5) Salir"
}

function mostrarDatosYMenu(){
	echo
	if [ $existeLetra == 0 ]; then
		echo Aun no se ha escogido una letra
	else
		echo Se ha escogido la letra: $letraIngresada
	fi

	if [ $existeDirectorio == 0 ]; then
		echo Aun no se ha escogido un nombre de directorio
	else
		echo El nombre del directorio es: $directorioIngresado
	fi
	
	if [ $existeUsuario == 0 ]; then
		echo Aun no se ha escogido un usuario
	else
		echo Se ha escogido el usuario: $usuarioIngresado
	fi
	
	mostrarMenu
}


PS3='
Ingrese su eleccion:
'
select opt in "${menu[@]}"
do
	case $opt in
		"Configurar variables")
			echo "usted eligio 1"
			configurarVariables
			mostrarDatosYMenu
			;;
		"Obtener Informe de la letra")
			obtenerInformeLetra
			mostrarDatosYMenu
			;;
		"Guardar Informe")
			guardarInforme
			mostrarDatosYMenu
			;;
		"Cambiar propietarios y permiso")
			cambiarPropietariosYPermiso
			mostrarDatosYMenu
			;;
		"Salir")
			break
			;;
		*) echo "Opcion invalida $REPLY";;
	esac
done


