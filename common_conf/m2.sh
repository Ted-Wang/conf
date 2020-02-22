
# 代码设计思路来自【韦易笑】的文章：[十行代码实现路径书签功能](https://zhuanlan.zhihu.com/p/57659856)
# 原文的实现思路是通过 symblol link 来实现，但是 symbol link 在 win/git-bash 下无法工作。ln命令会直接 copy 整个目录。
# 此脚本的实现思路是通过 .ini 文件来保存 bookmarks，相当于把 ini 文件当成一个 key-value 数据库来用。通过 grep 和 sed 来读取和修改文件。

# 功能
#   - m         # 列出当前所有书签
#   - m foo     # 跳转到名为 foo 的标签
#   - m +foo    # 将当前路径添加成书签 foo
#   - m -foo    # 删除名为 foo 书签
#   - m /foo    # 搜索名称里包含 foo 的书签

# 使用方法：source 此代码，或者把下面代码直接 append 到 .bashrc 里

# function for marks management
MARKFILE=$HOME/.local/share/marks.ini
function m() {
    MARKFILE="${MARKFILE:-$HOME/.local/share/marks.ini}"
    if [ ! -f "$MARKFILE" ]; then
        mkdir -p -m 700 "${MARKFILE%/*}" 2> /dev/null
        touch $MARKFILE && sudo chmod 700 $MARKFILE
    fi
    case "$1" in
        +*)            # m +foo  - add new bookmark for $PWD
            if grep -Eq "^${1:1}=" $MARKFILE; then
                sed -iE "s@${1:1}=.*\$@${1:1}=$(pwd)@" $MARKFILE
            else
                echo "${1:1}=$(pwd)" >> $MARKFILE
            fi
            ;;
        -*)            # m -foo  - delete a bookmark named "foo"
            sed -iE "/^${1:1}=/d" $MARKFILE
            ;;
        /*)            # m /bar  - search bookmarks matching "bar"
            grep -E "^.*?${1:1}.*?=" $MARKFILE | sed "s/=/\ ->\ /g"
            ;;
        "")            # m       - list all bookmarks
            cat $MARKFILE | sed "s/=/\ ->\ /g"
            ;;
        *)             # m foo   - cd to the bookmark directory
            if grep -Eq "^${1}=" $MARKFILE; then
                cd $(sed -E "s@^${1}=(.*)\$@\1@" $MARKFILE | grep -v "=")
            else
                echo "No such mark: $1"
            fi
            ;;
    esac
}

# auto completion for m.sh
if [ -n "$BASH_VERSION" ]; then
    function _cdmark_complete() {
        local MARKFILE="${MARKFILE:-$HOME/.local/share/marks.ini}"
        local curword="${COMP_WORDS[COMP_CWORD]}"
        if [[ "$curword" =~ [-+/].* ]]; then
        #if echo "$curword" | grep -Eq "[-+/].*" ; then
            COMPREPLY=($(sed -r "s@^(${curword:1}.*?)=(.*$)@${curword:0:1}\1@" $MARKFILE | grep -v "="))
        else
            COMPREPLY=($(sed -r "s@^(${curword}.*?)=(.*$)@\1@" $MARKFILE | grep -v "="))
        fi
    }
    complete -F _cdmark_complete m
elif [ -n "$ZSH_VERSION" ]; then
    function _cdmark_complete() {
        local MARKFILE="${MARKFILE:-$HOME/.local/share/marks.ini}"
        local cur cword words
        read -cn cword
        read -Ac words
        curword="$words[$cword]"
        if [[ "$curword" =~ [-+/].* ]]; then
            reply=($(sed -r "s@^(${curword:1}.*?)=(.*$)@${curword:0:1}\1@" $MARKFILE | grep -v "="))
        else
            reply=($(sed -r "s@^(${curword}.*?)=(.*$)@\1@" $MARKFILE | grep -v "="))
        fi
    }
    compctl -K _cdmark_complete m
fi

