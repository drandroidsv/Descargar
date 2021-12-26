#!/bin/bash

#Colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
Cafe="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"
mon="mon"



#Opciones menu

a="Instalar Youtube-Dl"
b="Version youtube-Dl"
c="Actualizar Youtube-Dl"
new="Nueva descarga"
d="Descargar audioo mp3"
e="Descargar Video"
f="descargar por lista audio"
g="Descargar por lista video"
h="player"
i="Salir"

#directory verification
directory=$(pwd)

#verificacion de Dependencias by mastersv

#root privilegies
if [[ $EUID -ne 0 ]]; then	
echo "														         "
echo "(✗) No eres usuario root, para ejecutar la heramienta tienes que ejecutarla siendo root (✗)      "				  
echo "(✗) You are not a root user, to run the tool you have to run it as root (✗)              "		
exit 1
fi

if which toilet >/dev/null; then
sleep 1
echo -e "$blue(Toilet)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(Toilet)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo apt-get install toilet]"
sleep 1
exit 1
fi

if which cmus >/dev/null; then
sleep 1
echo -e "$blue(cmus)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(cmus)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo apt-get install cmus]"
sleep 1
exit 1
fi

if which youtube-dl >/dev/null; then
sleep 1
echo -e "$blue(youtube-dl)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(youtube-dl)$nc No instalado [$red✗$nc]"
sleep 1
echo "Instala escribiendo [sudo apt-get install youtube-dl]"
sleep 1
exit 1
fi

#mensaje y logo bienvenida
clear
toilet --filter border Descargar 
echo
echo -e "$purple(*)$blue Descargar$red v2.6$blue"
sleep 2
echo -e "$purple(*)$blue Script creado por$red mastersv"
sleep 1
echo -e "$purple(*)$blue Regalanos una estrella en github$yellow"

export PS3=$'\e[01;35m(*)\e[01;32m Elige una Opcion:\e[01;33m '
#menu principal

function menu_principal(){
echo
echo
select menu in "$a" "$b" "$c" "$new" "$d" "$e" "$f" "$g" "$h" "$i";
do
case $menu in 

$a)
sudo apt install youtube-dl
sleep 2
menu_principal
;;

$b)
youtube-dl --version
sleep 2
menu_principal
;;

$c)
pip install --upgrade youtube-dl
sleep 2
menu_principal
;;

$new)
echo -e "$green"
read -p "añade link de youtube➜ " Link
	echo -e "$white"
	echo -e "$Link" [$green✓$nc]
	echo -e "$green"
echo -e "$green"
menu_principal
;;

$d)
youtube-dl --extract-audio --audio-format mp3 $Link
sleep 1
echo "procesando...."
sleep 1
sudo chmod 7777 ~/Music/*.mp3
clear
sleep 1
menu_principal
;;


$e)
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $Link 
sleep 1
echo "procesando...."
sleep 1
sudo chmod 7777 ~/Videos/*.mp4
clear
sleep 1
menu_principal
;;


$f)
youtube-dl -a enlaces.txt --extract-audio --audio-format mp3
sleep 1
echo "procesando...."
sleep 1
sudo chmod 7777 ~/Music/*.mp3
clear
sleep 1
menu_principal
;;

$g)
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -a enlaces.txt
sleep 1
echo "procesando...."
sleep 1
sudo chmod 7777 ~/Videos/*.mp4
clear
sleep 1
menu_principal
;;

$h)
echo "iniciando player"
sleep 1
cmus
menu_principal
;;

$i)
echo -e "$nc($blue*$nc)$green Regresa Pronto..$nc"
echo -e "$nc($blue*$nc)$green Gracias por usar nuestro Script $blue by MasTerSv..$nc"
sleep 1
exit
;;

*)
echo -e "$red(ERROR)$green Opcion no valida $nc"
;;
esac 
done
}
menu_principal
