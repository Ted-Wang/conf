
# import __git_ps1() function for Manjaro
pacman --help > /dev/null 2>&1
if [ $? == 0 ] && [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    MINGW*) runIn=Win/git-bash;;
    Darwin*) runIn=Mac;;
esac

git --version > /dev/null 2>&1
if [ $? == 0 ]; then 
    if [ "$runIn" == "Linux-shell" ]; then
        # shell prompt with git branch
        export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[36m\]\$(__git_ps1 '(%s)')\[\033[0m\]\$ "
    fi
        # keep git-bash in Windows unchanged.
else
    # shell prompt without git
    export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[0m\]\$ "
fi

