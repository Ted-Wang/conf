#!/bin/bash

basefolder=${0%/*}

unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    Mingw*) runIn=Win/git-bash;;
    Darwin*) runIn=Mac;;
esac
if [ "$runIn" == "Win/git-bash" ]; then
    SUDO="";
elif [ "$runin" == "Linux-shell" ]; then
    SUDO=sudo;
else
    SUDO=sudo;
fi

echo setting up vimrc
cp $basefolder/vim/ted.vimrc ~/
$SUDO chmod 644 ~/ted.vimrc
if [ ! -f ~/.vimrc ]; then
    touch ~/.vimrc
    $SUDO chmod 644 ~/.vimrc
fi
if grep -Eq "^\s*so(urce){0,1}\s+~/ted\.vimrc$" ~/.vimrc
then 
    : # do nothing
else
    $SUDO cat << EOF >> ~/.vimrc
if(filereadable(expand("~/ted.vimrc")))
    so ~/ted.vimrc
endif
EOF
fi
echo done.

echo setting up bashrc
cp $basefolder/bash/ted.bashrc ~/
$SUDO chmod 644 ~/ted.bashrc
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
    $SUDO chmod 644 ~/.bashrc
fi
if grep -Eq "^\s*source\s+~/ted.bashrc$" ~/.bashrc
then
    : # do nothing
else 
    $SUDO cat << EOF >> ~/.bashrc
if [ -f ~/ted.bashrc ]; then
    source ~/ted.bashrc
fi
EOF
fi
echo done.
