#!/bin/bash

basefolder=${0%/*}

echo setting up .vimrc
cp $basefolder/vim/ted.vimrc ~/
sudo chmod 644 ~/ted.vimrc
if [ ! -f ~/.vimrc ]; then
    touch ~/.vimrc
    sudo chmod 644 ~/.vimrc
fi
sudo echo "so ~/ted.vimrc" >> ~/.vimrc

echo setting up .bashrc
cp $basefolder/bash/ted.bashrc ~/
sudo chmod 644 ~/ted.bashrc
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
    sudo chmod 644 ~/.bashrc
fi
sudo echo "source ~/ted.bashrc" >> ~/.bashrc

echo correct font fall back
sudo cp /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.avail/64-language-selector-prefer.conf.bak
sudo sh -c 'sudo cat ./linux/64-language-selector-prefer.conf > /etc/fonts/conf.avail/64-language-selector-prefer.conf'
sudo fc-cache -fv

