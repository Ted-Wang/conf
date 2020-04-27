#!/bin/bash

sftp_user=sftp
sftp_group=sftp
sftp_home=/sftp
sftp_share_folder=$sftp_home/share
sudo mkdir -p $sftp_share_folder
sudo chown root:root $sftp_home
sudo chmod 755 $sftp_home
sudo groupadd $sftp_group
sudo useradd sftp -M -N -d $sftp_home -g $sftp_group -s /usr/sbin/nologin -p $(echo $sftp_user | openssl passwd -1 -stdin)
sudo chown sftp:sftp $sftp_share_folder
sudo chmod ug+rwX $sftp_share_folder

# disable original sftp-server, enable interal-sftp server
echo disabling sftp-server
sudo sed -i 's/^Subsystem\s*sftp\s*\/usr\/lib\/openssh\/sftp-server/#\0/' /etc/ssh/sshd_config
echo enabling internal-sftp server
if ! grep -Eq "^Subsystem\s*sftp\s*internal-sftp" /etc/ssh/sshd_config; then
    sudo sed -i '/^#Subsystem\s*sftp\s*\/usr\/lib\/openssh\/sftp-server/a \
Subsystem sftp internal-sftp' /etc/ssh/sshd_config
fi

# limit the access directory
echo patching /etc/ssh/sshd_config
if ! grep -Eq "Match Group $sftp_group" /etc/ssh/sshd_config; then
    sudo sh -c "cat << 'EOF' >> /etc/ssh/sshd_config
Match Group $sftp_group
    ChrootDirectory %h
    ForceCommand internal-sftp -u 0000
    AllowTCPForwarding no
    X11Forwarding no
    PermitTTY no
EOF"
fi

echo sftp set up. user name: $sftp_user, share folder: $sftp_share_folder

unset sftp_user sftp_group sftp_home sftp_share_folder
