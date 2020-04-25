#!/usr/bin/env bash

# Usage: bash wol.sh mac_address broadcast_ip
# use bash wol.sh "" 192.168.1.255 to specify the broadcast address without changing MAC by default.

broadcast=${2:-255.255.255.255}
#broadcast=${2:-172.17.1.255}
port=7

unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    MINGW*) runIn=Win/git-bash;;
    Darwin*) runIn=Mac;;
esac
if [ "$runIn" == "Win/git-bash" ]; then
    NC=ncat                         # ncat on windows is provided by nmap.org, it can send to broadcast address without specifying any argument.
    broadcast=${2:-172.17.1.255}     # but ncat can send only to broadcast addr like 192.168.1.255, not able to send to 255.255.255.255.
else
    NC=nc -b		                # -b broadcast, without this argument, nc may not send UDP broadcast.
fi

mac=${1:-B8-97-5A-85-DD-A2}     # D-Server
#mac=${1:-00-17-A4-DE-F6-C4}     # NX6325
#mac=${1:-08:00:27:f5:90:07}     # VM-Mint
mac_address=$(echo $mac | sed 's/://g; s/-//g')		# Strip colons from the MAC address

magic_packet=$(
  	printf 'f%.0s' {1..12}
  	printf "$mac_address%.0s" {1..16}
)
# need to be hex-escaped
magic_packet_hex=$(
  	echo $magic_packet | sed -e 's/../\\x&/g'
)

#echo $magic_packet_hex
echo waking up machine[$mac], sending wol magic packet to $broadcast:$port
echo -e $magic_packet_hex | $NC -w1 -4u $broadcast $port

# another aproach is to use xxd to transfer string to hex
#echo -n $magic_packet | xxd -r -p | $NC -w1 -4u $broadcast $port

unset mac mac_address broadcast port magic_packet magic_packet_hex
