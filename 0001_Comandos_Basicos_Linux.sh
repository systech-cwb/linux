#!/bin/bash
clear
if dpkg -l | grep -q "figlet"; then
  echo "Figlet ya está instalado."
else
  echo "Actualizando el sistema"
  apt-get update
  apt-get install -y figlet

  if [ $? -eq 0 ]; then
    echo "Figlet se instaló correctamente."
  else
    echo "Error al instalar Figlet. Saliendo..."
    exit 1
  fi
fi



#!/bin/bash

centrar_figlet() {
    local texto="$1"
    local ancho_terminal=$(tput cols)
    local ancho_texto=$(figlet -f standard "$texto" | wc -L)
    local espacio_izquierdo=$(( (ancho_terminal - ancho_texto) / 2 ))
    figlet -f standard "$texto" | awk -v pad="$espacio_izquierdo" '{printf "%" pad "s%s\n", "", $0}'
}






# Función para verificar la entrada del usuario
verificar_comando() {
    local entrada=$1
    local comando_correcto=$2

    while [ "$entrada" != "$comando_correcto" ]; do
        read -p "Debes escribir correctamente el comando ($comando_correcto): " entrada
    done
}

clear
centrar_figlet "BEM-VINDOS"
centrar_figlet "ao nosso tutorial"
centrar_figlet "L I N U X"


# Bienvenida y explicación
echo "¡Bienvenido al tutorial interactivo de comandos básicos de Linux!"
sleep 1
read -p "enter para continuar"
clear
echo "En este tutorial, aprenderás a usar el comando 'ls' paso a paso."
sleep 1
read -p "enter para continuar"
clear


echo "Vamos Primeiro identicar en que directorio te Encuentras"
echo ""
echo""
read -p "Ingrese el comando (pwd): " _pwd
verificar_comando "$_pwd" "pwd"
clear
echo""
echo ""
echo -e "\033[0;31m$PWD\033[0m"
echo -e "¡Bien hecho!, ahora sabemos que estamos en el directorio \033[0;31m$PWD\033[0m"
echo "em outras palabras estamos no teu diretorio,"
echo "aquele que foi criado na instalação do Linux"






# Segundo paso
echo "Paso 2: Ahora, listemos el contenido del directorio actual utilizando 'ls'."
read -p "Presiona Enter para continuar..."
ls

# Tercer paso
read -p "Paso 3: ¡Bien hecho! ¿Puedes decirme qué archivos y directorios se muestran? " respuesta
verificar_comando "$respuesta" "$(ls)"

# Cuarto paso
echo "Paso 4: Puedes personalizar la salida de 'ls' con opciones. Por ejemplo, 'ls -l' muestra detalles."
read -p "Presiona Enter para ver la salida de 'ls -l'..."
ls -l

# Quinto paso
read -p "Paso 5: ¿Qué información adicional ves ahora? " respuesta
verificar_comando "$respuesta" "$(ls -l)"

# Sexto paso
echo "¡Felicidades! Has completado el tutorial básico de 'ls'. ¡Espero que hayas aprendido algo nuevo!"
