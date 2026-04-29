#!/usr/bin/env bash

# Usage: bash wol.sh mac_address broadcast_ip
# use bash wol.sh "" 192.168.1.255 to specify the broadcast address without changing MAC by default.

WOL_CONF_FILE=~/wol.conf
PARAM_BROAD_CAST="broadcast_ip"
PARAM_BROAD_CAST_WIN="broadcast_ip_win"
PARAM_INTERFACE="interface"
PARAM_PORT="port"

function usage() {
    echo "The usage of this tool:"
    echo "    wol [alias]                           # Wake up machine with 'alias' machine (defined in ~/wol.conf), via default 'broadcast_ip', i.e. 192.168.1.255 for Win/git-bash, 255.255.255.255 for other OS"
    echo "    wol [mac_address] [broadcast_ip]      # Wake up machine with specific MAC via specific 'broadcast_ip'"
    echo "    wol [mac_address]                     # Wake up machine with specific MAC, via default 'broadcast_ip', i.e. 192.168.1.255 for win, 255.255.255.255 for other OS"
    echo "# [mac_address] is ether a real MAC separated by ':' or '-', or an alias name defined in conf file ~/wol.conf like:"
    echo "-----------example of ~/wol.conf-----------"
    echo "    my_machine=AA:BB:CC:DD:EE:FF"
    echo "    my_machine2=AA-BB-CC-DD-EE-FF"
    echo ""
    echo "    broadcast_ip=192.168.1.255"
    echo "    interface=eth0"
    echo "    port=9"
    echo "-------------------------------------------"
    echo "# then you can call this tool with alias name 'my_machine': "
    echo "    wol my_machine"
    echo "[NOTE]: if 'broadcast_ip' is set, the 'interface' property will be ignored, otherwise, this tool will try to get broadcast ip from specified 'interface'."
    echo "[NOTE]: [mac_address] does not support any type of list, 1 MAC for each calling."
    echo "[NOTE]: Running this tool on Win/git-bash need 'ncat' pre-installed, which is included in the 'namp' tool, you can find and download it from nmap.org"
    echo ""
    exit 1
}

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    usage
fi

# check OS is Win or other
unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    MINGW*) runIn=Win/git-bash;;
    Darwin*) runIn=Mac;;
esac

# read mac address alias from conf file
declare -A WOL_CONF_MAP
while IFS='=' read -r key value || [ -n "$key" ]; do
    [ -z "$key" ] && continue
    WOL_CONF_MAP["${key}"]="$value"
done < <(sed -e 's/\s*#.*$//g' ${WOL_CONF_FILE}) 

skipped="false"
if [ "$runIn" == "Win/git-bash" ]; then
    broadcast=${2:-192.168.1.255}
    skipped="true"
else
    broadcast=${2:-255.255.255.255}
fi
port=${3:-9}

conf_broadcast_ip=${WOL_CONF_MAP["$PARAM_BROAD_CAST"]}
conf_broadcast_ip_win=${WOL_CONF_MAP["$PARAM_BROAD_CAST_WIN"]}
conf_interface=${WOL_CONF_MAP["$PARAM_INTERFACE"]}
conf_port=${WOL_CONF_MAP["$PARAM_PORT"]}
#echo [DEBUG]conf_broadcast_ip: $conf_broadcast_ip
#echo [DEBUG]conf_broadcast_ip_win: $conf_broadcast_ip_win
#echo [DEBUG]conf_interface: $conf_interface
#echo [DEBUG]conf_port: $conf_port
#echo [DEBUG]broadcast: $broadcast
#echo [DEBUG]port: $port

override="false"
#if [ ! -z ${WOL_CONF_MAP["$PARAM_INTERFACE"]} ]; then
if [ ! -z $conf_broadcast_ip ]; then
#    echo [DEBUG]user set broadcast_ip: $conf_broadcast_ip
    echo "broadcast_ip is specified: [$conf_broadcast_ip], the 'interface' setting will be ignored."
    broadcast=${2:-$conf_broadcast_ip}
    override="true"
#    echo [DEBUG]override changed to: $override
fi

if [ ! -z $conf_broadcast_ip_win ]; then
#    echo [DEBUG]user set broadcast_ip: $conf_broadcast_ip_win
    echo "broadcast_ip_win is specified: [$conf_broadcast_ip_win], the 'interface' setting is ignored by default under Win/git-bash."
    # [TBD] get broadcast_ip under Win/git-bash.......
    broadcast_ip_win=$conf_broadcast_ip_win
#    echo [DEBUG]override changed to: $override
fi

#echo [DEBUG]override prior: $override, conf_interface: $conf_interface
if [ "false" == "$override" ] && [ "false" == "$skipped" ] && [ ! -z $conf_interface ]; then
#    echo [DEBUG]user specify interface: [$conf_interface] and not specify broadcast_ip: [$broadcast_ip], override: [$override]
    # get broadcast address of the interface
    echo getting braodcast_ip from interface: $conf_interface
    interface_brd=$(ip -o -f inet addr show $conf_interface | awk '{print $6}')
    echo broadcast_ip of interface $conf_interface: $interface_brd
    if [ ! -z $interface_brd ]; then
        broadcast=${2:-$interface_brd}
    fi
fi

if [ ! -z $conf_port ] && [ $conf_port == "7" ] ; then
    echo "get port number from ~/wol.conf: $conf_port (available ports: 7, 9)"
    port=${3:-$conf_port}
fi
#echo [DEBUG]after setting.......
#echo [DEBUG]conf_broadcast_ip: $conf_broadcast_ip
#echo [DEBUG]conf_broadcast_ip_win: $conf_broadcast_ip_win
#echo [DEBUG]conf_interface: $conf_interface
#echo [DEBUG]conf_port: $conf_port
#echo [DEBUG]broadcast: $broadcast
#echo [DEBUG]port: $port

if [ "$runIn" == "Win/git-bash" ]; then
    NC='ncat'   # ncat on windows is provided by nmap.org, it can send to broadcast address without specifying any argument.
                # but ncat can send only to broadcast addr like 192.168.1.255, not able to send to 255.255.255.255.
#    echo [DEBUG]broadcast_ip_win: ${broadcast_ip_win}
    if [ ! -z "${broadcast_ip_win}" ]; then
        broadcast=${2:-$broadcast_ip_win}
        echo set broadcast_ip for Win/git-bash: [${broadcast}]
    fi
else
    NC='nc -b'		                  # -b broadcast, without this argument, nc may not send UDP broadcast.
fi

# get MAC from alias file or use default
#if [ ! -z $1 ] && [ -v ${1} ]; then
if [ ! -z $1 ]; then
    #mac=${!1}
    mac=${WOL_CONF_MAP["$1"]}
    host_name_="${1}: ${mac}"
elif [ -z $1 ]; then
    echo "NO MAC address or alias name is specified! Point out your machine MAC/alias name as first argument."
    echo "Sugeest you use alias name and alias your machine MAC in conf file: ~/wol.conf"
    echo "use 'wol -h' or 'wol --help' to see example of the config file."
    echo ""
    # list all alias machine and MAC in $WOL_CONF_FILE
#    echo [DEBUG]WOL_CONF_MAP: ${WOL_CONF_MAP[@]}
    #if [ ! -z $WOL_CONF_MAP ] && [ ${#WOL_CONF_MAP[@]} -gt 0 ]; then
    if [ ${#WOL_CONF_MAP[@]} -gt 0 ]; then
        #echo "all known host(s) alias: "
        #for key in "${!WOL_CONF_MAP[@]}"; do
            #value="${WOL_CONF_MAP[$key]}"
            #echo "host: $key, MAC: $value"
        #done
        # While user call this tool with no argument(alias, MAC, etc), simply cat ~/wol.conf, istead of printing content of WOL_CONF_MAP
        echo "content of file $WOL_CONF_FILE:"
        echo "-----------------------------------------"
        cat $WOL_CONF_FILE
        echo "-----------------------------------------"
        exit 1
    else
        usage
    fi
else
    echo "\"${1}\" is not an alias name in conf file: $WOL_CONF_FILE, treat it as a MAC address"
    mac=${1}
    host_name_=${mac}
fi
mac_address=$(echo $mac | sed 's/://g; s/-//g')		# Strip colons from the MAC address

if [ ! ${#mac_address} -eq 12 ]; then
    echo "\"${mac_address}\" is not a valid MAC address, please check"
    exit 1
fi

magic_packet=$(
  	printf 'f%.0s' {1..12}
  	printf "$mac_address%.0s" {1..16}
)
# need to be hex-escaped
magic_packet_hex=$(
  	echo $magic_packet | sed -e 's/../\\x&/g'
)

#echo $magic_packet_hex
echo waking up machine[$host_name_], sending wol magic packet to $broadcast:$port
echo "Full command is: "
echo "    echo -e [magic _packet with hex format] | $NC -w1 -4u $broadcast $port"
echo -e $magic_packet_hex | $NC -w1 -4u $broadcast $port

# another aproach is to use xxd to transfer string to hex
#echo -n $magic_packet | xxd -r -p | $NC -w1 -4ub $broadcast $port

unset mac mac_address broadcast port magic_packet magic_packet_hex
