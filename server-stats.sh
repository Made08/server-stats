#!/bin/bash

#####################################################
# Server Performance Stats Script
# Muestra estadísticas básicas de rendimiento del servidor
#####################################################

echo "=========================================="
echo "   SERVER PERFORMANCE STATISTICS"
echo "   $(date)"
echo "=========================================="

# ----- USO TOTAL DE CPU -----
echo ""
echo "---------- CPU USAGE ----------"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo "Total CPU Usage: ${cpu_usage}%"

# ----- USO TOTAL DE MEMORIA -----
echo ""
echo "---------- MEMORY USAGE ----------"
mem_total=$(free -m | awk 'NR==2{print $2}')
mem_used=$(free -m | awk 'NR==2{print $3}')
mem_free=$(free -m | awk 'NR==2{print $4}')
mem_percent=$(free | awk 'NR==2{printf "%.2f", $3*100/$2}')

echo "Total Memory: ${mem_total} MB"
echo "Used Memory:  ${mem_used} MB (${mem_percent}%)"
echo "Free Memory:  ${mem_free} MB"

# ----- USO TOTAL DE DISCO -----
echo ""
echo "---------- DISK USAGE ----------"
echo "Filesystem      Size  Used  Avail  Use%  Mounted on"
df -h --total | grep -E '^/dev/|^total' | awk '{printf "%-15s %5s %5s %6s %5s  %s\n", $1, $2, $3, $4, $5, $6}'

# ----- TOP 5 PROCESOS POR USO DE CPU -----
echo ""
echo "---------- TOP 5 PROCESSES BY CPU USAGE ----------"
echo "PID     CPU%    COMMAND"
ps -eo pid,%cpu,comm --sort=-%cpu | head -n 6 | tail -n 5 | awk '{printf "%-7s %5s%%   %s\n", $1, $2, $3}'

# ----- TOP 5 PROCESOS POR USO DE MEMORIA -----
echo ""
echo "---------- TOP 5 PROCESSES BY MEMORY USAGE ----------"
echo "PID     MEM%    COMMAND"
ps -eo pid,%mem,comm --sort=-%mem | head -n 6 | tail -n 5 | awk '{printf "%-7s %5s%%   %s\n", $1, $2, $3}'

echo ""
echo "=========================================="
echo "   END OF REPORT"
echo "=========================================="
