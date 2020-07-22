#!/bin/bash
cd "$(dirname "$0")"
java -cp "../lib/*" -Dlogback.configurationFile=../config/logback.xml javalibexport.JavaLibExport
read -s -n 1 -p "Press any key to continue..."