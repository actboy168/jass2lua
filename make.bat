@echo off
chcp 65001
cd %~dp0
"%~dp0bin\lua.exe" "%~dp0src\main.lua" %1
pause
