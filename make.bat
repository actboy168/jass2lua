@echo off
if {%1}=={} (
    echo usage: make.bat xxx.w3x
) else (
    "%~dp0build\lua.exe" "%~dp0src\jass2lua.lua" %1 "%~dp0\"
)
pause
