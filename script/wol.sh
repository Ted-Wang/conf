#!/usr/bin/env bash

# Usage: bash wol.sh mac_address broadcast_ip
# use bash wol.sh "" 192.168.1.255 to specify the broadcast address without changing MAC by default.

WOL_CONF_FILE=~/wol.conf

function usage {
    echo "The usage of this tool:"
    echo "# specify MAC and broadcast_IP:"
    echo "    wol <mac_address> <broadcast_ip>"
    echo "＃specify MAC without broadcast IP, will send the WoLmagic packet to default broadcast_IP. i.e. 172.17.1.255 for win, 255.255.255.255 for other OS:"
    echo "    wol <mac_address>"
#    echo "usage: wol "" <broadcast_ip>              # ignore MAC, only specify the boradcast_IP, in case you're using Win and not in 172.17.1/24 subnetwork"
    echo "# <mac_address> is ether a real MAC separated by ':' or '-', or an alias name defined in conf file $WOL_CONF_FILE:"
    echo "    my_machine=AA:BB:CC:DD:EE:FF"
    echo "# then you can call this tool with alias name my_machine: "
    echo "    wol my_machine"
    echo "[NOTE]: <mac_address> does not support any type of list, 1 MAC for each calling."
    echo "[NOTE]: you need 'ncat' while using this tool on Win/git-bash. ncat is included in the 'namp' tool, you can find and download it from nmap.org"
    echo ""
    exit 1
}

if [[ ( "$1" == "--help" ) || ( "$1" == "-h" ) ]]; then
    usage
fi


# read mac address alias from conf file
declare -A WOL_CONF_MAP
while IFS='=' read -r key value || [[ -n "$key" ]]; do
    [[ -z "$key" ]] && continue
    WOL_CONF_MAP["${key}"]="$value"
done < <(sed -e 's/\s*#.*$//g' ${WOL_CONF_FILE}) 
echo ${WOL_CONF_MAP['mint']}

broadcast=${2:-255.255.255.255}
#broadcast=${2:-172.17.1.255}
port=7

# check OS is Win or other
unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    MINGW*) runIn=Win/git-bash;;
    Darwin*) runIn=Mac;;
esac
if [ "$runIn" == "Win/git-bash" ]; then
    NC='ncat'                         # ncat on windows is provided by nmap.org, it can send to broadcast address without specifying any argument.
    broadcast=${2:-172.17.1.255}     # but ncat can send only to broadcast addr like 192.168.1.255, not able to send to 255.255.255.255.
else
    NC='nc -b'		                # -b broadcast, without this argument, nc may not send UDP broadcast.
fi

# get MAC from alias file or use default
#if [[ ! -z $1 ]] && [[ -v ${1} ]]; then
if [[ ! -z $1 ]]; then
    #mac=${!1}
    mac=${WOL_CONF_MAP["$1"]}
    host_name_="${1}: ${mac}"
elif [[ -z $1 ]]; then
    echo "NO MAC address is specified! Specify your target MAC or alias your MAC in conf file: $WOL_CONF_FILE"
    echo ""
    usage
else
    echo "\"${1}\" is not an alias name in conf file: $WOL_CONF_FILE, treat it as a MAC address"
    #mac=${1:-B8-97-5A-85-DD-A2}     # D-Mint
    #mac=${1:-58-41-20-28-33-BC}     # D-Mint-2.5G
    #mac=${1:-00-17-A4-DE-F6-C4}    # NX6325
    #mac=${1:-08:00:27:f5:90:07}    # VM-Mint
    mac=${1}
    host_name_=${mac}
fi
mac_address=$(echo $mac | sed 's/://g; s/-//g')		# Strip colons from the MAC address

if [[ ! ${#mac_address} -eq 12 ]]; then
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
echo -e $magic_packet_hex | $NC -w1 -4u $broadcast $port

# another aproach is to use xxd to transfer string to hex
#echo -n $magic_packet | xxd -r -p | $NC -w1 -4u $broadcast $port

unset mac mac_address broadcast port magic_packet magic_packet_hex
