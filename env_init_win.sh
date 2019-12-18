#!/bin/bash

basefolder=${0%/*}

echo setting up .vimrc
cp $basefolder/vim/ted.vimrc ~/
chmod 644 ~/ted.vimrc
if [ ! -f ~/.vimrc ]; then
    touch ~/.vimrc
    chmod 644 ~/.vimrc
fi
echo "so ~/ted.vimrc" >> ~/.vimrc

echo setting up .bashrc
cp $basefolder/bash/ted.bashrc ~/
chmod 644 ~/ted.bashrc
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
    chmod 644 ~/.bashrc
fi
echo "source ~/ted.bashrc" >> ~/.bashrc
