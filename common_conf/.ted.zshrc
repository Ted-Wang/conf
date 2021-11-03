
# Ted Wang's .zshrc for Mac, v0.01, 2021-11-03
alias du0='du -h -d 0'
alias du1='du -h -d 1'

# LinuxMint 使用了 termbin.com，发现挺不错的。
alias tb="nc termbin.com 9999"
# usage: 生成一个paste：echo text | tb；获取内容可以使用：curl http://termbin.com/xftf

if [ -f "/Users/huaiwa/my_script/m2.sh" ]; then
    source "/Users/huaiwa/my_script/m2.sh"
fi
if [ -f "/Users/huaiwa/my_script/dockertags.sh" ]; then
    source "/Users/huaiwa/my_script/dockertags.sh"
fi
