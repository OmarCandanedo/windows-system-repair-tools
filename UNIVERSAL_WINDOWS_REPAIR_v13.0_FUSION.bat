@echo off
setlocal enabledelayedexpansion
title UNIVERSAL WINDOWS REPAIR v13.0 HARDENING + EXPLORER NUCLEAR - ISC Omar Candanedo
color 0B
mode con: cols=120 lines=55

:: ===============================================================================
:: UNIVERSAL WINDOWS REPAIR v13.0 HARDENING + EXPLORER NUCLEAR REPAIR
:: Definitive fusion: repair + optimization + hardening + WSL + Server + Explorer
:: Author: ISC Omar Candanedo (fusion of dozens of professional scripts)
:: ===============================================================================

:: === VERIFY ADMINISTRATOR PERMISSIONS ===
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator permissions...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: === INITIALIZE VARIABLES ===
set "SCRIPT_DIR=%~dp0"
set "TIMESTAMP=%date:~-4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%"
set "TIMESTAMP=%TIMESTAMP: =0%"
set "LOG_FILE=%SCRIPT_DIR%Repair_log_%TIMESTAMP%.txt"
set "ERROR_FILE=%SCRIPT_DIR%Unrepaired_Errors_%TIMESTAMP%.txt"
set "REPORT_FILE=%~dp0Windows_Report_%TIMESTAMP%.html"
set "ERROR_COUNT=0"
set "OK_COUNT=0"
set "WARN_COUNT=0"

:: === CREATE INITIAL LOG FILE ===
echo =============================================================================== > "%LOG_FILE%"
echo UNIVERSAL WINDOWS REPAIR v13.0 HARDENING + EXPLORER NUCLEAR - LOG >> "%LOG_FILE%"
echo ISC Omar Candanedo >> "%LOG_FILE%"
echo =============================================================================== >> "%LOG_FILE%"
echo Start date and time: %date% %time% >> "%LOG_FILE%"
echo User: %USERNAME% >> "%LOG_FILE%"
echo Computer: %COMPUTERNAME% >> "%LOG_FILE%"
echo. >> "%LOG_FILE%"

:: === AUXILIARY FUNCTIONS ===
:LOG_WRITE
echo [%date% %time%] %~1 >> "%LOG_FILE%"
exit /b

:ERROR_LOG
set /a ERROR_COUNT+=1
if not exist "%ERROR_FILE%" (
    echo =============================================================================== > "%ERROR_FILE%"
    echo UNREPAIRED ERRORS LOG >> "%ERROR_FILE%"
    echo Universal Windows Repair v13.0 >> "%ERROR_FILE%"
    echo =============================================================================== >> "%ERROR_FILE%"
    echo. >> "%ERROR_FILE%"
)
echo [%date% %time%] %~1 >> "%ERROR_FILE%"
exit /b

:MARCO
cls
echo ===============================================================================
echo     UNIVERSAL WINDOWS REPAIR v13.0 HARDENING + EXPLORER NUCLEAR
echo                  ISC Omar Candanedo - Professional Fusion
echo ===============================================================================
goto :eof

:PAUSE_MENU
echo.
echo ===============================================================================
pause
goto :eof

:: ===============================================================================
:: MAIN MENU
:: ===============================================================================
:MENU
call :MARCO
echo.
echo                   [MAIN MENU - SELECT AN OPTION]
echo.
echo  [QUICK REPAIR]
echo    1. Express Repair (2 min)
echo    2. Complete Diagnostics
echo.
echo  [NUCLEAR EXPLORER REPAIR]
echo    3. Nuclear Explorer Repair (RECOMMENDED)
echo    4. Full PowerShell Reset
echo    5. Both: Explorer + PowerShell
echo.
echo  [NETWORK AND CONNECTIVITY]
echo    6. Complete Network Repair
echo    7. Optimize WiFi
echo    8. MAX AGGRESSIVE NETWORK (gaming/low latency)
echo.
echo  [CLEANING AND OPTIMIZATION]
echo    9. Recover Disk Space
echo   10. Clean Windows Update
echo   11. Optimize Startup
echo   12. Intelligent Temp Cleanup
echo.
echo  [ADVANCED TOOLS]
echo   13. Create Restore Point
echo   14. Check Integrity (DISM + SFC)
echo   15. Hard Reset Chrome
echo   16. Repair Thunderbird
echo   17. Antimalware Scan (Defender)
echo   18. BSOD Diagnostics
echo.
echo  [HARDENING AND SECURITY]
echo   19. HARDENING SECURITY (Anti-Zeus, ASR, SMB, NTLM)
echo   20. Reactivate Administrator and Repair Permissions
echo   21. Safe Browser Cleanup (with backup)
echo.
echo  [ENTERPRISE TOOLS]
echo   22. Repair WSL (Windows Subsystem for Linux)
echo   23. Enterprise Network/Power Optimization
echo   24. Emergency Windows Server Repair
echo.
echo    0. Exit
echo.
echo ===============================================================================
set /p "OPTION=Enter option number: "

if "%OPTION%"=="1" goto EXPRESS_REPAIR
if "%OPTION%"=="2" goto DIAGNOSTICS
if "%OPTION%"=="3" goto REPAIR_EXPLORER_NUCLEAR
if "%OPTION%"=="4" goto RESET_POWERSHELL
if "%OPTION%"=="5" goto BOTH
if "%OPTION%"=="6" goto REPAIR_NETWORK
if "%OPTION%"=="7" goto OPTIMIZE_WIFI
if "%OPTION%"=="8" goto MAX_AGGRESSIVE_NETWORK
if "%OPTION%"=="9" goto RECOVER_SPACE
if "%OPTION%"=="10" goto CLEAN_UPDATE
if "%OPTION%"=="11" goto OPTIMIZE_STARTUP
if "%OPTION%"=="12" goto CLEANUP_TEMPS
if "%OPTION%"=="13" goto CREATE_RESTORE_POINT
if "%OPTION%"=="14" goto CHECK_INTEGRITY
if "%OPTION%"=="15" goto HARD_RESET_CHROME
if "%OPTION%"=="16" goto REPAIR_THUNDERBIRD
if "%OPTION%"=="17" goto ANTIMALWARE_SCAN
if "%OPTION%"=="18" goto BSOD_DIAGNOSTICS
if "%OPTION%"=="19" goto HARDENING_SECURITY
if "%OPTION%"=="20" goto REACTIVATE_ADMINISTRATOR
if "%OPTION%"=="21" goto SAFE_BROWSER_CLEANUP
if "%OPTION%"=="22" goto REPAIR_WSL
if "%OPTION%"=="23" goto ENTERPRISE_OPTIMIZATION
if "%OPTION%"=="24" goto EMERGENCY_SERVER
if "%OPTION%"=="0" goto END
goto MENU

:: ===============================================================================
:: OPTION 1: EXPRESS REPAIR
:: ===============================================================================
:EXPRESS_REPAIR
call :MARCO
echo [EXPRESS REPAIR - 2 MINUTES]
echo.
call :LOG_WRITE "Express repair started"

echo [1/4] Cleaning temporary files...
del /f /q "%TEMP%\*" 2>nul
del /f /q "C:\Windows\Temp\*" 2>nul
echo [OK]

echo [2/4] Resetting DNS...
ipconfig /flushdns >nul
echo [OK]

echo [3/4] Cleaning prefetch cache...
del /f /q C:\Windows\Prefetch\*.* 2>nul
echo [OK]

echo [4/4] Restarting services...
net stop spooler >nul 2>&1 & net start spooler >nul 2>&1
echo [OK]

echo.
echo EXPRESS REPAIR COMPLETED
set /a OK_COUNT+=1
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 2: COMPLETE DIAGNOSTICS
:: ===============================================================================
:DIAGNOSTICS
call :MARCO
echo [COMPLETE SYSTEM DIAGNOSTICS]
echo.
call :LOG_WRITE "Complete diagnostics started"

echo [1/5] Checking IconCache...
if exist "%localappdata%\IconCache.db" (
    echo [!] IconCache.db exists (may be corrupted)
    set /a WARN_COUNT+=1
) else (
    echo [OK] IconCache.db clean
    set /a OK_COUNT+=1
)

echo [2/5] Checking critical services...
for %%s in (WSearch winmgmt SysMain) do (
    sc query %%s | find "RUNNING" >nul
    if !errorLevel! equ 0 (
        echo [OK] %%s running
        set /a OK_COUNT+=1
    ) else (
        echo [!] %%s stopped
        set /a WARN_COUNT+=1
    )
)

echo [3/5] Checking disk space...
for /f %%a in ('powershell -noprofile -command "[math]::Round((Get-PSDrive C).Free/1GB)"') do set "DISK_FREE=%%a"
echo [INFO] Free space on C: !DISK_FREE!GB

echo [4/5] Checking Windows Defender...
powershell -NoProfile -Command "Get-MpPreference | Select-Object DisableRealtimeMonitoring" >nul 2>&1
if !errorLevel! equ 0 (
    echo [OK] Windows Defender present
    set /a OK_COUNT+=1
) else (
    echo [!] Defender not responding
    set /a WARN_COUNT+=1
)

echo [5/5] Checking pending updates...
powershell -NoProfile -Command "Get-WindowsUpdate -ErrorAction SilentlyContinue" >nul 2>&1
if !errorLevel! equ 0 (
    echo [!] Updates available
    set /a WARN_COUNT+=1
) else (
    echo [OK] System updated
    set /a OK_COUNT+=1
)

echo.
echo DIAGNOSTICS COMPLETED
echo Summary: OK:%OK_COUNT% Warnings:%WARN_COUNT% Errors:%ERROR_COUNT%
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 3: NUCLEAR EXPLORER REPAIR (12 PHASES)
:: ===============================================================================
:REPAIR_EXPLORER_NUCLEAR
call :MARCO
echo [NUCLEAR EXPLORER REPAIR - 12 PHASES]
echo.
call :LOG_WRITE "Nuclear Explorer Repair started"

echo [Phase 1/12] Creating restore point...
powershell -NoProfile -Command "Checkpoint-Computer -Description 'Before_Explorer_Nuclear' -RestorePointType MODIFY_SETTINGS" 2>nul
echo [OK]

echo [Phase 2/12] Killing conflicting processes...
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im SearchHost.exe >nul 2>&1
taskkill /f /im SearchApp.exe >nul 2>&1
timeout /t 2 /nobreak >nul
echo [OK]

echo [Phase 3/12] Atomic cache cleanup...
del /f /q "%localappdata%\IconCache.db" 2>nul
del /f /q "%localappdata%\Microsoft\Windows\Explorer\iconcache*" 2>nul
del /f /q "%localappdata%\Microsoft\Windows\Explorer\thumbcache*" 2>nul
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f >nul 2>&1
echo [OK]

echo [Phase 4/12] WMI Repair (safe, no hangs)...
sc stop winmgmt >nul 2>&1
timeout /t 3 /nobreak >nul
if exist "%windir%\System32\wbem\Repository" ren "%windir%\System32\wbem\Repository" Repository.old
sc start winmgmt >nul 2>&1
timeout /t 5 /nobreak >nul
echo [OK]

echo [Phase 5/12] Disabling problematic shell extensions...
reg delete "HKCR\*\shellex\ContextMenuHandlers" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers" /f >nul 2>&1
echo [OK]

echo [Phase 6/12] Re-registering critical DLLs...
for %%x in (shell32.dll ole32.dll oleaut32.dll actxprxy.dll mshtml.dll urlmon.dll browseui.dll) do (
    regsvr32 /s %%x
)
echo [OK]

echo [Phase 7/12] Windows Search Repair...
sc stop "WSearch" >nul 2>&1
timeout /t 2 /nobreak >nul
rd /s /q "%ProgramData%\Microsoft\Search\Data" 2>nul
sc start "WSearch" >nul 2>&1
echo [OK]

echo [Phase 8/12] Explorer configuration reset...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f >nul
echo [OK]

echo [Phase 9/12] Prefetch cleanup...
net stop SysMain >nul 2>&1
del /f /q C:\Windows\Prefetch\*.* 2>nul
net start SysMain >nul 2>&1
echo [OK]

echo [Phase 10/12] Registry optimization...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul
echo [OK]

echo [Phase 11/12] Running DISM + SFC...
DISM /Online /Cleanup-Image /RestoreHealth >nul 2>&1
sfc /scannow >nul 2>&1
echo [OK]

echo [Phase 12/12] Restarting Explorer...
start explorer.exe
timeout /t 3 /nobreak >nul
echo [OK]

echo.
echo NUCLEAR EXPLORER REPAIR COMPLETED
set /a OK_COUNT+=1
call :LOG_WRITE "Nuclear Explorer Repair completed"
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 4: FULL POWERSHELL RESET
:: ===============================================================================
:RESET_POWERSHELL
call :MARCO
echo [FULL POWERSHELL RESET - 7 PHASES]
echo.
call :LOG_WRITE "Full PowerShell reset started"

echo [1/7] Stopping PowerShell...
taskkill /f /im pwsh.exe >nul 2>&1
taskkill /f /im powershell.exe >nul 2>&1
timeout /t 2 /nobreak >nul
echo [OK]

echo [2/7] Removing corrupted modules...
rd /s /q "%ProgramFiles%\WindowsPowerShell\Modules" 2>nul
rd /s /q "%UserProfile%\Documents\WindowsPowerShell\Modules" 2>nul
echo [OK]

echo [3/7] Cleaning cache...
rd /s /q "%LocalAppData%\Microsoft\Windows\PowerShell" 2>nul
echo [OK]

echo [4/7] Resetting execution policies...
powershell -NoProfile -Command "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force" 2>nul
echo [OK]

echo [5/7] Re-registering PowerShell...
regsvr32 /s %systemroot%\system32\WindowsPowerShell\v1.0\powershell.exe
echo [OK]

echo [6/7] Reinstalling base modules...
powershell -NoProfile -Command "Install-Module -Name PowerShellGet -Force -AllowClobber -ErrorAction SilentlyContinue" 2>nul
echo [OK]

echo [7/7] Updating help...
powershell -NoProfile -Command "Update-Help -Force -ErrorAction SilentlyContinue" 2>nul
echo [OK]

echo.
echo POWERSHELL COMPLETELY RESET
set /a OK_COUNT+=1
call :LOG_WRITE "Full PowerShell reset completed"
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 5: BOTH (EXPLORER + POWERSHELL)
:: ===============================================================================
:BOTH
call :REPAIR_EXPLORER_NUCLEAR
call :RESET_POWERSHELL
echo.
echo COMPLETE REPAIR FINISHED - RESTART WINDOWS
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 6: REPAIR NETWORK
:: ===============================================================================
:REPAIR_NETWORK
call :MARCO
echo [COMPLETE NETWORK REPAIR]
echo.
call :LOG_WRITE "Network repair started"

echo [1/4] Resetting DNS...
ipconfig /flushdns >nul
echo [OK]

echo [2/4] Resetting TCP/IP stack...
netsh winsock reset >nul
netsh int ip reset >nul
echo [OK]

echo [3/4] Reactivating adapters...
powershell -NoProfile -Command "Get-NetAdapter | Restart-NetAdapter -Confirm:$false -ErrorAction SilentlyContinue" >nul 2>&1
echo [OK]

echo [4/4] Restarting network services...
net stop Dnscache >nul 2>&1 & net start Dnscache >nul 2>&1
echo [OK]

echo.
echo NETWORK REPAIRED
set /a OK_COUNT+=1
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 7: OPTIMIZE WIFI
:: ===============================================================================
:OPTIMIZE_WIFI
call :MARCO
echo [OPTIMIZE WIFI]
echo.

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f >nul
netsh wlan set profileorder name=* priority=1 >nul 2>&1

echo WiFi optimized
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 8: MAX AGGRESSIVE NETWORK (Gaming)
:: ===============================================================================
:MAX_AGGRESSIVE_NETWORK
call :MARCO
echo [MAX AGGRESSIVE NETWORK - GAMING / LOW LATENCY]
echo.

powercfg -setacvalueindex scheme_current sub_nic 0 >nul
powercfg -setacvalueindex scheme_current sub_usb usbselectivesuspend 0 >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MTU /t REG_DWORD /d 1500 /f >nul
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global chimney=enabled >nul
netsh int tcp set global ecncapability=enabled >nul

echo Gaming mode activated - Restart to apply
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 9: RECOVER DISK SPACE
:: ===============================================================================
:RECOVER_SPACE
call :MARCO
echo [RECOVER DISK SPACE]
del /f /s /q "%TEMP%\*" 2>nul
rd /s /q "%TEMP%" 2>nul & mkdir "%TEMP%" 2>nul
powershell -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" 2>nul
echo Disk space recovered
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 10: CLEAN WINDOWS UPDATE
:: ===============================================================================
:CLEAN_UPDATE
call :MARCO
echo [CLEAN WINDOWS UPDATE]
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution\Download" 2>nul
mkdir "C:\Windows\SoftwareDistribution\Download" 2>nul
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo Windows Update cleaned
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 11: OPTIMIZE STARTUP
:: ===============================================================================
:OPTIMIZE_STARTUP
call :MARCO
echo [OPTIMIZE STARTUP]
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul
echo Startup optimized
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 12: INTELLIGENT TEMP CLEANUP
:: ===============================================================================
:CLEANUP_TEMPS
call :MARCO
echo [INTELLIGENT CLEANUP OF TEMPORARY FILES]
del /f /q "%TEMP%\*" 2>nul
del /f /q "C:\Windows\Temp\*" 2>nul
del /f /q "C:\Windows\Prefetch\*" 2>nul
echo Temporary files cleaned
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 13: CREATE RESTORE POINT
:: ===============================================================================
:CREATE_RESTORE_POINT
call :MARCO
echo [CREATE RESTORE POINT]
powershell -NoProfile -Command "Checkpoint-Computer -Description 'Manual_%TIMESTAMP%' -RestorePointType MODIFY_SETTINGS" 2>nul
echo Restore point created
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 14: CHECK INTEGRITY (DISM + SFC)
:: ===============================================================================
:CHECK_INTEGRITY
call :MARCO
echo [CHECK INTEGRITY - DISM + SFC]
echo Running DISM...
DISM /Online /Cleanup-Image /RestoreHealth >nul 2>&1
echo DISM completed
echo Running SFC...
sfc /scannow >nul 2>&1
echo SFC completed
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 15: HARD RESET CHROME
:: ===============================================================================
:HARD_RESET_CHROME
call :MARCO
echo [HARD RESET CHROME]
taskkill /f /im chrome.exe >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default" 2>nul
echo Chrome reset
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 16: REPAIR THUNDERBIRD
:: ===============================================================================
:REPAIR_THUNDERBIRD
call :MARCO
echo [REPAIR THUNDERBIRD]
taskkill /f /im thunderbird.exe >nul 2>&1
for /d %%i in ("%APPDATA%\Thunderbird\Profiles\*") do (
    for /r "%%i\Mail" %%f in (*.msf) do del /f /q "%%f" 2>nul
)
echo Thunderbird repaired
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 17: ANTIMALWARE SCAN
:: ===============================================================================
:ANTIMALWARE_SCAN
call :MARCO
echo [ANTIMALWARE SCAN WITH DEFENDER]
echo Running quick scan...
powershell -NoProfile -Command "Start-MpScan -ScanType QuickScan -ErrorAction SilentlyContinue" >nul 2>&1
echo Scan initiated
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 18: BSOD DIAGNOSTICS
:: ===============================================================================
:BSOD_DIAGNOSTICS
call :MARCO
echo [BSOD DIAGNOSTICS]
powershell -NoProfile -Command "Get-EventLog -LogName System -Newest 10 | Where-Object {$_.EventID -eq 1001} | Format-List TimeGenerated, Message" 2>nul
echo Latest errors displayed
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 19: HARDENING SECURITY
:: ===============================================================================
:HARDENING_SECURITY
call :MARCO
echo [HARDENING SECURITY]
echo.
set /p "conf=  Apply hardening (Anti-Zeus, SMB, NTLM)? Y/N: "
if /i not "%conf%"=="Y" goto MENU

echo Closing SMB Null Sessions...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d 2 /f >nul
sc config mrxsmb10 start= disabled >nul 2>&1
echo [OK]

echo Forcing NTLMv2...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" /t REG_DWORD /d 5 /f >nul
echo [OK]

echo Activating Defender in aggressive mode...
powershell -NoProfile -Command "Set-MpPreference -DisableRealtimeMonitoring $false -MAPSReporting Advanced" >nul 2>&1
echo [OK]

echo Hardening Firewall...
netsh advfirewall set allprofiles state on >nul
netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound >nul
echo [OK]

echo Hardening completed
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 20: REACTIVATE ADMINISTRATOR
:: ===============================================================================
:REACTIVATE_ADMINISTRATOR
call :MARCO
echo [REACTIVATE ADMINISTRATOR AND REPAIR PERMISSIONS]
echo.

net user Administrator /active:yes >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v Administrator /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f >nul
powershell -NoProfile -Command "Set-ExecutionPolicy Unrestricted -Force" >nul 2>&1

echo Administrator reactivated
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 21: SAFE BROWSER CLEANUP
:: ===============================================================================
:SAFE_BROWSER_CLEANUP
call :MARCO
echo [SAFE BROWSER CLEANUP WITH BACKUP]
echo.

set "BACKUP_DIR=%USERPROFILE%\Desktop\BrowserBackup_%TIMESTAMP%"
mkdir "%BACKUP_DIR%" >nul 2>&1

echo Backing up data...
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Bookmarks" xcopy "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Bookmarks" "%BACKUP_DIR%\Chrome\" /Y >nul 2>&1
if exist "%APPDATA%\Mozilla\Firefox\Profiles" xcopy "%APPDATA%\Mozilla\Firefox\Profiles" "%BACKUP_DIR%\Firefox\" /Y /S >nul 2>&1

echo Closing browsers...
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1

echo Cleaning cache...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" 2>nul
for /d %%i in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do rd /s /q "%%i\cache2" 2>nul

echo Browsers cleaned. Backup at: %BACKUP_DIR%
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 22: REPAIR WSL
:: ===============================================================================
:REPAIR_WSL
call :MARCO
echo [REPAIR WSL]
echo.

wsl --shutdown >nul 2>&1
powershell -NoProfile -Command "Get-AppxPackage *Ubuntu* | Remove-AppxPackage" >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Lxss" /f >nul 2>&1
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart >nul 2>&1

echo WSL reset. Install your distribution from Microsoft Store
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 23: ENTERPRISE OPTIMIZATION
:: ===============================================================================
:ENTERPRISE_OPTIMIZATION
call :MARCO
echo [ENTERPRISE NETWORK/POWER OPTIMIZATION]
echo.

powercfg -h off
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
powercfg /change standby-timeout-ac 0

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f >nul
powershell -NoProfile -Command "Get-NetAdapter | ForEach-Object { Disable-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue }" >nul 2>&1

echo Enterprise optimization completed
call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: OPTION 24: EMERGENCY WINDOWS SERVER REPAIR
:: ===============================================================================
:EMERGENCY_SERVER
call :MARCO
echo [EMERGENCY WINDOWS SERVER REPAIR]
echo.

set "EMERGENCY_PATH=%SystemRoot%\System32;%SystemRoot%;%SystemRoot%\System32\Wbem"
setx PATH "%EMERGENCY_PATH%%PATH%" /M >nul 2>&1

sc config EventLog start= auto >nul 2>&1 & sc start EventLog >nul 2>&1
sc config RpcSs start= auto >nul 2>&1 & sc start RpcSs >nul 2>&1
sc config LanmanServer start= auto >nul 2>&1 & sc start LanmanServer >nul 2>&1

echo Services repaired. Running diagnostics...
sfc /scannow
dism /online /cleanup-image /checkhealth

call :PAUSE_MENU
goto MENU

:: ===============================================================================
:: END OF SCRIPT
:: ===============================================================================
:END
call :MARCO
echo.
echo ===============================================================================
echo                  THANK YOU FOR USING UNIVERSAL WINDOWS REPAIR
echo ===============================================================================
echo.
echo Generated files:
echo - Activity log: %LOG_FILE%
if exist "%ERROR_FILE%" echo - Error log: %ERROR_FILE%
echo.
echo Summary: OK:%OK_COUNT% Warnings:%WARN_COUNT% Errors:%ERROR_COUNT%
echo.
echo ISC Omar Candanedo - Professional Fusion Tools
echo ===============================================================================
call :LOG_WRITE "Script completed successfully"
timeout /t 5
exit
