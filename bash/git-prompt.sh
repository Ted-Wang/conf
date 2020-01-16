
# import __git_ps1() function for Manjaro
pacman --help > /dev/null
if [ $? == 0 ] && [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[36m\]\$(__git_ps1 '(%s)')\[\033[0m\]\$ "

