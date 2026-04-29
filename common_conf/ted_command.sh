#!/bin/bash

# ip -o -f inet a   # -o oneline, -f 指定 family { inet | inet6 | mpls | bridge | link }
#alias showip="ip -o -f inet addr show | awk '/scope global/ {print \$2, \$4}'"
#alias showip6="ip -o -f inet6 addr show | awk '/scope global/ {print \$2, \$4}'"

function showip() {
    fam="inet"
    dev=""
    if [ ! -z $1 ]; then
        dev="dev $1"
    fi
    ip -o -f $fam addr show $dev | awk '/scope global/ {print $2, $4}'
}

function showip6() {
    fam="inet6"
    dev=""
    if [ ! -z $1 ]; then
        dev="dev $1"
    fi
    ip -o -f $fam addr show $dev | awk '/scope global/ {print $2, $4}'
}

