#!/bin/bash

#basefolder=${0%/*}
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SHELL_PROMPT=shell_prompt.bashrc

unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    MINGW*) runIn=Win/git-bash;;
    Darwin*) runIn=Mac;;
esac
if [ "$runIn" == "Win/git-bash" ]; then
    SUDO="";
elif [ "$runIn" == "Linux-shell" ]; then
    SUDO=sudo;
else
    SUDO=sudo;
fi

echo setting up vimrc
cp -p $BASE_DIR/vim/ted.vimrc ~/
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
cp -p $BASE_DIR/bash/ted.bashrc ~/
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

# shell prompt
$SUDO cat $BASE_DIR/bash/$SHELL_PROMPT >> ~/ted.bashrc
# cp -p $BASE_DIR/bash/$SHELL_PROMPT ~/
# echo "source ~/$SHELL_PROMPT" >> ~/ted.bashrc

source ~/ted.bashrc
