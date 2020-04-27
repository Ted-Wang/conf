#!/bin/bash

# Add a user to group "sftp", create a folder in /sftp, which is accessed merely by this user.
# Usage: add_sftp_user user
sftp_user=${1:-'sted'}
sftp_group=sftp
sudo useradd $sftp_user -M -N -d /sftp -g $sftp_group -s /usr/sbin/nologin -p $(echo $sftp_user | openssl passwd -1 -stdin)
sudo mkdir -p /sftp/$sftp_user
sudo chown $sftp_user:sftp /sftp/$sftp_user
sudo chmod 700 /sftp/$sftp_user
unset sftp_user sftp_group
