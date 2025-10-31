
function generateShellPromptWithGit() {
    local IMPORT_PROMPT_FILE=0

    # git prompt source chain on Ubuntu:
    # ~/.bashrc -> /etc/bash_completion -> /usr/share/bash-completion/bash_completion -> /etc/bash_completion.d/*(/etc/bash_completion.d/git-prompt) -> /usr/lib/git-core/git-sh-prompt -> __git_ps1
    # if /usr/share/bash-completion/bash_completion not exist on Ubuntu, try:
    # apt install bash-completion
    # this checking is for some VPS provided Ubuntu system, which has no bash-completion installed.
    dpkg -l > /dev/null 2>&1
    if [ $? == 0 ] && ! $(dpkg -l | grep -Eq bash-completion); then
        echo "package bash-completion is not found, installing..."
        sudo apt install bash-completion
    fi

    # import __git_ps1() function for Manjaro
    pacman --help > /dev/null 2>&1
    if [ $? == 0 ] && [ -f /usr/share/git/completion/git-prompt.sh ]; then
        echo source /usr/share/git/completion/git-prompt.sh
        IMPORT_PROMPT_FILE=1
    fi

    # import __git_ps1() function for CentOS, RHEL, Redhat
    yum --help > /dev/null 2>&1
    if [ $? == 0 ] && [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
        echo source /usr/share/git-core/contrib/completion/git-prompt.sh
        IMPORT_PROMPT_FILE=1
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
            if [[ $IMPORT_PROMPT_FILE == 1 ]]; then
                echo " && "
            fi 
            echo export PS1='"${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[38;5;26m\]\w\[\033[01;36m\]\$(__git_ps1 '\''(%s)'\'')\[\033[0m\]\$ "'
        fi
            # keep git-bash in Windows unchanged.
            echo ""
    else
        # shell prompt without git
        #export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[0m\]\$ "
        # blue color for path
        if [[ $IMPORT_PROMPT_FILE == 1 ]]; then
            echo " && "
        fi 
        echo export PS1='"${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[38;5;26m\]\w\[\033[0m\]\$ "'
    fi
}
