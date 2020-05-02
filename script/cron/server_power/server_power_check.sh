#!/bin/bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SERVER_NAME=D-Mint
SERVER_MAC=""           # leave empyt to use default in wol.sh, or explicity specify it here.
CLIENT_LIST="aw17"      # space separated host list
LOG_FILE=$BASE_DIR/server_power_check.log

if [ -f ~/prj/conf/script/wol.sh ]; then
    WoL_script=~/prj/conf/script/wol.sh
elif [ -f ~/ws/conf/script/wol.sh ]; then
    WoL_script=~/ws/conf/script/wol.sh
elif [ -f ~/conf/script/wol.sh ]; then
    WoL_script=~/conf/script/wol.sh
else
    echo wol.sh not find, please check.
    exit 1
fi

machine_is_online(){
    ping -c1 -W1 -q $1 >/dev/null 2>&1
    echo $? == 0 || 0
}

poweron_server() {
    bash $WoL_script $SERVER_MAC
}

server_poweroff() {
    sudo poweroff
}

if [ $(hostname) == "$SERVER_NAME" ]; then
    mode=ServerMode
else
    mode=ClientMode
fi

#echo $(hostname)
#echo $mode

if [ $mode == "ServerMode" ]; then
    # check all monitored clients offlined, then do self poweroff
    echo "$(date) [INFO] server power checking start in Server mode." >> $LOG_FILE 2>&1
    #echo "$(date) [INFO] server power checking start in Server mode."
    all_client_offline=1
    for client in $CLIENT_LIST; do
        #echo checking host: $client
        if [ $(machine_is_online $client) ]; then
            all_client_offline=0
            break
        fi
    done
    #echo $all_client_offline
    if [ $all_client_offline -eq 1 ]; then
        echo "$(date) [INFO] all clients[$CLIENT_LIST] are offline, shutdown server now." >> $LOG_FILE 2>&1
        #echo "$(date) [INFO] all clients[$CLIENT_LIST] are offline, shutdown server now."
        #server_poweroff
    fi
fi

if [ $mode == "ClientMode" ]; then
    # check if server is offlined, if yes, then check clients, if any clients online, poweron server.
    echo "$(date) [INFO] server power checking start in Client mode." >> $LOG_FILE 2>&1
    #echo "$(date) [INFO] server power checking start in Client mode."
    if [ ! $(machine_is_online $SERVER_NAME) ]; then
        for client in $CLIENT_LIST; do
            #echo checking host: $client
            if [ $(machine_is_online $client) ]; then
                echo "$(date) [INFO] find client[$client] is online, wake up server now." >> $LOG_FILE 2>&1
                #echo "$(date) [INFO] find client[$client] is online, wake up server now."
                #bash $WoL_script
                break;
            fi
        done
    fi
fi

