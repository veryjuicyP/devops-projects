#!/bin/bash

#!/bin/bash

# Colors
GREEN="\033[0;32m"
BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m"

echo -e "${BLUE}====================================${NC}"
echo -e "${GREEN}     Server Performance Stats       ${NC}"
echo -e "${BLUE}====================================${NC}"

echo ""

# CPU Usage
echo -e "${GREEN}CPU Usage:${NC}"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Used: " $2 + $4 "%"}'

echo ""

# Memory Usage
echo -e "${GREEN}Memory Usage:${NC}"
free -m | awk 'NR==2{
printf "Total: %sMB\nUsed: %sMB\nFree: %sMB\nUsage: %.2f%%\n",
$2,$3,$4,$3*100/$2 }'

echo ""

# Disk Usage
echo -e "${GREEN}Disk Usage:${NC}"
df -h / | awk 'NR==2 {
printf "Total: %s\nUsed: %s\nAvailable: %s\nUsage: %s\n",
$2,$3,$4,$5 }'

echo ""

# Top 5 CPU Processes
echo -e "${GREEN}Top 5 Processes by CPU Usage:${NC}"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo ""

# Top 5 Memory Processes
echo -e "${GREEN}Top 5 Processes by Memory Usage:${NC}"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo ""

# System Info
echo -e "${GREEN}System Information:${NC}"

echo "OS Version:"
cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f2

echo ""

echo "System Uptime:"
uptime -p

echo ""

echo "Load Average:"
uptime | awk -F'load average:' '{ print $2 }'

echo ""

echo "Logged in Users:"
who

echo ""

echo -e "${BLUE}====================================${NC}"

