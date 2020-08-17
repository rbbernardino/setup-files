#!/bin/bash

###########
function cecho() {
	while [ "$1" ]; do
		case "$1" in 
			-normal)        color="\033[00m" ;;
			-red)           color="\033[31;01m" ;;
			-green)         color="\033[32;01m" ;;
			-yellow)        color="\033[33;01m" ;;
			-blue)          color="\033[34;01m" ;;
			-n)             one_line=1;   shift ; continue ;;
			*)              echo -n "$1"; shift ; continue ;;
		esac
	shift
	echo -en "$color"
	echo -en "$1"
	echo -en "\033[00m"
	shift
done
if [ ! $one_line ]; then
	echo
fi
}
##################################

LOG_FILE="$HOME/0packages-install.log"
touch $LOG_FILE
ERROR_LIST=""
WARNING_LIST=""

function cinstall {
    cecho -n -yellow "INSTALLING "
    echo -n "| "
    for w in "$@"; do cecho -n -blue "$w"; echo -n " | "; done; echo
    #
    apt install "$@"
    if [ $? -ne 0 ]; then
        MSG="$(cecho -n -red ERROR): '$@'"
        ERROR_LIST="$ERROR_LIST$MSG\n"
        echo "$MSG" >> $LOG_FILE
        echo "$MSG"
    fi
}

function snap_install {
    cecho -n -yellow "INSTALLING "
    echo -n "| "
    for w in "$@"; do cecho -n -blue "$w"; echo -n " | "; done; echo
    #
    snap install "$@"
    if [ $? -ne 0 ]; then
        MSG="$(cecho -n -red ERROR): '$@'"
        ERROR_LIST="$ERROR_LIST$MSG\n"
        echo "$MSG" >> $LOG_FILE
        echo "$MSG"
    fi
}

cecho -green "$(date '+%F_%T') STARTING" >> $LOG_FILE

###### UI setup
update-locale LC_TIME=pt_BR.UTF-8

###### INTERNET

# Whatsapp, Skype
cinstall skypeforlinux

# required for mailspring notifications
sudo apt install zenity

###################

# Web Dev
cinstall composer
sudo npm install -g bower
sudo npm install gulp-cli -g
sudo npm install -g indium # emacs IDE Idium server
sudo npm install -g prettier

# php + required for laravel
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
# if you install XAMPP, don't install apache2...
# cinstall apache2 libapache2-mod-php7.3
cinstall php7.3 php7.3-xml php7.3-gd php7.3-opcache php7.3-mbstring php7.3-zip php7.3-mysql

# para conectar na VPN do CIn com L2TP
cinstall network-manager-l2tp network-manager-l2tp-gnome network-manager-strongswan libstrongswan-standard-plugins libstrongswan-extra-plugins

# outras VPNs
cinstall openvpn network-manager-openvpn network-manager-openvpn-gnome network-manager-pptp-gnome

# necessário para openvpn atualizar dns após conectar
cinstall openvpn-systemd-resolved

# para usar comandos de samba
sudo apt install smbclient 

# required for text base window switcher
sudo apt-get install wmctrl

# ExMPlayer - player com thumbs
# sudo add-apt-repository -y ppa:exmplayer-dev/exmplayer
# sudo apt-get update
# cinstall exmplayer

# recognize webcams
cinstall v4l-utils qv4l2

# 

# create usb bootable
sudo add-apt-repository -y ppa:gezakovacs/ppa
sudo apt-get update
cinstall unetbootin

# openshot video editor
sudo add-apt-repository -y ppa:openshot.developers/ppa
sudo apt-get update
cinstall openshot-qt

# rclone
curl https://rclone.org/install.sh | sudo bash

# instalar linux a partir de imagem ISO (sem pen-drive)
cinstall grub-imageboot

# necessário para ANGRYsearch
cinstall python3-pyqt5

# necessário para toggl
wget http://fr.archive.ubuntu.com/ubuntu/pool/main/g/gst-plugins-base0.10/libgstreamer-plugins-base0.10-0_0.10.36-1_amd64.deb
wget http://fr.archive.ubuntu.com/ubuntu/pool/universe/g/gstreamer0.10/libgstreamer0.10-0_0.10.36-1.5ubuntu1_amd64.deb
sudo dpkg -i libgstreamer*.deb
rm libgstreamer-plugins-base0.10-0_0.10.36-1_amd64.deb
rm libgstreamer0.10-0_0.10.36-1.5ubuntu1_amd64.deb

# GhostWriter Markdown editor
sudo add-apt-repository ppa:wereturtle/ppa
sudo apt-get update
cinstall ghostwriter 

# docker
# see https://forums.linuxmint.com/viewtopic.php?t=300469
cinstall apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
source /etc/os-release # provide $UBUNTU_CODENAME
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $UBUNTU_CODENAME stable"
sudo apt-get update
cinstall docker-ce docker-ce-cli containerd.io

# Typora Markdown editor
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE


# culr para baixar arquivos e páginas da internet e dar output no bash
cinstall curl

# ativar o numlock no login
cinstall numlockx

# gravador de DVD mais simples e confiável
cinstall xfburn

# fontes extra
cinstall fonts-crosextra-carlito fonts-crosextra-caladea

# reconhecer e utilizar scanners
apt-get install sane sane-utils libsane-extras xsane

# File Explorer com MUITO mais opções, simples e direto
cinstall doublecmd-gtk

# App para busca muito mais interessante que o padrão
cinstall catfish

# Doxygen para gerar docs de alguns repos
cinstall doxygen

# Klavaro - praticar digitação
cinstall klavaro

# dependências para checkTBW do samsung EVO
cinstall smartmontools

# necessário para servico seguranca BB
cinstall libnss3-tools libcurl3 python-gpg

# necessário para impressoras epson
cinstall lsb printer-driver-escpr

# leitor de PDF do KDE
cinstall okular

# Editor de legendas
cinstall subtitleeditor

# Controle de Volume do PulseAudio
cinstall pavucontrol

# Timer, couontdown, etc.
cinstall gnome-clocks

# gnome-contacts e evolution para sincronizar CONTATOS do google
cinstall evolution gnome-contacts

# redimensionar imagens facilmente do context-menu no nemo
cinstall nemo-image-converter

# abrir .epub e gerenciar ebooks
cinstall calibre

# gerenciador de configurações específicas
cinstall dconf-editor

# abrir terminal na pasta local com F4
# AVISO: ver descrição no .md
cinstall nemo-terminal

# compressão descompressão
cinstall unzip arj p7zip p7zip-full p7zip-rar rar unrar unace-nonfree

# audacity	editar converter MUSICAS
cinstall audacity

# isomaster	editar / criar arquivos de imagem ISO
cinstall isomaster

#---------- aplicativos de rede --------------#
# aria2 - download de urls e sites (como wget) com multiplas conexoes
#    ariac -x N_MAX_CONX -s N_PARTES  --> geralmente os dois são iguais
cinstall aria2 fping

# vlc
cinstall vlc

# spotify
cinstall spotify-client

# latex
cinstall texlive-latex-extra texlive-humanities texlive-lang-portuguese texlive-lang-english texlive-lang-french abntex aspell-pt-br aspell-pt-br rubber texmaker texlive-science lmodern texlive-bibtex-extra texlive-xetex latexmk texlive-pstricks texlive-fonts-extra texlive-font-utils

# pdfcrop
#    ideal para incluir partes de PDFs como graphics no LaTeX
cinstall texlive-extra-utils

# git e gitk
cinstall git gitk # gitg git-gui
git config --global user.name "Rodrigo Bernardino"
git config --global user.email rbbernardino@gmail.com
git config --global push.default simple

# dependências para GitKraken
cinstall libgnome-keyring-common libgnome-keyring-dev

# for current Ubuntu emacs: (currently 25)
# cinstall emacs emacs-goodies-el markdown clang libclang-6.0-dev cppcheck

# for latest stable release (currently 26)
sudo add-apt-repository -y ppa:kelleyk/emacs
sudo apt-get update
cinstall emacs26
cinstall emacs-goodies-el markdown clang libclang-6.0-dev cppcheck

# for rtags
cinstall llvm-6.0 llvm-6.0-dev lua5.3

# cmake
cinstall cmake cmake-gui

# terminator
cinstall terminator
cinstall tilix

# Emacs speaks statistics
# cinstall ess

# para compilar ctags e outros
cinstall autoconf autopoint autotools-dev libtool

# Dependências para gnuglobal (instalar do source)
# cinstall global
cinstall libncurses5-dev


# pdfs edit and gui with PDF Chain
# cinstall pdftk pdfchain

# for ubuntu 18.04 based - Bionic
# wget http://archive.ubuntu.com/ubuntu/pool/universe/p/pdftk/pdftk_2.02-4build1_amd64.deb
# wget http://archive.ubuntu.com/ubuntu/pool/main/g/gcc-6/libgcj17_6.4.0-8ubuntu1_amd64.deb
# wget http://archive.ubuntu.com/ubuntu/pool/main/g/gcc-defaults/libgcj-common_6.4-3ubuntu1_all.deb
# sudo dpkg -i pdftk_2.02-4build1_amd64.deb libgcj17_6.4.0-8ubuntu1_amd64.deb libgcj-common_6.4-3ubuntu1_all.deb
# rm pdftk_2.02-4build1_amd64.deb libgcj17_6.4.0-8ubuntu1_amd64.deb libgcj-common_6.4-3ubuntu1_all.deb

# npm & nodejs
# cinstall npm
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt-get install -y nodejs

# javascript apps
npm install -g live-server
npm install -g eslint

# convert any website into an app
npm install -g nativefier

# java JDK
cinstall default-jdk ant maven execstack

#--------------- GNU PLOT ------------------
# instalar do source (baixar do site)
#
# dependências
# terminais: pdfcairo, pngcairo, epscairo, wxt interativo, png, gif, jpeg,
#            qt interativo, caca (text), external libreadline (recommended)
#            libcerf-dev (funções matemáticas da biblioteca cerf
cinstall qtbase5-dev libqt5svg5-dev qttools5-dev-tools libcairo2-dev libpango1.0-dev libwxgtk3.0-dev libgtk2.0-dev libgd-dev qtbase5-dev libqt5svg5-dev libcaca-dev libreadline-dev liblua5.3-dev libcerf-dev

##-----------------------------------------

# Gparted
cinstall gparted

# associar livremente uma ou uma combinação de teclas a um comando
cinstall xbindkeys xbindkeys-config

# simular pressionar teclas
cinstall xdotool

# icones do dropbox
cinstall -y nemo-dropbox

#------------------ FROM PPA --------------#

# codec H.265/hevc
sudo apt-add-repository -y ppa:strukturag/libde265
sudo apt-get update
cinstall libde265-0 # vlc-plugin-libde265

# remover itens indesejados da lista do GRUB
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo apt-get update
cinstall grub-customizer

# Impressao Digital
sudo add-apt-repository -y ppa:fingerprint/fprint
sudo apt-get update
cinstall -y libpam-fprintd 

# configurar grub com gui
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo apt-get update
cinstall -y grub-customizer

# gnome-pie
sudo add-apt-repository -y ppa:simonschneegans/testing
sudo apt-get update
cinstall gnome-pie

# avidemux editar, converter, extrair, comprimir, etc, VIDEOS
sudo add-apt-repository -y ppa:ubuntuhandbook1/avidemux
sudo apt-get update
cinstall avidemux2.7
WARNING_LIST="$WARNING_LIST$(cecho -n -yellow WARNING:) check if avidemux2.7 is latest"

#########
# PRODUCTIVITY

# NixNote Fork - Evernote native client
sudo add-apt-repository -y ppa:nixnote/nixnote2-stable
sudo apt update
cinstall nixnote2

#########
cinstall highlight


#########

# alterar conteiners MKV adicionando legenda, etc.
sudo apt install mkvtoolnix mkvtoolnix-gui

# converter videos com FFMPEG
# como usar: https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
cinstall ffmpeg libavcodec-extra

# libav-tools não está mais disponível oficialmente, necessitaria de adicionar um ppa,
# porém acredito que o ffmpeg já atende
# sudo add-apt-repository ppa:jonathonf/ffmpeg-3
# sudo apt update
# sudo apt install ffmpeg libav-tools x264 x265

# check media file information
cinstall mediainfo

# Musescore - music notation editor
# cinstall musescore
flatpak install -y --from https://flathub.org/repo/appstream/org.musescore.MuseScore.flatpakref

# GNOME To Do
flatpak install -y flathub org.gnome.Todo

# OpenBoard
flatpak install flathub ch.openboard.OpenBoard

# Kitra
sudo add-apt-repository -y ppa:kritalime/ppa
sudo apt-get update
cinstall krita

# required (?) for Nuvola
cinstall gnome-software-plugin-flatpak

###### PROGRAMMING

# snap para pacotes snap
cinstall snapd
snap_install tusk # tusk - evernote app

# IntelliJ Community
# sudo snap install intellij-idea-community --classic
# sudo add-apt-repository -y ppa:ubuntuhandbook1/apps
# sudo apt-get update
# cinstall intellij-idea-community

# IntelliJ Ultimate (Flatpak not working)
# sudo flatpak install -y flathub com.jetbrains.IntelliJ-IDEA-Ultimate

sudo apt-add-repository -y ppa:mmk2410/intellij-idea
sudo apt-get update
cinstall intellij-idea-ultimate

# OpenCV - dependências (<17.04)
# cinstall build-essential cmake pkg-config libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev libgtk-3-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran libdc1394-22-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libgtk2.0-dev libopenexr-dev python3-dev

############################################################################
# OpenCV - dependências (>=17.04)
cinstall build-essential cmake pkg-config # basic
cinstall python3-dev                      # python 3 headers and libraries
cinstall libgtk-3-dev                    # GTK GUI
cinstall libatlas-base-dev gfortran      # optimizes various functions
sudo apt-get install libgtk-3-dev # GUI functionalites (highghui module)
sudo apt-get install libtbb-dev # Parallelism library C++ for CPU
cinstall libjpeg-dev libpng-dev libtiff-dev # work with images

# work with videos
cinstall libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
	 libavresample-dev libxvidcore-dev libgstreamer1.0-dev \
	 libgstreamer-plugins-base1.0-dev x264 libx264-dev

# work with audios
cinstall libfaac-dev libmp3lame-dev libtheora-dev libfaac-dev \
	 libmp3lame-dev libvorbis-dev

# several extras
cinstall libdc1394-22-dev libxine2-dev libqt4-dev libgtk2.0-dev libopenexr-dev
############################################################################

# bibliotecas C++
cinstall libboost-all-dev
###################

# para redshift
cinstall libxcb-randr0-dev intltool libtool autoconf autopoint

# virtualbox (prefiro usar a versão do site, não open-source)
# instalando aqui apenas as dependências
# cinstall virtualbox-qt
cinstall libqt5core5a libcurl4 libqt5opengl5
# usuário para acessar USB
sudo usermod -aG vboxusers rodrigo

##############################################################
################### R ########################################
# instalar R, software de estatística
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu bionic/'
# sudo apt-get update
cinstall r-base r-base-dev

# dependência para rstudio
cinstall libjpeg62 libclang-dev

# dependências R para tidyverse e outros
cinstall libxml2-dev libcurl4-openssl-dev libssl-dev

cinstall libv8-3.14-dev

# Peek para capturar GIFs animados e até vídeos da tela
sudo add-apt-repository -y ppa:peek-developers/stable
sudo apt update
cinstall peek

#-------------------------------------
# R packages dependencies
wget https://dist.apache.org/repos/dist/dev/arrow/KEYS 
sudo apt-key add < KEYS
rm KEYS
source /etc/os-release # provide $UBUNTU_CODENAME
DISTRO=$UBUNTU_CODENAME
sudo add-apt-repository "deb [arch=amd64] http://dl.bintray.com/apache/arrow/ubuntu $DISTRO main"
sudo apt update
sudo apt-get install libarrow-dev libparquet-dev

#-------------------------------------
# Data Science + plotting (R packages)
#-----
#    tidyverse    - data science
#    plotly       - interactive plots
#    shiny        - interactive web apps
#    plyr         - useful functions to deal with data.frames
#    gridExtra    - better multi-page output of single PDF
#    RColorBrewer - generate custom palletes for plots
#    js           - minify javascript files and other
#    dtplyr       - automatically converts dplyr code into data.table equivalent
#    rio          - rI/O swiss knife to read/write data in R
#    feather      - an extremely efficient import/export tool between Python/R
sudo su - -c "R -e \"install.packages(c('tidyverse', 'plotly', 'shiny', 'plyr', 'dtplyr'))\""
sudo su - -c "R -e \"install.packages(c('gridExtra', 'RColorBrewer'))\""
# sudo su - -c "R -e 'install.packages(\"arrow\")'"
# sudo su - -c "R -e \"install.packages(c('rio'))\""
sudo su - -c "R -e \"install.packages('tidyxl')\"


#-------------------------------------
# Modeling (R packages)
#-----
#    leaps     - for computing best subsets regression
#    caret     - for easy machine learning workflow
sudo su - -c "R -e \"install.packages(c('leaps', 'caret'))\""

#-------------------------------------
# R markdown packages
#-----
#    knitr     - basic package 1
#    rmarkdown - basic package 2
#    DT        - format tables to make them searchable etc.
sudo su - -c "R -e \"install.packages(c('knitr', 'rmarkdown', 'reticulate', 'DT'))\""


#-------------------------------------
# Other R packages
#-----
#    devtools - compile and install packages (?)
#    png      - read PNG images
#    tictoc   - measure execution time (tic('msg'), toc())
#    lintr    - provides linting
#    revest   - scrap webpages, parse html and extract information
sudo su - -c "R -e \"install.packages(c('devtools', 'png', 'tictoc', 'psych'))\""
sudo su - -c "R -e \"install.packages(c('lintr'))\""
sudo su - -c "R -e \"install.packages(c('rvest'))\""

# Machine learning (R packages)
#    rattle    - ???
#    gdata     - ???
#    compare   - ???
#    sqldf     - ???
#    MeanShift - ???
# sudo su - -c "R -e \"install.packages(c('rattle', 'gdata', 'compare', 'sqldf', 'MeanShift'))\""

##############################################################

# captura de tela com edição
cinstall shutter libextutils-depends-perl libextutils-pkgconfig-perl

# wine
#cinstall wine-stable wine32-preloader

# lightshot, captura de tela com edição do windows com wine (testando)
#wget http://app.prntscr.com/build/setup-lightshot.exe
#wine ./setup-lightshot.exe
#rm setup-lightshot.exe

# dependÊncias de tidyverse
cinstall -y libxml2-dev libcurl4-openssl-dev libssl-dev

# Go (google language)
cinstall golang-go

# install latest GCC & g++
sudo apt install gcc-8 g++-8

# Solaar git build from ppa
sudo add-apt-repository -y ppa:solaar-unifying/ppa
sudo apt-get update
sudo apt install solaar

##############################################################
############################## PYTHON ########################
###### PYTHON 2 no longer used
# pip - python package installer (required to install scikit-learn)
# wget https://bootstrap.pypa.io/get-pip.py
# sudo -H python get-pip.py
# rm get-pip.py 

# requirements for tensorflow
cinstall build-essential cmake unzip pkg-config
cinstall gcc-6 g++-6
cinstall libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
cinstall libjpeg-dev libpng-dev libtiff-dev
cinstall libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
cinstall libxvidcore-dev libx264-dev
cinstall libopenblas-dev libatlas-base-dev liblapack-dev gfortran
cinstall libhdf5-serial-dev
cinstall python3-dev python3-tk python-imaging-tk
cinstall libgtk-3-dev

# pip for python3
wget https://bootstrap.pypa.io/get-pip.py
sudo -H python3 get-pip.py
sudo -H pip install --upgrade pip

## -------- virtual environment --------- ##
sudo -H pip install virtualenv virtualenvwrapper
cinstall virtualenvwrapper
cinstall direnv

# required for something I don't remember (maybe matplotlib)
cinstall python3-tk

# support to IPython notebook (no longer aviable for 18.04
# cinstall ipython3-notebook

# install jupyter
sudo pip install jupyter

# required for Solaar
cinstall python-pyudev

# ----- pip packages install NOTE  -----#
# it's recommended not to use sudo and do 'pip install --user packages...'
# -U will upgrade all packages before install

# SciPy Stack (required for scikit-learn)
sudo -H pip install -U numpy scipy sklearn matplotlib pandas sympy nose

# scikit-learn (requires pip)
sudo -H pip install scikit-learn

## ------ elpy ----------##
sudo -H pip install jedi        # Either rope or jedi
sudo -H pip install flake8      # for code checks
sudo -H pip install importmagic # for automatic imports
sudo -H pip install autopep8    # for automatic PEP8 formatting
sudo -H pip install yapf        # for code formatting
sudo -H pip install pylint      # better flycheck for python
sudo -H pip install adjustText  # adjust text of annotations in matplotlib
sudo -H pip install black       # for elpy, dunno why

# Pillow - PIL - image library
sudo -H pip install Pillow

# ssh managing
cinstall python3-nmap

# same as above, but for python3
#    Note: ipython5 terminal is incompatible with emacs shels, so installing 4.2.1 version
# sudo -H pip3 install -U numpy Pillow scipy matplotlib ipython==4.2.1 pandas sympy nose scikit-learn setuptools jedi flake8 importmagic autopep8 yapf pylint adjustText virtualenv virtualenvwrapper scikit-image

# opencv on python3
sudo -H pip3 install opencv-python

## clear cache
sudo -H rm -rf ~/.cache/pip
##############################################################
##############################################################

# remote management
cinstall tmux sshpass openssh-server openssh-client x2goclient
cinstall software-properties-common
sudo add-apt-repository -y ppa:tmate.io/archive
sudo apt-get update
cinstall tmate

# progress bar
cinstall pv

# network managment
cinstall nmap

# fix can't connect after suspend with dell vostro wireless (wifi) card
#    repo is outdated, wont work for last kernel version
#    cinstall r8168-dkms
# wget http://mirrors.kernel.org/ubuntu/pool/universe/r/r8168/r8168-dkms_8.044.02-2_all.deb
# cinstall dkms
# sudo dpkg -i r8168-dkms_8.044.02-2_all.deb

# outros apps
cinstall tree

###  -------------  Requer ação durante instalação --------- ###


# refind: bootloader bonitao
# sudo add-apt-repository -y ppa:rodsmith/refind
# sudo apt-get update
# cinstall refind

# java JDK Oracle
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
cinstall oracle-java8-installer
cinstall oracle-java8-set-default

#----------------------------------------------------------------------#
# limpando pacotes não usados
sudo apt-get autoremove

##------------ nvidia driver (most recent) -------------------------- ##
# check later if there is no other one more recent than 381...
# remember cuda toolkit occupies a lot of disk space (900MB+)
# sudo add-apt-repository -y ppa:graphics-drivers/ppa
# cinstall nvidia-381
cinstall nvidia-settings nvidia-prime
# cinstall nvidia-cuda-toolkit


##----------------- GPaste -------------------------- ##
# clipboard managing tool
# please also install cinnamon spice (better applet)
cinstall gpaste gir1.2-gpaste-4.0

##---------- output of cmd to clipboard ---------- ##
cinstall xclip

# Japonês Input method
cinstall fcitx fcitx-mozc im-config fcitx-config-gtk fcitx-tools

##----------- Terminal Fuzzy Finder -------------------------- ##
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


#####################################################
####### REMOVER
# Orca: for visually imparied
# Mono: .NET impplementation for linux
sudo apt-get remove mono-runtime-common gnome-orca
####################################################

####################################################
####### POS-INSTALL

# enable firewall
sudo ufw enable

# fontes da microsoft (requer confirmação)
cinstall ttf-mscorefonts-installer

if [[ $ERROR_LIST || $WARNING_LIST ]]; then
    echo -e "\n"
    echo "---------------------------------------"
    echo "--------------- ERRORS ----------------"
    echo "---------------------------------------"
    echo -e "$ERROR_LIST"
    echo
    echo "---------------------------------------"
    echo "-------------- WARNINGS ---------------"
    echo "---------------------------------------"
    echo -e "$WARNING_LIST"
fi

cecho -green "$(date '+%F_%T') FINISHED" >> $LOG_FILE

# muder ownership do $HOME para o usuário!
# sudo chown -R $USER:$USER $HOME

##----------------- Desativado -------------------------- ##

# Octave
# sudo add-apt-repository -y ppa:octave/stable
# sudo apt-get update
# cinstall octave octave-image octave-communications

#-------------------------------------------------------------

# ffmpeg e outros:
# ppa:mc3man/trusty-media
# apt-get update
# cinstall ffmpeg

#-------------------------------------------------------------

# codecs - MUUUUUITOS!
#sudo apt-fast install ubuntu-restricted-extras libxine1-ffmpeg gxine mencoder mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 ffmpeg totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 libjpeg-progs flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview flac libmpeg3-1 mpeg3-utils mpegdemux liba52-0.7.4-dev gstreamer0.10-ffmpeg gstreamer0.10-fluendo-mp3 gstreamer0.10-gnonlin gstreamer0.10-plugins-bad-multiverse gstreamer0.10-schroedinger gstreamer0.10-plugins-ugly gstreamer-dbus-media-service gstreamer-tools

#-------------------------------------------------------------

# latex extra  (ocupa muito espaço)
# cinstall texlive-fonts-extra

#-------------------------------------------------------------

## gestures do touchpad (não funfa pq compiz e cinnamon não se entendem)
# cinstall touchegg
# cinstall compiz --install-recommends

#-------------------------------------------------------------

# para get_flash_videos
# sudo apt-fast install libwww-mechanize-perl libxml-simple-perl
# git clone https://github.com/monsieurvideo/get-flash-videos.git
# git pull
# make clean
# make
# sudo make install

#-------------------------------------------------------------

# - xreader: compilar o mais recente
# baixar do github
# git clone git@github.com:linuxmint/xreader.git
# instalar dependencias
# cinstall debhelper gobject-introspection libcaja-extension-dev libnemo-extension-dev libdjvulibre-dev libgail-3-dev libgirepository1.0-dev libgtk-3-dev libgxps-dev libkpathsea-dev libpoppler-glib-dev libsecret-1-dev libspectre-dev libwebkit2gtk-4.0-dev libxml2-dev mate-common yelp-tools
# ### se faltar algum:
# dpkg-checkbuilddeps
# ## preparar o build:
# cinstall devscripts
# debuild -us -uc -b
# make
# sudo make install

#-------------------------------------------------------------

# para rodar opengl no linux quando usando driver da nvidia:
# cinstall mesa-common-dev
# criar symlinks assim:
# <current> = versão usada do driver nvidia
# <local symlink>          => <local arquivo original>
# /usr/lib/libGL.so.1      => /usr/lib/nvidia-<current>/libGL.so.1
# /usr/lib32/libGL.so.1    => /usr/lib32/nvidia-<current>/libGL.so.1
# /usr/lib/libGL.so        => /usr/lib/nvidia-<current>/libGL.so
# /usr/lib32/libGL.so      => /usr/lib32/nvidia-<current>/libGL.so
# /usr/lib/libnvidia-tls.so.<cur->.<-rent>   => /usr/lib/nvidia-<current>/libnvidia-tls.so.<cur->.<-rent>
# /usr/lib32/libnvidia-tls.so.<cur->.<-rent>   => /usr/lib32/nvidia-<current>/libnvidia-tls.so.<cur->.<-rent>
# /usr/lib64/libnvidia-tls.so.<cur->.<-rent>   => /usr/lib64/nvidia-<current>/libnvidia-tls.so.<cur->.<-rent>

# /usr/lib/libnvidia-glcore.so.<cur->.<-rent>   => /usr/lib/nvidia-<current>/libnvidia-glcore.so.<cur->.<-rent>
# /usr/lib32/libnvidia-glcore.so.<cur->.<-rent>   => /usr/lib32/nvidia-<current>/libnvidia-glcore.so.<cur->.<-rent>
# /usr/lib64/libnvidia-glcore.so.<cur->.<-rent>   => /usr/lib64/nvidia-<current>/libnvidia-glcore.so.<cur->.<-rent>

#-------------------------------------------------------------

# necessario para compilar e instalar erlang completo
#sudo apt-fast install -y build-essential fop libncurses5-dev openssl libssl-dev xsltproc unixodbc-dev g++ libssl-dev libwxbase2.8-0 libwxgtk2.8-dev libqt4-opengl-dev libgtk2.0-dev
