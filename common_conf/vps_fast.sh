#!/usr/bin/env bash

# 2. 远程快速安装SS、开启BBR
# 原始命令 git clone -b master https://github.com/Ted-Wang/ss-fly && sudo ss-fly/ss-fly.sh -i ss_pass ss_port && sudo ss-fly/ss-fly.sh -bbr -Y
# 2.1 root 用户
function fastss0() {
	ssh -o "StrictHostKeyChecking=no" -t root@"$3" "git clone -b master https://github.com/Ted-Wang/ss-fly && ss-fly/ss-fly.sh -i $1 $2 && ss-fly/ss-fly.sh -bbr -Y"
}
# 2.2 普通用户
function fastss1() {
    ssh -o "StrictHostKeyChecking=no" -t ted@"$3" "git clone -b master https://github.com/Ted-Wang/ss-fly && sudo ss-fly/ss-fly.sh -i $1 $2 && sudo ss-fly/ss-fly.sh -bbr -Y"
}
# 调用格式：fastss1 ss_pass port ip，比如：fastss vpn_pass 8388 67.68.69.70

# 3. 远程添加用户，原始命令 ssh -o 'StrictHostKeyChecking=no' -t root@host_ip 'useradd $1 -G sudo -s /bin/bash -m -p $(echo $2 | openssl passwd -1 -stdin)'
# 3.1 root 用户
function fastuser0() {
    ssh -o "StrictHostKeyChecking=no" -t root@"$3" "useradd $1 -G sudo -s /bin/bash -m -p $(echo $2 | openssl passwd -1 -stdin)"
}
# 3.2 普通用户
function fastuser1() {
    ssh -o "StrictHostKeyChecking=no" -t ted@"$3" "sudo useradd $1 -G sudo -s /bin/bash -m -p $(echo $2 | openssl passwd -1 -stdin)"
}
#调用格式：fastuser0 ted44 password 192.168.1.101

