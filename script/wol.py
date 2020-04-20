# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Description:   Ref: https://github.com/bentasker/Wake-On-Lan-Python

import socket
import struct
import time

MAC = "B8-97-5A-85-DD-A2"
BROADCAST = "172.17.1.255"

def main():
    if len(MAC) != 17:
        raise ValueError("MAC address should be set as form 'XX-XX-XX-XX-XX-XX'")
    mac_address = MAC.replace("-", '')
    data = ''.join(['FFFFFFFFFFFF', mac_address * 16])
    send_data = b''

    # Split up the hex values and pack.
    for i in range(0, len(data), 2):
        send_data = b''.join([send_data, struct.pack('B', int(data[i: i + 2], 16))])
    #print(send_data)

    # Broadcast
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        sock.sendto(send_data, (BROADCAST, 7))
        #time.sleep(1)
        #sock.sendto(send_data, (BROADCAST, 7))
        #time.sleep(1)
        #sock.sendto(send_data, (BROADCAST, 7))
        print("Done")
    except Exception as e:
        print(e)

if __name__ == '__main__':
    main()
