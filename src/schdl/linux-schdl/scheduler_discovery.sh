#!/bin/bash

# ============================================================
# Práctica: Exploración del Scheduler real en Linux (Ubuntu 22.04)
# Alumno: Jonathan
#
# En esta práctica se explora el scheduler que realmente usa
# Linux, ya que no implementa directamente FCFS, SJF o RR
# como se estudia en teoría.
# ============================================================

echo "Explorando el scheduler real de Linux (CFS)"
echo "------------------------------------------"

# El kernel de Linux ya viene instalado en el sistema,
# pero el código fuente no siempre está disponible.
# Para poder analizarlo, se instala el paquete linux-source.

sudo apt install linux-source
echo "Codigo fuente del kernel instalado"

# El código fuente del kernel se almacena en /usr/src
cd /usr/src
echo "Directorio actual:"
pwd

echo "Contenido de /usr/src:"
ls

# El código fuente viene comprimido en un archivo .tar.bz2
# Se procede a descomprimirlo
echo "Descomprimiendo el codigo fuente del kernel"
sudo tar -xjf linux-source-5.15.0.tar.bz2

# Entramos al directorio del kernel
cd linux-source-5.15.0
echo "Entrando al codigo fuente del kernel"
pwd

# Dentro del kernel existe una carpeta llamada kernel
# que contiene partes centrales del sistema operativo
ls
cd kernel

echo "Contenido de la carpeta kernel:"
ls

# Dentro de kernel se encuentra la carpeta sched,
# que contiene el codigo relacionado con el scheduling
cd sched
echo "Directorio de scheduling encontrado:"
pwd

echo "Archivos relacionados con el scheduler:"
ls

# El archivo core.c contiene la base del sistema de scheduling
# de Linux, es decir, el framework general
echo "Mostrando core.c"
cat core.c

echo "------------------------------------------"
echo "El archivo core.c define las bases del scheduler en Linux"
echo "Aqui se establece el framework general de planificacion"
echo "------------------------------------------"

# El archivo fair.c implementa el Completely Fair Scheduler (CFS)
# que es el scheduler por defecto de Linux
echo "Mostrando fair.c"
cat fair.c

echo "------------------------------------------"
echo "El archivo fair.c implementa el Completely Fair Scheduler (CFS)"
echo "Este scheduler busca repartir el tiempo de CPU de manera justa"
echo "usando conceptos como virtual runtime"
echo "------------------------------------------"

# ------------------------------------------------------------
# Pregunta de reflexion (obligatoria):
#
# ¿Por qué Linux no implementa directamente FCFS, SJF o RR?
#
# Linux es un sistema operativo complejo que ejecuta miles de
# procesos de manera simultanea. Los algoritmos clasicos como
# FCFS, SJF o RR no escalan bien en este contexto y pueden causar
# problemas de eficiencia o falta de respuesta.
#
# El CFS prioriza la equidad entre procesos y la estabilidad
# del sistema, en lugar de basarse solo en tiempos de llegada
# o duracion de ejecucion como los algoritmos teoricos.