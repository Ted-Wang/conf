#!/bin/bash

basefolder=${0%/*}

echo setting up .vimrc
cp $basefolder/vim/ted.vimrc ~/
chmod 644 ~/ted.vimrc
if [ ! -f ~/.vimrc ]; then
    touch ~/.vimrc
    chmod 644 ~/.vimrc
fi
if grep -Eq "^so(urce){0,1}\s+~/ted\.vimrc$" ~/.vimrc
then 
    # do nothing
else
    echo "so ~/ted.vimrc" >> ~/.vimrc
fi

echo setting up .bashrc
cp $basefolder/bash/ted.bashrc ~/
chmod 644 ~/ted.bashrc
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
    chmod 644 ~/.bashrc
fi
if grep -Eq "^source\s+~/ted.bashrc$" ~/.bashrc
then
    # do nothing
else 
    echo "source ~/ted.bashrc" >> ~/.bashrc
fi
