
# 代码来自【韦易笑】的文章：[十行代码实现路径书签功能](https://zhuanlan.zhihu.com/p/57659856)
# 代码实现思路就是，定义$MARKPATH 指向 ~/.local/share/marks目录，作为书签的保存地址。
#   - 添加书签就是在 $MARKPATH 下面做一个软连接，指向当前目录即可。
#   - 删除书签就是删除软连接，还会用 rm 命令的 -i 参数问下你是否真的要删除。
#   - 跳转书签就是利用cd命令的-P参数跳转到实际路径：cd -P "$MARKPATH/$1"
#   - 其他的搜索书签就是 find 命令，列出书签就是 ls 命令格式化一下。

# 功能
#   - m         # 列出当前所有书签
#   - m foo     # 跳转到名为 foo 的标签
#   - m +foo    # 将当前路径添加成书签 foo
#   - m -foo    # 删除名为 foo 书签
#   - m /foo    # 搜索名称里包含 foo 的书签

# 使用方法：source 此代码，或者把下面代码直接 append 到 .bashrc 里

# function for marks management
MARKPATH=$HOME/.local/share/marks
function m() {
    MARKPATH="${MARKPATH:-$HOME/.local/share/marks}"
    [ -d "$MARKPATH" ] || mkdir -p -m 700 "$MARKPATH" 2> /dev/null
    case "$1" in
        +*)            # m +foo  - add new bookmark for $PWD
            ln -snf "$(pwd)" "$MARKPATH/${1:1}" 
            ;;
        -*)            # m -foo  - delete a bookmark named "foo"
            rm -i "$MARKPATH/${1:1}" 
            ;;
        /*)            # m /bar  - search bookmarks matching "bar"
            find "$MARKPATH" -type l -name "*${1:1}*" | \
                awk -F "/" '{print $NF}' | MARKPATH="$MARKPATH" xargs -I'{}'\
                sh -c 'echo "{} ->" $(readlink "$MARKPATH/{}")'
            ;;
        "")            # m       - list all bookmarks
            command ls -1 "$MARKPATH/" | MARKPATH="$MARKPATH" xargs -I'{}' \
                sh -c 'echo "{} ->" $(readlink "$MARKPATH/{}")'
            ;;
        *)             # m foo   - cd to the bookmark directory
            local dest="$(readlink "$MARKPATH/$1" 2> /dev/null)"
            [ -d "$dest" ] && cd "$dest" || echo "No such mark: $1"
            ;;
    esac
}

# auto completion for m.sh
if [ -n "$BASH_VERSION" ]; then
    function _cdmark_complete() {
        local MARKPATH="${MARKPATH:-$HOME/.local/share/marks}"
        local curword="${COMP_WORDS[COMP_CWORD]}"
        if [[ "$curword" == "-"* ]]; then
            COMPREPLY=($(find "$MARKPATH" -type l -name "${curword:1}*" \
                2> /dev/null | awk -F "/" '{print "-"$NF}'))
        else
            COMPREPLY=($(find "$MARKPATH" -type l -name "${curword}*" \
                2> /dev/null | awk -F "/" '{print $NF}'))
        fi
    }
    complete -F _cdmark_complete m
elif [ -n "$ZSH_VERSION" ]; then
    function _cdmark_complete() {
        local MARKPATH="${MARKPATH:-$HOME/.local/share/marks}"
        if [[ "${1}${2}" == "-"* ]]; then
            reply=($(command ls -1 "$MARKPATH" 2> /dev/null | \
                awk '{print "-"$0}'))
        else
            reply=($(command ls -1 "$MARKPATH" 2> /dev/null))
        fi
    }
    compctl -K _cdmark_complete m
fi

