
# Ted Wang's .zshrc for Mac, v0.01, 2021-11-03
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

alias du0='du -h -d 0'
alias du1='du -h -d 1'

export HISTSIZE=10000
export HISTFILESIZE=10000
export LANG=en_US.UTF-8

# LinuxMint 使用了 termbin.com，发现挺不错的。
alias tb="nc termbin.com 9999"
# usage: 生成一个paste：echo text | tb；获取内容可以使用：curl http://termbin.com/xftf

if [ -f "/Users/huaiwa/my_script/m2.sh" ]; then
    source "/Users/huaiwa/my_script/m2.sh"
fi
if [ -f "/Users/huaiwa/my_script/dockertags.sh" ]; then
    source "/Users/huaiwa/my_script/dockertags.sh"
fi

# def a command 'lsport' for list all current listening port
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
