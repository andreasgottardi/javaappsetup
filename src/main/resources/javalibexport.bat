@echo off
cd %~dp0
java -cp "..\lib\*" -Dlogback.configurationFile=..\config\logback.xml javalibexport.JavaLibExport
pause