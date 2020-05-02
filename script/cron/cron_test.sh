source ~/.bashrc
#echo "\$HOME="$HOME
echo `alias`
echo `date +%H:%M:%S`,`cputemp`
cat /sys/class/thermal/thermal_zone0/temp
