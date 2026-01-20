# Server Stats
https://github.com/Made08/server-stats 

Script de Bash para analizar estadísticas básicas de rendimiento en servidores Linux.

## Descripción

`server-stats.sh` es un script que recopila y muestra información esencial del rendimiento del servidor en tiempo real. Diseñado para ejecutarse en cualquier distribución de Linux sin dependencias adicionales.

## Estadísticas que Muestra

| Estadística | Descripción |
|-------------|-------------|
| **Uso de CPU** | Porcentaje total de uso del procesador |
| **Uso de Memoria** | Memoria total, usada y libre en MB con porcentaje |
| **Uso de Disco** | Espacio en disco por filesystem (tamaño, usado, disponible, %) |
| **Top 5 Procesos (CPU)** | Los 5 procesos con mayor consumo de CPU |
| **Top 5 Procesos (Memoria)** | Los 5 procesos con mayor consumo de RAM |

## Requisitos

- Sistema operativo Linux
- Bash shell
- Comandos estándar: `top`, `free`, `df`, `ps`, `awk`, `grep`

## Instalación

1. Clonar el repositorio:
```bash
git clone https://github.com/tu-usuario/server-stats.git
cd server-stats
```

2. Dar permisos de ejecución:
```bash
chmod +x server-stats.sh
```

## Uso

```bash
./server-stats.sh
```

## Ejemplo de Salida

```
==========================================
   SERVER PERFORMANCE STATISTICS
   Mon Jan 19 22:15:00 UTC 2026
==========================================

---------- CPU USAGE ----------
Total CPU Usage: 12.5%

---------- MEMORY USAGE ----------
Total Memory: 16384 MB
Used Memory:  8192 MB (50.00%)
Free Memory:  8192 MB

---------- DISK USAGE ----------
Filesystem      Size  Used  Avail  Use%  Mounted on
/dev/sda1        100G   45G    55G   45%  /
total            100G   45G    55G   45%  -

---------- TOP 5 PROCESSES BY CPU USAGE ----------
PID     CPU%    COMMAND
1234    15.2%   firefox
5678     8.5%   code
9012     5.3%   node
3456     3.1%   python
7890     2.8%   bash

---------- TOP 5 PROCESSES BY MEMORY USAGE ----------
PID     MEM%    COMMAND
1234    12.5%   firefox
5678     8.0%   code
9012     4.2%   mysql
3456     3.5%   java
7890     2.1%   nginx

==========================================
   END OF REPORT
==========================================
```

## Comandos Utilizados

| Comando | Propósito |
|---------|-----------|
| `top -bn1` | Obtener uso de CPU |
| `free -m` | Obtener estadísticas de memoria en MB |
| `df -h --total` | Obtener uso de disco con totales |
| `ps -eo pid,%cpu,comm --sort=-%cpu` | Listar procesos ordenados por CPU |
| `ps -eo pid,%mem,comm --sort=-%mem` | Listar procesos ordenados por memoria |

## Licencia


MIT License
