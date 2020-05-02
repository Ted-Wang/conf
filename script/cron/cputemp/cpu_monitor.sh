#!/bin/bash
source ~/.bashrc

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ ! -d $BASE_DIR/data ]; then
    mkdir -p $BASE_DIR/data
fi

#echo "\$HOME="$HOME
#echo $(alias)
echo [$(date +%H:%M:%S)],$(cat /sys/class/thermal/thermal_zone0/temp) >> $BASE_DIR/data/$(date +%Y-%m-%d).csv
#echo [$(date +%H:%M:%S)],$(cat /sys/class/thermal/thermal_zone0/temp) >> ~/cputemp/data/$(date +%Y-%m-%d).csv
#echo [$(date +%H:%M:%S)],$(cputemp) >> ~/cputemp/data/$(date +%Y-%m-%d).csv
