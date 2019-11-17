#!/bin/bash

echo init .vimrc
cat ./vim/ted.vimrc >> ~/.vimrc

echo init .bashrc
cat ./bash/ted.bashrc >> ~/.bashrc

echo correct font fall back
sudo cp /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.avail/64-language-selector-prefer.conf.bak
sudo sh -c 'sudo cat ./linux/64-language-selector-prefer.conf > /etc/fonts/conf.avail/64-language-selector-prefer.conf'
sudo fc-cache -fv

