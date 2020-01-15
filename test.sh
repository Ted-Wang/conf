echo -e "$_"
echo -e ${0%/*}
echo  $0


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

echo -n > ./test.out

echo -e "\n#1:" >> ./test.out
if ! grep -Eq "^\s*so(urce){0,1}\s+~/ted\.vimrc$" ~/.vimrc
then 
    echo file "ted.vimrc" exist.
else
    $SUDO cat << EOF >> ./test.out
if(filereadable(expand(~/ted.vimrc)))
    so ~/ted.vimrc
endif
EOF
fi

echo -e "\n#2:" >> ./test.out
if ! grep -Eq "^\s*source\s+~/ted.bashrc$" ~/.bashrc
then
    : # do nothing
    echo bb
else 
    $SUDO cat << EOF >> ./test.out
if [ -f ~/ted.bashrc ]; then
    source ~/ted.bashrc
fi
EOF
fi
