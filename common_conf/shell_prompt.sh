
function generateShellPromptWithGit() {
    # import __git_ps1() function for Manjaro
    pacman --help > /dev/null 2>&1
    if [ $? == 0 ] && [ -f /usr/share/git/completion/git-prompt.sh ]; then
        echo source /usr/share/git/completion/git-prompt.sh
    fi

    # import __git_ps1() function for CentOS, RHEL, Redhat
    yum --help > /dev/null 2>&1
    if [ $? == 0 ] && [ -f /usr/share/git/completion/git-prompt.sh ]; then
        echo source /usr/share/git-core/contrib/completion/git-prompt.sh
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
            # shell prompt with git branch. color pink for path(\w)
            #export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[01;36m\]\$(__git_ps1 '(%s)')\[\033[0m\]\$ "
            # color blue for path(\w). this blue[38;5;26] is performed better then [01;34m] while in a server terminal.
            echo export PS1='"${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[38;5;26m\]\w\[\033[01;36m\]\$(__git_ps1 '\''(%s)'\'')\[\033[0m\]\$ "'
        fi
            # keep git-bash in Windows unchanged.
            echo ""
    else
        # shell prompt without git
        #export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[0m\]\$ "
        # blue color for path
        echo export PS1='"${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[38;5;26m\]\w\[\033[0m\]\$ "'
    fi
}
