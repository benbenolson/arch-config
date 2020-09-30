#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p $HOME/.config/i3/
ln -s ${BASEDIR}/.config/i3/config $HOME/.config/i3/config

mkdir -p $HOME/.config/fontconfig
ln -s ${BASEDIR}/.config/fontconfig/fonts.conf ${HOME}/.config/fontconfig/fonts.conf

mkdir -p ${HOME}/.local/share/
cp -r ${BASEDIR}/.local/share/fonts ${HOME}/.local/share/
fc-cache -fv

mkdir -p ${HOME}/.yed
cp ${BASEDIR}/.yed/init.c ${HOME}/.yed/
cd ${HOME}/.yed
gcc -shared -fPIC -g -O3 init.c -lyed -o init.so
