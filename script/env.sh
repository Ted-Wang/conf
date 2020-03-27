#!/bin/bash

# this script file is to be create a "common env" for my other scripts.
currentEnv()
{
    unameOut="$(uname -s)"
    case $unameOut in
        Linux*) runningIn=Linux;;
        MINGW*) runningIn=git-bash;;
        Darwin*) runningIn=Mac;;
    esac
    echo $runningIn
    unset unameOut
    unset runningIn
    return 0
}

currentOS()
{
    if [ -f /etc/os-release ]; then
        os=$(sed -E "s@^ID=(.*)\$@\1@" "/etc/os-release" | grep -v "=")
    fi
    echo $os
    unset os
}
