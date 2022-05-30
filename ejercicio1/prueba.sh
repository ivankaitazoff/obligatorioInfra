#!/bin/bash 
echo "ingresar letra elegida"
read letra
echo $letra
grep -c "$letra" diccionario.txt
