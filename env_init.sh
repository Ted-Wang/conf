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
\cp $BASE_DIR/common_conf/ted.vimrc ~/
$SUDO chmod 644 ~/ted.vimrc
if [ ! -f ~/.vimrc ]; then
    touch ~/.vimrc
    $SUDO chmod 644 ~/.vimrc
fi
if grep -Eq "^\s*so(urce){0,1}\s+~/ted\.vimrc$" ~/.vimrc
then 
    : # do nothing
else
    cat << EOF >> ~/.vimrc
if(filereadable(expand("~/ted.vimrc")))
    so ~/ted.vimrc
endif
EOF
fi
echo done.

echo setting up bashrc
\cp $BASE_DIR/common_conf/ted.bashrc ~/
$SUDO chmod 644 ~/ted.bashrc
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
    $SUDO chmod 644 ~/.bashrc
fi
if grep -Eq "^\s*source\s+~/ted.bashrc$" ~/.bashrc
then
    : # do nothing
else 
    cat << EOF >> ~/.bashrc
if [ -f ~/ted.bashrc ]; then
    source ~/ted.bashrc
fi
EOF
fi
echo done.

# shell prompt
# as file "~/ted.bashrc" will be copied everytime, no need to check file content here.
cat $BASE_DIR/common_conf/$SHELL_PROMPT >> ~/ted.bashrc
# \cp $BASE_DIR/common_conf/$SHELL_PROMPT ~/
# echo "source ~/$SHELL_PROMPT" >> ~/ted.bashrc

echo setting up ssh conf
# ssh keep alive
if [ -f ~/.ssh/config ] && grep -Eq "TCPKeepAlive" ~/.ssh/config || grep -Eq "TCPKeepAlive" /etc/ssh/ssh_config; then
    : # do nothing
else
    cat $BASE_DIR/common_conf/ssh_client_config >> ~/.ssh/config
fi

echo setting up git conf
# git config
if [ -f ~/.gitconfig ];then
    sum1=`md5sum ~/.gitconfig`
    sum2=`md5sum common_conf/git.gitconfig`
    sum1=${sum1:0:32}
    sum2=${sum2:0:32}
    if [ "$sum1" != "$sum2" ]; then
        \cp ~/.gitconfig ~/gitconfig.bak.`date "+%Y-%m-%d_%H-%M-%S"`
        \cp $BASE_DIR/common_conf/git.gitconfig ~/.gitconfig
    fi
else
    \cp $BASE_DIR/common_conf/git.gitconfig ~/.gitconfig
fi

# setup Chinese language support env
# TBD

source ~/ted.bashrc

