#!/bin/bash

echo "=============================="
echo " Server Performance Stats "
echo "=============================="

echo ""
echo "Total CPU Usage:"
top -l 1 | grep "CPU usage"

echo ""
echo "Memory Usage:"
vm_stat | perl -ne '/page size of (\d+)/ and $size=$1;
/Pages free: (\d+)/ and $free=$1;
/Pages active: (\d+)/ and $active=$1;
END {
$total=($free+$active)*$size/1048576;
$free=$free*$size/1048576;
$used=$active*$size/1048576;
printf "Used: %.2f MB\nFree: %.2f MB\n",$used,$free;
}'

echo ""
echo "Disk Usage:"
df -h /

echo ""
echo "Top 5 Processes by CPU Usage:"
ps -Ao pid,comm,%cpu --sort=-%cpu | head -n 6

echo ""
echo "Top 5 Processes by Memory Usage:"
ps -Ao pid,comm,%mem --sort=-%mem | head -n 6

echo ""
echo "OS Version:"
uname -a

echo ""
echo "System Uptime:"
uptime

echo ""
echo "Logged In Users:"
who
