@echo off
set URL=https://fakeupdate.net/win10ue/

start msedge "%URL%"
timeout /t 2 >nul

powershell -command "(new-object -com wscript.shell).SendKeys('{F11}')"
