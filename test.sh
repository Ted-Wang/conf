echo -e "$_"
echo "\$HOME="$HOME
echo -e ${0%/*}
echo  $0
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "BASE_DIR="$BASE_DIR

currentEnv()
{
    unameOut="$(uname -s)"
    case $unameOut in
        Linux*) runningIn=Linux;;
        MINGW*) runningIn=git-bash;;
        Darwin*) runningIn=Mac;;
    esac
    echo $runningIn
    #unset unameOut
    #unset runningIn
    return 0
}
r=$(currentEnv)
echo r=$r
echo unameout=$unameOut
echo runningIn=$runningIn
#unameOut="$(uname -s)"
#case $unameOut in
#    Linux*) runIn=Linux-shell;;
#    MINGW*) runIn=Win/git-bash;;
#    Darwin*) runIn=Mac;;
#esac
#if [ "$runIn" == "Win/git-bash" ]; then
#    SUDO="";
#elif [ "$runin" == "Linux-shell" ]; then
#    SUDO=sudo;
#else
#    SUDO=sudo;
#fi
#echo $SUDO
#
#echo -n > $BASE_DIR/test.out
#
#echo -e "\n#1:" >> $BASE_DIR/test.out
#if ! grep -Eq "^\s*so(urce){0,1}\s+~/ted\.vimrc$" ~/.vimrc
#then 
#    echo file "ted.vimrc" exist.
#else
#    $SUDO cat << EOF >> $BASE_DIR/test.out
#if(filereadable(expand(~/ted.vimrc)))
#    so ~/ted.vimrc
#endif
#EOF
#fi
#
#echo -e "\n#2:" >> $BASE_DIR/test.out
#if ! grep -Eq "^\s*source\s+~/ted.bashrc$" ~/.bashrc
#then
#    : # do nothing
#    echo bb
#else 
#    $SUDO cat << EOF >> $BASE_DIR/test.out
#if [ -f ~/ted.bashrc ]; then
#    source ~/ted.bashrc
#fi
#EOF
#fi
