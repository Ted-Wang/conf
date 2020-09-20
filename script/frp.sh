#!/usr/bin/env bash

function frprestart(){
    frpc_pid="$(ps -ef | grep frpc | grep -v grep | head -n1 | awk '{print $2}')"
    echo "killing frpc(PID=$frpc_pid)"
    kill ${frpc_pid}
    echo "restarting frpc"
    frpc
    ps -ef | grep frpc | grep -v grep 
    echo "done"
}

alias frps='nohup ~/frp/frp_0.33.0_linux_amd64/frps -c ~/frp/frp_0.33.0_linux_amd64/frps.ini >> ~/frp/frp_0.33.0_lin    ux_amd64/frps.log 2>&1 &'
alias frpc='nohup ~/frp/frp_0.33.0_linux_arm/frpc -c ~/frp/frp_0.33.0_linux_arm/frpc.ini >> ~/frp/frp_0.33.0_linux_arm/frpc.log 2>&1 &'
alias frprestart='bash -i ~/frp/frp_0.33.0_linux_arm/frprestart.sh'

