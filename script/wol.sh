#!/usr/bin/env bash

# Usage: bash wol.sh mac_address broadcast_ip

mac=${1:-08:00:27:f5:90:07}
mac_address=$(echo $mac | sed 's/://g')		# Strip colons from the MAC address

broadcast=${2:-255.255.255.255}
#broadcast=172.17.1.255
port=7

magic_packet=$(
  	printf 'f%.0s' {1..12}
  	printf "$mac_address%.0s" {1..16}
)
# need to be hex-escaped
magic_packet_raw_hex=$(
  	echo $magic_packet | sed -e 's/../\\x&/g'
)

# echo $magic_packet_raw_hex
echo waking up machine[$mac], sending wol magic packet to $broadcast:$port
echo -e $magic_packet_raw_hex | nc -w1 -4ub $broadcast $port		# -b broadcast, without this argument, nc may not send UDP broadcast.

unset mac mac_address broadcast port magic_packet magic_packet_raw_hex
