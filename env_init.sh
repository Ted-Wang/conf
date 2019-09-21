#!/bin/bash

echo init .vimrc
cat ./vim/.vimrc >> ~/.vimrc

echo init .bashrc
cat ./bash/.bashrc >> ~/.bashrc

echo correct font fall back
sudo cp /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.avail/64-language-selector-prefer.conf.bak
sudo cat ./linux/64-language-selector-prefer.conf > /etc/fonts/conf.avail/64-language-selector-prefer.conf
sudo fc-cache -fv

