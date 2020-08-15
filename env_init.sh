#!/bin/bash

#basefolder=${0%/*}
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SHELL_PROMPT=shell_prompt.sh
SSH_CONFIG=~/.ssh/config

unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    MINGW*) runIn=Win/git-bash;;
    Darwin*) runIn=Mac;;
    CYGWIN*) runIn=Win/Cygwin;;
esac
if [ "$runIn" == "Win/git-bash" ] || [ "$runIn" == "Win/Cygwin" ]; then
    SUDO=""
elif [ "$runIn" == "Linux-shell" ]; then
    if [ "$(whoami)" == "root" ]; then
        SUDO=""
    else
        SUDO=sudo
    fi
else
    SUDO=sudo
fi

function conf_vimrc(){
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
}

function conf_bashrc(){
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
}

function conf_ssh(){
    echo setting up ssh conf
    # ssh keep alive
    if [ -f "$SSH_CONFIG" ] && grep -Eq "TCPKeepAlive" "$SSH_CONFIG" || grep -Eq "TCPKeepAlive" /etc/ssh/ssh_config; then
        : # do nothing
    else
        if [ ! -d ~/.ssh ]; then
            mkdir ~/.ssh
        fi
        cat $BASE_DIR/common_conf/ssh_client_config >> "$SSH_CONFIG"
        #$SUDO chmod 644 $SSH_CONFIG
    fi
}

function conf_shell_prompt_inc_git(){
    # shell prompt
    # as file "~/ted.bashrc" will be copied everytime, no need to check file content here.
    source $BASE_DIR/common_conf/$SHELL_PROMPT
    echo $(generateShellPromptWithGit) >> ~/ted.bashrc
    echo "" >> ~/ted.bashrc
    # another apporach is to copy this file and source it in ~/ted.bashrc
    #\cp $BASE_DIR/common_conf/$SHELL_PROMPT ~/
    #echo "source ~/$SHELL_PROMPT" >> ~/ted.bashrc
}

function conf_git(){
    echo setting up git conf
    # git config
    GIT_CONF=$BASE_DIR/common_conf/git.gitconfig
    if [ "$runIn" == "Linux-shell" ]; then
        \cp $GIT_CONF $BASE_DIR/common_conf/git.gitconfig.linux
        GIT_CONF=$BASE_DIR/common_conf/git.gitconfig.linux
        # set credential store to cache in Linux
        sed -i 's/helper\ =\ manager/helper\ =\ cache --timeout=3600/g' $GIT_CONF
    fi
    # check if .gitconfig is updated, backup it before override.
    if [ -f ~/.gitconfig ];then
        sum1=$(md5sum ~/.gitconfig)
        sum2=$(md5sum $GIT_CONF)
        sum1=${sum1:0:32}
        sum2=${sum2:0:32}
        if [ "$sum1" != "$sum2" ]; then
            \cp ~/.gitconfig ~/gitconfig.bak.`date "+%Y-%m-%d_%H-%M-%S"`
            \cp $GIT_CONF ~/.gitconfig
            echo ~/.gitconfig updated. The old .gitconfig file is renamed as a backup file.
        else
            echo no need to update ~/.gitconfig
        fi
    else
        \cp $GIT_CONF ~/.gitconfig
        echo create ~/.gitconfig
    fi
    # clear temp file
    if [ "${GIT_CONF:0-5:5}" == "linux" ];then
       \rm $GIT_CONF
    fi 
}

function conf_lanuage_CN(){
    # setup Chinese language support env
    # TBD
    : # do nothting right now.
}

SCRIPT_FOLDER=~/my_script
function __check_my_script_folder() {
    if [ ! -d "$SCRIPT_FOLDER" ]; then
        mkdir -p "$SCRIPT_FOLDER"
        echo create folder: $SCRIPT_FOLDER
    fi
}

function copy_script_to_my_script_folder() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [ -f $arg ]; then
            \cp $arg $SCRIPT_FOLDER/
        fi
    done
}

function copy_script_and_make_symlink() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [ -f $arg ]; then
            \cp $arg $SCRIPT_FOLDER/
            script_name=$SCRIPT_FOLDER/${arg##*/}
            echo copy file: $arg to $script_name
            link_name=${arg##*/}
            link_name=${link_name:0:-3}
            link_name=~/.local/bin/$link_name
            sudo ln -sf $script_name $link_name
            echo create symlink $link_name
        fi
    done
}

function copy_script_and_source_it() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [ -f $arg ]; then
            \cp $arg $SCRIPT_FOLDER/
            script_name=$SCRIPT_FOLDER/${arg##*/}
            echo copy file: $arg to $script_name
            cat << EOF >> ~/ted.bashrc
if [ -f $script_name ]; then
    source $script_name
fi
EOF
        fi
    done
}

function conf_my_script() {
    copy_script_and_source_it $BASE_DIR/common_conf/m2.sh

    #copy_script_to_my_script_folder $BASE_DIR/script/dockertags.sh
    #copy_script_and_make_symlink $BASE_DIR/script/dockertags.sh
    copy_script_and_source_it $BASE_DIR/script/dockertags.sh
}

function conf_m2_script(){
    # 1. add m2.sh(a very simple bookmark for shell) to ~/ted.bashrc
    #echo -n '#--------a short bookmark function start--------' >> ~/ted.bashrc
    #if [ -f $BASE_DIR/common_conf/m2.sh ];then
        #cat $BASE_DIR/common_conf/m2.sh >> ~/ted.bashrc
    #fi
    #echo '#--------a short bookmark function end--------' >> ~/ted.bashrc

    # 2. another approach is to copy m2.sh and source it in ~/ted.bashrc
    # move to upper function
    : # do nonthing
}

conf_vimrc
conf_bashrc
conf_ssh
#conf_lanuage_CN
conf_shell_prompt_inc_git
conf_git
#conf_m2_script
conf_my_script

source ~/ted.bashrc

