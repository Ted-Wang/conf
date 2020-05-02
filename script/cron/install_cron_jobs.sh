#!/bin/bash

USER=$(whoami)
# [TODO] find out CRON path in different Linux distro.
if [ -f /etc/os-release ]; then
    OS=$(sed -E "s@^ID=(.*)\$@\1@" "/etc/os-release" | grep -v "=")
fi
case $OS in
ubuntu|raspbian|linuxmint )
    CRON_PATH=/var/spool/cron/crontabs
    ;;
manjaro|centos/fedora/rhel )
    CRON_PATH=/var/spool/cron
    ;;
* )
    CRON_PATH=/var/spool/crontabs
    ;;
esac

CRON_FILE=$CRON_PATH/$USER
echo host OS:$OS, current user:$USER, the cron job file location: $CRON_FILE
#echo this script is not complete, please DO NOT use.
#exit 1

if ! sudo grep -Eq "SHELL=/bin/bash" $CRON_FILE; then
    echo setup shell path environment for cron job.
    sudo bash -c "echo '' >> $CRON_FILE"
    sudo bash -c "echo 'SHELL=/bin/bash' >> $CRON_FILE"
    sudo bash -c "echo 'PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin' >> $CRON_FILE"
    sudo bash -c "echo '' >> $CRON_FILE"
fi

if ! sudo grep -Eq "cputemp" $CRON_FILE; then
    echo setting up \"cputem\" job.
    sudo bash -c "cat << 'EOF' >> $CRON_FILE
# check cpu temperature every minute
*/1 * * * * ~/cron/cputemp/cpu_monitor.sh 2> >( while read line; do echo \"\$(date): \${line}\"; done  >> ~/cron/cputemp/cpu_monitor.log ) 1>&2
# clear cpu temperature output data files monthly
30 1 1 * * ~/cron/cputemp/cpu_mon_housekeeping.sh >> ~/cron/cputemp/cpu_monitor.log 2>&1
EOF"
else
    echo cron job \"cputemp\" is already exist.
fi

if ! sudo grep -Eq "server_power_check.sh" $CRON_FILE; then
    echo setting up \"server_power_check\" job.
    sudo bash -c "cat << 'EOF' >> $CRON_FILE

# check server power on/off
*/10 * * * * ~/cron/server_power/server_power_check.sh 2> >( while read line; do echo \"\$(date): \${line}\"; done  >> ~/cron/server_power/server_power_check.log ) 1>&2
EOF"
else
    echo cron job \"server_power_check\" is already exist.
fi
