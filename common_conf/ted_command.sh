#!/bin/bash

# ip -o -f inet a   # -o oneline, -f 指定 family { inet | inet6 | mpls | bridge | link }
#alias showip="ip -o -f inet addr show | awk '/scope global/ {print \$2, \$4}'"
#alias showip6="ip -o -f inet6 addr show | awk '/scope global/ {print \$2, \$4}'"

function showip() {
    local fam="inet"
    local dev=""
    if [ ! -z $1 ]; then
        dev="dev $1"
    fi
    ip -o -f $fam addr show $dev | awk '/scope global/ {print $2, $4}'
}

function showip6() {
    local fam="inet6"
    local dev=""
    if [ ! -z $1 ]; then
        dev="dev $1"
    fi
    ip -o -f $fam addr show $dev | awk '/scope global/ {print $2, $4}'
}

if [ -n "BASH_VERSION" ]; then
    function _showip_complete() {
        local curword="${COMP_WORDS[COMP_CWORD]}"
        local opts=$(ip -o -f inet addr show | awk '/scope global/ {print $2}')
        COMPREPLY=( $(compgen -W "${opts}" -- "${curword}") )
        #if [[ "$curword" =~ .+ ]]; then
            #COMPREPLY=($(echo $opts | sed -n "/^${curword}.*/p"))
        #else
            #COMPREPLY=($opts)
        #fi
    }
    complete -F _showip_complete showip
fi
