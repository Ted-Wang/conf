#!/bin/bash
function frpc(){
    nohup ~/frp/frp_0.33.0_linux_arm/frpc -c ~/frp/frp_0.33.0_linux_arm/frpc.ini >> ~/frp/frp_0.33.0_linux_arm/frpc.log 2>&1 &
}
frpc_pid="$(ps -ef | grep frpc | grep -v grep | head -n1 | awk '{print $2}')"
echo "killing frpc(PID=$frpc_pid)"
kill ${frpc_pid}
echo "restarting frpc"
frpc
#nohup $HOME/frp/frp_0.33.0_linux_arm/frpc -c $HOME/frp/frp_0.33.0_linux_arm/frpc.ini >> $HOME/frp/frp_0.33.0_linux_arm/frpc.log 2>&1 &
#nohup ~/frp/frp_0.33.0_linux_arm/frpc -c ~/frp/frp_0.33.0_linux_arm/frpc.ini >> ~/frp/frp_0.33.0_linux_arm/frpc.log 2>&1 &
ps -ef | grep frpc | grep -v grep 
echo "done"
