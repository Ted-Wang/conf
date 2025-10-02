#!/bin/bash

# if run this script directly like ./env_init.sh, and result in an error: 
#   bind: warning: line editing not enabled.
# you need to source this script: source env_init.sh. Cause and solution see here: 
#   https://superuser.com/questions/240223/warning-line-editing-not-enabled
# You get "line editing not enabled" when running in a non-interactive shell. The shell becomes non-interactive when started with -c or e.g. when stdin/stderr are not TTYs.
# ----原因是，因为脚本执行是在一个 non-interactive shell 里，所以才报这个错，可以通过增加判断来解决：

# the cmd 'bind -x' cannot be find in this script, it is used in .ted.bashrc which is sourced by this script.

SHELL_PROMPT=shell_prompt.sh
VIM_CONF_FOLDER="$HOME/.vim"
SSH_CONFIG="$HOME/.ssh/config"
MY_SCRIPT_FOLDER="$HOME/my_script"
# MY_SCRIPT_FOLDER_ 这个变量不用双引号而用单引号，是为了在后面 copy_script_and_source_it() 函数中 patch bashrc 文件时，保持原始 $HOME 变量，而不是被展开成具体的目录比如 /c/User/ted/my_script，
# 这是为了解决 mobaXterm 的 Terminal/bash 中映射路 $HOME 径不同于 git-bash 从而导致的无法找到 my_script 目录的问题。
MY_SCRIPT_FOLDER_='$HOME/my_script'
TED_BASH_RC=.ted.bashrc
TED_ZSH_RC=.ted.zshrc
TED_VIM_RC=.ted.vimrc
TED_TMUX_CONF=tmux.conf
TED_BASH_RC_OLD=ted.bashrc
TED_VIM_RC_OLD=ted.vimrc

unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    MINGW*) runIn=Win/git-bash;;
    MSYS*) runIn=Win/msys2;;
    Darwin*) runIn=Mac;;
    CYGWIN*) runIn=Win/Cygwin;;
esac
if [[ "$runIn" == "Win/git-bash" ]] || [[ "$runIn" == "Win/Cygwin" ]] || [[ "$runIn" == "Win/msys2" ]]; then
    SUDO=""
elif [[ "$runIn" == "Linux-shell" ]]; then
    if [[ "$(whoami)" == "root" ]]; then
        SUDO=""
    else
        SUDO=sudo
    fi
else
    SUDO=sudo
fi

if [[ "$runIn" == "Mac" ]];then
    #BASE_DIR=${0%/*}
    BASE_DIR=$(dirname ${BASH_SOURCE[0]-$0})
else
    BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
fi
echo $BASE_DIR

function using_zsh(){
    local zsh_ver=$(echo $ZSH_VERSION)
    if [[ "" == "$zsh_ver" ]];then
        echo "yes"
    else
        echo "no"
    fi
}

function clear_old_rc_file(){
    if grep -Eq "^\s*so(urce){0,1}\s+~/${TED_VIM_RC_OLD}$" ~/.vimrc; then
        sed -i 's/ted\.vimrc/\.ted\.vimrc/g' ~/.vimrc
        \rm ~/${TED_VIM_RC_OLD}
    fi
    if grep -Eq "^\s*source\s+~/${TED_BASH_RC_OLD}$" ~/.bashrc; then
        sed -i 's/ted\.bashrc/\.ted\.bashrc/g' ~/.bashrc
        \rm ~/${TED_BASH_RC_OLD}
    fi
    echo clear old ted.***rc file done
}

function conf_tmux_conf(){
    echo setting up .tmux.conf...
    if [[ ! -f ~/.tmux.conf ]]; then
        \cp $BASE_DIR/common_conf/${TED_TMUX_CONF} ~/.${TED_TMUX_CONF}
    else
        echo ~/.tmux.conf exist, please update it manuanlly.
    fi
}

function conf_vimrc(){
    echo copyping vim colorscheme files...
    if [[ ! -d ${VIM_CONF_FOLDER} ]]; then
        mkdir ${VIM_CONF_FOLDER}
    fi
    \cp -r $BASE_DIR/common_conf/colors ${VIM_CONF_FOLDER}/

    echo setting up vimrc
    \cp $BASE_DIR/common_conf/${TED_VIM_RC} ~/
    chmod 644 ~/${TED_VIM_RC}
    if [[ ! -f ~/.vimrc ]]; then
        touch ~/.vimrc
        chmod 644 ~/.vimrc
    fi
    if grep -Eq "^\s*so(urce){0,1}\s+~/\.ted\.vimrc$" ~/.vimrc; then 
        : # do nothing
    else
        cat << EOF >> ~/.vimrc
if(filereadable(expand("~/${TED_VIM_RC}")))
    so ~/${TED_VIM_RC}
endif
EOF
    fi
    echo done.
}

function conf_bashrc(){
    echo setting up bashrc
    \cp $BASE_DIR/common_conf/${TED_BASH_RC} ~/
    chmod 644 ~/${TED_BASH_RC}
    if [[ ! -f ~/.bashrc ]]; then
        touch ~/.bashrc
        chmod 644 ~/.bashrc
    fi
    if grep -Eq "^\s*source\s+~/${TED_BASH_RC}$" ~/.bashrc; then
        : # do nothing
    else 
        cat << EOF >> ~/.bashrc
if [[ -f ~/${TED_BASH_RC} ]]; then
    source ~/${TED_BASH_RC}
fi
EOF
    fi
    # plan to move these aliases to a scirpt file and exposed as functions
    #echo appending vps_extra.bashrc to .ted.bashrc
    #patch_extra_bashrc $BASE_DIR/common_conf/vps_extra.bashrc
    echo done.
}

function patch_extra_bashrc(){
    local arg; for arg in $@; do
        if [[ -f $arg ]]; then
            cat $arg >> ~/${TED_BASH_RC}
        fi
    done
}

function conf_shell_theme_for_win(){
    if [[ "$runIn" == "Win/git-bash" ]] || [[ "$runIn" == "Win/msys2" ]]; then
        echo setting up shell theme for win/git-bash MSYS2
        myThemeFile=flat-ui
        if [[ -f $BASE_DIR/common_conf/ted-conf ]]; then
            \cp $BASE_DIR/common_conf/ted-conf /usr/share/mintty/themes/ 
            myThemeFile=ted-conf
        fi
        if ! grep -Eq "^ThemeFile.*$" ~/.minttyrc; then 
            echo "ThemeFile=$myThemeFile" >> ~/.minttyrc
        fi
    fi
}

function conf_ssh(){
    echo setting up ssh conf
    # ssh keep alive
    if [[ -f "$SSH_CONFIG" ]] && grep -Eq "TCPKeepAlive" "$SSH_CONFIG" || grep -Eq "TCPKeepAlive" /etc/ssh/ssh_config; then
        : # do nothing
    else
        if [[ ! -d ~/.ssh ]]; then
            mkdir ~/.ssh
        fi
        cat $BASE_DIR/common_conf/ssh_client_config >> "$SSH_CONFIG"
        #$SUDO chmod 644 $SSH_CONFIG
    fi
}

function conf_shell_prompt_inc_git(){
    # shell prompt
    # as file "~/.ted.bashrc" will be copied everytime, no need to check file content here.
    source $BASE_DIR/common_conf/$SHELL_PROMPT
    echo $(generateShellPromptWithGit) >> ~/${TED_BASH_RC}
    echo "" >> ~/${TED_BASH_RC}
    # another apporach is to copy this file and source it in ~/.ted.bashrc
    #\cp $BASE_DIR/common_conf/$SHELL_PROMPT ~/
    #echo "source ~/$SHELL_PROMPT" >> ~/${TED_BASH_RC}
}

function conf_git(){
    echo setting up git conf
    # git config
    GIT_CONF=$BASE_DIR/common_conf/git.gitconfig
    if [[ "$runIn" == "Linux-shell" ]]; then
        \cp $GIT_CONF $BASE_DIR/common_conf/git.gitconfig.linux
        GIT_CONF=$BASE_DIR/common_conf/git.gitconfig.linux
        # set credential store to cache in Linux
        sed -i 's/helper\ =\ manager/helper\ =\ cache --timeout=3600/g' $GIT_CONF
    fi
    # check if .gitconfig is updated, backup it before override.
    if [[ -f ~/.gitconfig ]];then
        sum1=$(md5sum ~/.gitconfig)
        sum2=$(md5sum $GIT_CONF)
        sum1=${sum1:0:32}
        sum2=${sum2:0:32}
        if [[ "$sum1" != "$sum2" ]]; then
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
    if [[ "${GIT_CONF:0-5:5}" == "linux" ]];then
       \rm $GIT_CONF
    fi 
}

function conf_lanuage_CN(){
    # setup Chinese language support env
    # TBD
    : # do nothting right now.
}

function __check_my_script_folder() {
    if [[ ! -d "$MY_SCRIPT_FOLDER" ]]; then
        mkdir -p "$MY_SCRIPT_FOLDER"
        echo create folder: $MY_SCRIPT_FOLDER
    fi
}

function copy_script_to_my_script_folder() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [[ -f $arg ]]; then
            \cp $arg "$MY_SCRIPT_FOLDER"/
        fi
    done
}

function copy_script_and_make_symlink() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [[ -f $arg ]]; then
            \cp $arg "$MY_SCRIPT_FOLDER"/
            script_name="$MY_SCRIPT_FOLDER"/${arg##*/}
            echo copy file: $arg to $script_name
            link_name=${arg##*/}
            link_name=${link_name:0:-3}
            link_name=~/.local/bin/$link_name
            $SUDO ln -sf $script_name $link_name
            echo create symlink $link_name
        fi
    done
}

function copy_script_and_source_it() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [[ -f $arg ]]; then
            script_name="$MY_SCRIPT_FOLDER_"/${arg##*/}
            echo copy file: "$arg" to "$MY_SCRIPT_FOLDER"/
            \cp $arg "$MY_SCRIPT_FOLDER"/
            cat << EOF >> ~/${TED_BASH_RC}
if [[ -f "$script_name" ]]; then
    source "$script_name"
fi
EOF
        fi
    done
}

function conf_my_script() {
    if [[ -d "$MY_SCRIPT_FOLDER" ]]; then
        \rm "$MY_SCRIPT_FOLDER"/*
    fi
    copy_script_and_source_it $BASE_DIR/common_conf/m2.sh

    #copy_script_to_my_script_folder $BASE_DIR/script/dockertags.sh
    #copy_script_and_make_symlink $BASE_DIR/script/dockertags.sh
    copy_script_and_source_it $BASE_DIR/script/dockertags.sh

    
    if [[ "${1:-'all'}" != "work" ]]; then
        copy_script_and_source_it $BASE_DIR/common_conf/vps_fast.sh

        echo patching ted_extra.bashrc to ${TED_BASH_RC}
        copy_script_to_my_script_folder $BASE_DIR/script/wol.sh
        patch_extra_bashrc $BASE_DIR/common_conf/ted_extra.bashrc
    fi
}

function conf_m2_script(){
    # 1. add m2.sh(a very simple bookmark for shell) to ~/.ted.bashrc
    #echo -n '#--------a short bookmark function start--------' >> ~/${TED_BASH_RC}
    #if [[ -f $BASE_DIR/common_conf/m2.sh ]];then
        #cat $BASE_DIR/common_conf/m2.sh >> ~/${TED_BASH_RC}
    #fi
    #echo '#--------a short bookmark function end--------' >> ~/${TED_BASH_RC}

    # 2. another approach is to copy m2.sh and source it in ~/.ted.bashrc
    # move to upper function
    : # do nonthing
}


function apply_conf_all() {
    clear_old_rc_file
    conf_vimrc
    conf_bashrc
    conf_tmux_conf
    conf_ssh
    #conf_lanuage_CN
    conf_shell_prompt_inc_git
    conf_git
    #conf_m2_script
    conf_my_script
    conf_shell_theme_for_win
}

function apply_conf_work() {
    clear_old_rc_file
    conf_vimrc
    conf_bashrc
    conf_tmux_conf
    #conf_ssh
    #conf_lanuage_CN
    conf_shell_prompt_inc_git
    #conf_git
    #conf_m2_script
    conf_my_script $1
    conf_shell_theme_for_win
}

function apply_conf() {
    ENV=${1:-"home"}
    if [[ "${ENV}" == "work" ]]; then
        apply_conf_work ${ENV}
        echo "applying conf for work done."
    else 
        apply_conf_all ${ENV}
        echo "applying conf for all done."
    fi
}

# for Mac, use only in office env, default to use zsh instead of bash
function copy_script_and_source_it_for_Mac() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [[ -f $arg ]]; then
            script_name=$MY_SCRIPT_FOLDER/${arg##*/}
            echo copy file: $arg to "$script_name"
            \cp $arg "$MY_SCRIPT_FOLDER"/
            cat << EOF >> ~/${TED_ZSH_RC}
if [[ -f "$script_name" ]]; then
    source "$script_name"
fi
EOF
        fi
    done
}

function apply_conf_for_Mac() {
    conf_vimrc
    # TODO, consider if .tmux.conf need to be setting up here.

    if [[ "$runIn" == "Mac" ]] && [[ "yes" == $(using_zsh) ]]; then
        echo "detected you are using zsh on Mac,apply conf for Mac with .ted.zshrc"
        echo setting up .zshrc for Mac
        cp $BASE_DIR/common_conf/${TED_ZSH_RC} ~/
#        $SUDO chmod 644 ~/${TED_ZSH_RC}
#        if [[ ! -f ~/.zshrc ]]; then
#            touch ~/.zshrc
#            $SUDO chmod 644 ~/.zshrc
#        fi
        if grep -Eq "^\s*source\s+~/${TED_ZSH_RC}$" ~/.zshrc; then
            : # do nothing
        else 
            cat << EOF >> ~/.zshrc
if [[ -f ~/${TED_ZSH_RC} ]]; then
    source ~/${TED_ZSH_RC}
fi

EOF
        fi
    echo copying m2.sh
    copy_script_and_source_it_for_Mac $BASE_DIR/common_conf/m2.sh
    echo copying dockertags.sh
    copy_script_and_source_it_for_Mac $BASE_DIR/script/dockertags.sh

    # as syntax of 'sed -i' is different between Unix and Linux, use sed -i '' to replace sed -i in Mac
    # for more info, see https://stackoverflow.com/questions/16745988/sed-command-with-i-option-in-place-editing-works-fine-on-ubuntu-but-not-mac
    sed -i "" "s/sed\ -Ei/sed\ -Ei\ ''/g" $MY_SCRIPT_FOLDER/m2.sh

#    if [[ "${1:-'all'}" != "work" ]]; then
#        copy_script_and_source_it $BASE_DIR/common_conf/vps_fast.sh
#
#        echo patching ted_extra.bashrc to ${TED_BASH_RC}
#        copy_script_to_my_script_folder $BASE_DIR/script/wol.sh
#        patch_extra_bashrc $BASE_DIR/common_conf/ted_extra.bashrc
#    fi
    fi
}

if [[ "$runIn" == "Mac" ]]; then
    apply_conf_for_Mac $1
    source ~/${TED_ZSH_RC}
    # since there is no simple approach to get current shell name, just default to use zsh here.
    # https://stackoverflow.com/questions/3327013/how-to-determine-the-current-interactive-shell-that-im-in-command-line
else
    apply_conf $1
    source ~/${TED_BASH_RC}
fi

