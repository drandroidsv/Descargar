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

a="Instalar yt-dlp"
b="Nueva descarga"
c="en formato mp3"
d="en formato Video"
e="player"
q="Salir"

#directory verification
directory=$(pwd)

#verificacion de Dependencias by mastersv
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

#mensaje y logo bienvenida
clear
toilet --filter border Descarga YT
echo
echo -e "$purple(*)$blue Turbo Descargar$red v3.0$blue"
sleep 2
echo -e "$purple(*)$blue Script creado por$red mastersv"
sleep 1
echo -e "$purple(*)$blue Regalanos una estrella en github$yellow"

export PS3=$'\e[01;35m(*)\e[01;32m Elige una Opcion:\e[01;33m '
#menu principal

function menu_principal(){
echo
echo
select menu in "$a" "$b" "$c" "$d" "$e" "$q";
do
case $menu in 

$a)
echo "instalando yt-dlp"
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
sleep 1
echo "otorgando permisos"
sudo chmod a+rx /usr/local/bin/yt-dlp
sleep 1
echo "yt-dlp instalado"
sleep 2
menu_principal
;;


$b)
echo -e "$green"
read -p "añade link de youtube ➜ " Link
	echo -e "$white"
	echo -e "$Link" [$green✓$nc]
	echo -e "$green"
echo -e "$green"
menu_principal
;;

$c)
yt-dlp --extract-audio --audio-format mp3 $Link
sleep 1
echo "procesando...."
sleep 1
sudo chmod 7777 ~/Music/*.mp3
clear
sleep 1
menu_principal
;;


$d)
yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $Link 
sleep 1
echo "procesando...."
sleep 1
sudo chmod 7777 ~/Videos/*.mp4
clear
sleep 1
menu_principal
;;

$e)
echo "iniciando player"
sleep 1
cmus
menu_principal
;;

$q)
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