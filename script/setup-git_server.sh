#!/bin/bash

# after setup git repo, you can use any user with sudo right to init a repo like:
#   sudo -u git git init --bare new_repo.git 

GIT_SHELL=$(which git-shell)
GIT_USER=git
GIT_REPO=/repo
git --version >/dev/null 2>&1
if [ $?==0 ] && [ -f $GIT_SHELL ] && ! grep -Eq "$GIT_SHELL" /etc/shells; then
    echo adding $GIT_SHELL to /etc/shells
    sudo sh -c "echo $GIT_SHELL >> /etc/shells"
fi

sudo useradd $GIT_USER -s $GIT_SHELL -d $GIT_REPO -m -p $(echo $GIT_USER| openssl passwd -1 -stdin)
#sudo useradd $GIT_USER -s $GIT_SHELL -m -p $(echo $GIT_USER| openssl passwd -1 -stdin)
sudo mkdir -p $GIT_REPO/.ssh
sudo chmod 700 $GIT_REPO/.ssh
sudo touch $GIT_REPO/.ssh/authorized_keys
sudo chmod 600 $GIT_REPO/.ssh/authorized_keys
sudo chown $GIT_USER:$GIT_USER $GIT_REPO/.ssh $GIT_REPO/.ssh/authorized_keys

if ! grep -Eq "Match Group $GIT_USER" /etc/ssh/sshd_config; then
    echo patching /etc/ssh/sshd_config
    sudo sh -c "cat << 'EOF' >> /etc/ssh/sshd_config
Match Group $GIT_USER
    AllowTCPForwarding no
    X11Forwarding no
    PermitTTY no
EOF"
fi
