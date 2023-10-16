
# Ted Wang's .bashrc, v0.01, 2019-01-19

# DO NOT change this file since it will be overrided everytime while calling init script env_init.sh.
# If you want to do some custimization to your shell, please update ~/.bashrc or related files.

currentEnv()
{
    unameOut="$(uname -s)"
    case $unameOut in
        Linux*) runIn=Linux;;
        MINGW*) runIn=Win/git-bash;;
        Darwin*) runIn=Mac;;
        CYGWIN*) runIn=Win/Cygwin;;
    esac
    echo $runIn
    return 0
}

#export -f currentEnv

# Linux bash 中的 alias 命令，可以存在参数，但是参数必须放在最后，这极大的限制了 alias 的使用。这里有个包装参数到中间的方式，参考自 StackOverlow 的答案：
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter/42466441#42466441

# 1. Linux 下模拟 windows 的 start。主要对 nohup firefox >&/dev/null & 命令的包装
# 方法一，通过一个临时函数过度：    ----此方法在传递字符 &(后台运行) 上有问题，会被解释为一个字符串，当作文件名，再想想办法。
#	alias run='f(){ nohup $@ >/dev/null 2>&1 '\''&'\'' ;  unset -f f; }; f'
# 方法二，通过调用一个 sub shell 来过度，注意最后的参数 _ 是必须的。
    alias run='bash -c '\''nohup "$@" >/dev/null 2>&1 &'\'' _'

# 在 Bash 命令中，默认只有 first word 会 check alias。但是，如果一个 alias 的 value 的最后一个字符是空白字符(space or tab)，那么 next word 也会 check alias。
# add this alias for running an alias with sudo. see more info: https://coderwall.com/p/9cviza/use-your-aliases-with-sudo
alias sudo='sudo '
if [[ $(currentEnv) == "Mac" ]]; then
    alias ls='ls -FG'
    alias l='ls -lFG'
    alias ll='ls -AlFG'
    alias la='ls -AFG'
    alias grep='grep --color=auto'
else
    alias ls='ls -F --color=auto'
    alias l='ls -lF --color=auto'
    alias ll='ls -AlF --color=auto'
    alias la='ls -AF'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
fi

alias du0='du -h --max-depth=0'
alias du1='du -h --max-depth=1'

proxy_url=http://127.0.0.1:7890
alias poff='unset http_proxy;unset https_proxy'
alias pon='export http_proxy=$proxy_url; export https_proxy=$proxy_url'


if [[ $(currentEnv) == "Win/git-bash" ]]; then
    alias ping='/bin/winpty ping'
fi

# LinuxMint 使用了 termbin.com，发现挺不错的。
NETCAT=nc
if [[ $(currentEnv) == "Win/git-bash" ]];then
    NETCAT=ncat
fi
alias tb="$NETCAT termbin.com 9999"
unset NETCAT
# 生成一个paste：echo text | tb；获取内容可以使用：curl http://termbin.com/xftf

gsettings --version >/dev/null 2>&1
if [[ $? == 0 ]]; then
    function setzoom() {
        if [[ "$1" == "" ]];then
            gsettings get org.gnome.desktop.interface text-scaling-factor;
        else
            gsettings set org.gnome.desktop.interface text-scaling-factor "$@";
        fi
    }
fi

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
# Ubuntu and Raspi does not read EDITOR variable by default, force to use it.
apt-get --help >/dev/null 2>&1
if [[ $? == 0 ]]; then
    alias visudo="EDITOR=$EDITOR visudo"
fi

# add alias for Manjaro
pacman --help > /dev/null 2>&1
if [[ $? == 0 ]] && [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
    alias sudo='sudo -E'
fi

# expand history size for shell
export HISTSIZE=10000
export HISTFILESIZE=10000

alias sshconf='vim ~/.ssh/config'
alias bashconf='vim ~/.bashrc'
alias bashconf1='vim ~/.ted.bashrc'
alias vimconf='vim ~/.ted.vimrc'

# Usage:
#   senc -in msg.txt -out msg.encrypted
#   sdec -in msg.encrypted -out msg.txt
alias senc='openssl enc -aes-256-cbc -a -salt -p -pbkdf2 -md sha256 '
alias sdec='openssl enc -aes-256-cbc -a -pbkdf2 -md sha256 -d '

# this is for displaying Chinese character correctly when SSH to Ubuntu Server by a terminal.
# it seems Ubuntu 20.04+ does not have this problem, occurred on Ubuntu 18.04 and Mac OS X.
export LANG=en_US.UTF-8

# def a command 'lsport' for Mac OS X, to list all current listening port
if [[ $(currentEnv) == "Mac" ]]; then
    lsport() {
        if [ $# -eq 0 ]; then
            sudo lsof -iTCP -sTCP:LISTEN -n -P
        elif [ $# -eq 1 ]; then
            sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
        else
            echo "Usage: lsport [pattern]"
        fi
    }
fi
