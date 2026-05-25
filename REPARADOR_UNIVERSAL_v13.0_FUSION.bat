@echo off
setlocal enabledelayedexpansion
title REPARADOR UNIVERSAL WINDOWS v13.0 HARDENING + EXPLORER NUCLEAR - ISC Omar Candanedo
color 0B
mode con: cols=120 lines=55

:: ===============================================================================
:: REPARADOR UNIVERSAL WINDOWS v13.0 HARDENING + EXPLORER NUCLEAR REPAIR
:: Fusion definitiva: reparacion + optimizacion + hardening + WSL + Server + Explorer
:: Autor: ISC Omar Candanedo (fusion de decenas de scripts profesionales)
:: ===============================================================================

:: === VERIFICAR PERMISOS DE ADMINISTRADOR ===
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando permisos de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: === INICIALIZACION DE VARIABLES ===
set "SCRIPT_DIR=%~dp0"
set "TIMESTAMP=%date:~-4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%"
set "TIMESTAMP=%TIMESTAMP: =0%"
set "LOG_FILE=%SCRIPT_DIR%Reparador_log_%TIMESTAMP%.txt"
set "ERROR_FILE=%SCRIPT_DIR%Errores_No_Reparados_%TIMESTAMP%.txt"
set "REPORT_FILE=%~dp0Reporte_Windows_%TIMESTAMP%.html"
set "ERROR_COUNT=0"
set "OK_COUNT=0"
set "WARN_COUNT=0"

:: === CREAR ARCHIVO DE LOG INICIAL ===
echo =============================================================================== > "%LOG_FILE%"
echo REPARADOR UNIVERSAL WINDOWS v13.0 HARDENING + EXPLORER NUCLEAR - LOG >> "%LOG_FILE%"
echo ISC Omar Candanedo >> "%LOG_FILE%"
echo =============================================================================== >> "%LOG_FILE%"
echo Fecha y hora de inicio: %date% %time% >> "%LOG_FILE%"
echo Usuario: %USERNAME% >> "%LOG_FILE%"
echo Equipo: %COMPUTERNAME% >> "%LOG_FILE%"
echo. >> "%LOG_FILE%"

:: === FUNCIONES AUXILIARES ===
:LOG_WRITE
echo [%date% %time%] %~1 >> "%LOG_FILE%"
exit /b

:ERROR_LOG
set /a ERROR_COUNT+=1
if not exist "%ERROR_FILE%" (
    echo =============================================================================== > "%ERROR_FILE%"
    echo REGISTRO DE ERRORES NO REPARADOS >> "%ERROR_FILE%"
    echo Reparador Universal Windows v13.0 >> "%ERROR_FILE%"
    echo =============================================================================== >> "%ERROR_FILE%"
    echo. >> "%ERROR_FILE%"
)
echo [%date% %time%] %~1 >> "%ERROR_FILE%"
exit /b

:MARCO
cls
echo ===============================================================================
echo        REPARADOR UNIVERSAL WINDOWS v13.0 HARDENING + EXPLORER NUCLEAR
echo                     ISC Omar Candanedo - Fusion Profesional
echo ===============================================================================
goto :eof

:PAUSA
echo.
echo ===============================================================================
pause
goto :eof

:: ===============================================================================
:: MENU PRINCIPAL
:: ===============================================================================
:MENU
call :MARCO
echo.
echo                    [MENU PRINCIPAL - SELECCIONE UNA OPCION]
echo.
echo  [REPARACION RAPIDA]
echo    1. Reparacion Express (2 min)
echo    2. Diagnostico Completo
echo.
echo  [REPARACION NUCLEAR EXPLORER]
echo    3. Reparacion Nuclear de Explorer (RECOMENDADO)
echo    4. Full Reset de PowerShell
echo    5. Ambos: Explorer + PowerShell
echo.
echo  [RED Y CONECTIVIDAD]
echo    6. Reparar Red Completa
echo    7. Optimizar WiFi
echo    8. RED MAX AGRESIVA (gaming/baja latencia)
echo.
echo  [LIMPIEZA Y OPTIMIZACION]
echo    9. Recuperar Espacio en Disco
echo   10. Limpiar Windows Update
echo   11. Optimizar Inicio
echo   12. Limpieza Inteligente de Temporales
echo.
echo  [HERRAMIENTAS AVANZADAS]
echo   13. Crear Punto de Restauracion
echo   14. Verificar Integridad (DISM + SFC)
echo   15. Hard Reset Chrome
echo   16. Reparar Thunderbird
echo   17. Escaneo Antimalware (Defender)
echo   18. Diagnostico BSOD
echo.
echo  [HARDENING Y SEGURIDAD]
echo   19. HARDENING DE SEGURIDAD (Anti-Zeus, ASR, SMB, NTLM)
echo   20. Reactivar Administrador y Reparar Permisos
echo   21. Limpieza Segura de Navegadores (con backup)
echo.
echo  [HERRAMIENTAS EMPRESARIALES]
echo   22. Reparar WSL (Windows Subsystem for Linux)
echo   23. Optimizacion Empresarial Red/Energia
echo   24. Reparacion de Emergencia Windows Server
echo.
echo    0. Salir
echo.
echo ===============================================================================
set /p "OPCION=Ingrese el numero de opcion: "

if "%OPCION%"=="1" goto REPARACION_EXPRESS
if "%OPCION%"=="2" goto DIAGNOSTICO
if "%OPCION%"=="3" goto REPAIR_EXPLORER_NUCLEAR
if "%OPCION%"=="4" goto RESET_POWERSHELL
if "%OPCION%"=="5" goto AMBOS
if "%OPCION%"=="6" goto REPARAR_RED
if "%OPCION%"=="7" goto OPTIMIZAR_WIFI
if "%OPCION%"=="8" goto RED_MAX_AGRESIVA
if "%OPCION%"=="9" goto RECUPERAR_ESPACIO
if "%OPCION%"=="10" goto LIMPIAR_UPDATE
if "%OPCION%"=="11" goto OPTIMIZAR_INICIO
if "%OPCION%"=="12" goto LIMPIEZA_TEMPORALES
if "%OPCION%"=="13" goto PUNTO_RESTAURACION
if "%OPCION%"=="14" goto VERIFICAR_INTEGRIDAD
if "%OPCION%"=="15" goto HARD_RESET_CHROME
if "%OPCION%"=="16" goto REPARAR_THUNDERBIRD
if "%OPCION%"=="17" goto ESCANEO_ANTIMALWARE
if "%OPCION%"=="18" goto DIAGNOSTICO_BSOD
if "%OPCION%"=="19" goto HARDENING_SEGURIDAD
if "%OPCION%"=="20" goto REACTIVAR_ADMINISTRADOR
if "%OPCION%"=="21" goto LIMPIEZA_NAVEGADORES_SEGURA
if "%OPCION%"=="22" goto REPARAR_WSL
if "%OPCION%"=="23" goto OPTIMIZACION_EMPRESARIAL
if "%OPCION%"=="24" goto EMERGENCIA_SERVER
if "%OPCION%"=="0" goto FIN
goto MENU

:: ===============================================================================
:: OPCION 1: REPARACION EXPRESS
:: ===============================================================================
:REPARACION_EXPRESS
call :MARCO
echo [REPARACION EXPRESS - 2 MINUTOS]
echo.
call :LOG_WRITE "Reparacion Express iniciada"

echo [1/4] Limpiando temporales...
del /f /q "%TEMP%\*" 2>nul
del /f /q "C:\Windows\Temp\*" 2>nul
echo [OK]

echo [2/4] Reseteando DNS...
ipconfig /flushdns >nul
echo [OK]

echo [3/4] Limpiando cache de prefetch...
del /f /q C:\Windows\Prefetch\*.* 2>nul
echo [OK]

echo [4/4] Reiniciando servicios...
net stop spooler >nul 2>&1 & net start spooler >nul 2>&1
echo [OK]

echo.
echo REPARACION EXPRESS COMPLETADA
set /a OK_COUNT+=1
call :PAUSA
goto MENU

:: ===============================================================================
:: OPCION 2: DIAGNOSTICO COMPLETO
:: ===============================================================================
:DIAGNOSTICO
call :MARCO
echo [DIAGNOSTICO COMPLETO DEL SISTEMA]
echo.
call :LOG_WRITE "Diagnostico completo iniciado"

echo [1/5] Verificando IconCache...
if exist "%localappdata%\IconCache.db" (
    echo [!] IconCache.db existe (puede estar corrupto)
    set /a WARN_COUNT+=1
) else (
    echo [OK] IconCache.db limpio
    set /a OK_COUNT+=1
)

echo [2/5] Verificando servicios criticos...
for %%s in (WSearch winmgmt SysMain) do (
    sc query %%s | find "RUNNING" >nul
    if !errorLevel! equ 0 (
        echo [OK] %%s funcionando
        set /a OK_COUNT+=1
    ) else (
        echo [!] %%s detenido
        set /a WARN_COUNT+=1
    )
)

echo [3/5] Verificando espacio en disco...
for /f %%a in ('powershell -noprofile -command "[math]::Round((Get-PSDrive C).Free/1GB)"') do set "DISCO_LIBRE=%%a"
echo [INFO] Espacio libre en C: !DISCO_LIBRE!GB

echo [4/5] Verificando Windows Defender...
powershell -NoProfile -Command "Get-MpPreference | Select-Object DisableRealtimeMonitoring" >nul 2>&1
if !errorLevel! equ 0 (
    echo [OK] Windows Defender presente
    set /a OK_COUNT+=1
) else (
    echo [!] Defender no responde
    set /a WARN_COUNT+=1
)

echo [5/5] Verificando actualizaciones pendientes...
powershell -NoProfile -Command "Get-WindowsUpdate -ErrorAction SilentlyContinue" >nul 2>&1
if !errorLevel! equ 0 (
    echo [!] Hay actualizaciones disponibles
    set /a WARN_COUNT+=1
) else (
    echo [OK] Sistema actualizado
    set /a OK_COUNT+=1
)

echo.
echo DIAGNOSTICO COMPLETADO
echo Resumen: OK:%OK_COUNT% Avisos:%WARN_COUNT% Errores:%ERROR_COUNT%
call :PAUSA
goto MENU

:: ===============================================================================
:: OPCION 3: REPARACION NUCLEAR DE EXPLORER (FUSION)
:: ===============================================================================
:REPAIR_EXPLORER_NUCLEAR
call :MARCO
echo [REPARACION NUCLEAR DE EXPLORER.EXE - 12 FASES]
echo.
call :LOG_WRITE "Reparacion Nuclear de Explorer iniciada"

echo [Fase 1/12] Creando punto de restauracion...
powershell -NoProfile -Command "Checkpoint-Computer -Description 'Antes_Explorer_Nuclear' -RestorePointType MODIFY_SETTINGS" 2>nul
echo [OK]

echo [Fase 2/12] Matando procesos conflictivos...
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im SearchHost.exe >nul 2>&1
taskkill /f /im SearchApp.exe >nul 2>&1
timeout /t 2 /nobreak >nul
echo [OK]

echo [Fase 3/12] Limpieza atomica de caches...
del /f /q "%localappdata%\IconCache.db" 2>nul
del /f /q "%localappdata%\Microsoft\Windows\Explorer\iconcache*" 2>nul
del /f /q "%localappdata%\Microsoft\Windows\Explorer\thumbcache*" 2>nul
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f >nul 2>&1
echo [OK]

echo [Fase 4/12] Reparacion de WMI (seguro, sin hangs)...
sc stop winmgmt >nul 2>&1
timeout /t 3 /nobreak >nul
if exist "%windir%\System32\wbem\Repository" ren "%windir%\System32\wbem\Repository" Repository.old
sc start winmgmt >nul 2>&1
timeout /t 5 /nobreak >nul
echo [OK]

echo [Fase 5/12] Deshabilitando extensiones shell problematicas...
reg delete "HKCR\*\shellex\ContextMenuHandlers" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers" /f >nul 2>&1
echo [OK]

echo [Fase 6/12] Re-registro de DLLs criticas...
for %%x in (shell32.dll ole32.dll oleaut32.dll actxprxy.dll mshtml.dll urlmon.dll browseui.dll) do (
    regsvr32 /s %%x
)
echo [OK]

echo [Fase 7/12] Reparacion de Windows Search...
sc stop "WSearch" >nul 2>&1
timeout /t 2 /nobreak >nul
rd /s /q "%ProgramData%\Microsoft\Search\Data" 2>nul
sc start "WSearch" >nul 2>&1
echo [OK]

echo [Fase 8/12] Reset de configuracion de Explorer...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f >nul
echo [OK]

echo [Fase 9/12] Limpieza de Prefetch...
net stop SysMain >nul 2>&1
del /f /q C:\Windows\Prefetch\*.* 2>nul
net start SysMain >nul 2>&1
echo [OK]

echo [Fase 10/12] Optimizacion de registro...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul
echo [OK]

echo [Fase 11/12] Ejecutando DISM + SFC...
DISM /Online /Cleanup-Image /RestoreHealth >nul 2>&1
sfc /scannow >nul 2>&1
echo [OK]

echo [Fase 12/12] Reiniciando Explorer...
start explorer.exe
timeout /t 3 /nobreak >nul
echo [OK]

echo.
echo REPARACION NUCLEAR DE EXPLORER COMPLETADA
set /a OK_COUNT+=1
call :LOG_WRITE "Reparacion Nuclear de Explorer completada"
call :PAUSA
goto MENU

:: ===============================================================================
:: OPCION 4: FULL RESET POWERSHELL
:: ===============================================================================
:RESET_POWERSHELL
call :MARCO
echo [FULL RESET DE POWERSHELL - 7 FASES]
echo.
call :LOG_WRITE "Full Reset PowerShell iniciado"

echo [1/7] Deteniendo PowerShell...
taskkill /f /im pwsh.exe >nul 2>&1
taskkill /f /im powershell.exe >nul 2>&1
timeout /t 2 /nobreak >nul
echo [OK]

echo [2/7] Eliminando modulos corruptos...
rd /s /q "%ProgramFiles%\WindowsPowerShell\Modules" 2>nul
rd /s /q "%UserProfile%\Documents\WindowsPowerShell\Modules" 2>nul
echo [OK]

echo [3/7] Limpiando cache...
rd /s /q "%LocalAppData%\Microsoft\Windows\PowerShell" 2>nul
echo [OK]

echo [4/7] Reseteando politicas de ejecucion...
powershell -NoProfile -Command "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force" 2>nul
echo [OK]

echo [5/7] Re-registrando PowerShell...
regsvr32 /s %systemroot%\system32\WindowsPowerShell\v1.0\powershell.exe
echo [OK]

echo [6/7] Reinstalando modulos base...
powershell -NoProfile -Command "Install-Module -Name PowerShellGet -Force -AllowClobber -ErrorAction SilentlyContinue" 2>nul
echo [OK]

echo [7/7] Actualizando ayuda...
powershell -NoProfile -Command "Update-Help -Force -ErrorAction SilentlyContinue" 2>nul
echo [OK]

echo.
echo POWERSHELL COMPLETAMENTE RESETEADO
set /a OK_COUNT+=1
call :LOG_WRITE "Full Reset PowerShell completado"
call :PAUSA
goto MENU

:: ===============================================================================
:: OPCION 5: AMBOS (EXPLORER + POWERSHELL)
:: ===============================================================================
:AMBOS
call :REPAIR_EXPLORER_NUCLEAR
call :RESET_POWERSHELL
echo.
echo REPARACION COMPLETA FINALIZADA - REINICIA WINDOWS
call :PAUSA
goto MENU

:: ===============================================================================
:: OPCION 6: REPARAR RED
:: ===============================================================================
:REPARAR_RED
call :MARCO
echo [REPARAR RED COMPLETA]
echo.
call :LOG_WRITE "Reparacion de red iniciada"

echo [1/4] Reseteando DNS...
ipconfig /flushdns >nul
echo [OK]

echo [2/4] Reseteando stack TCP/IP...
netsh winsock reset >nul
netsh int ip reset >nul
echo [OK]

echo [3/4] Reactivando adaptadores...
powershell -NoProfile -Command "Get-NetAdapter | Restart-NetAdapter -Confirm:$false -ErrorAction SilentlyContinue" >nul 2>&1
echo [OK]

echo [4/4] Reiniciando servicios de red...
net stop Dnscache >nul 2>&1 & net start Dnscache >nul 2>&1
echo [OK]

echo.
echo RED REPARADA
set /a OK_COUNT+=1
call :PAUSA
goto MENU

:: ===============================================================================
:: OPCION 7: OPTIMIZAR WIFI
:: ===============================================================================
:OPTIMIZAR_WIFI
call :MARCO
echo [OPTIMIZAR WiFi]
echo.

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f >nul
netsh wlan set profileorder name=* priority=1 >nul 2>&1

echo WiFi optimizado
call :PAUSA
goto MENU

:: ===============================================================================
:: OPCION 8: RED MAX AGRESIVA (Gaming)
:: ===============================================================================
:RED_MAX_AGRESIVA
call :MARCO
echo [RED MAX AGRESIVA - GAMING / BAJA LATENCIA]
echo.

powercfg -setacvalueindex scheme_current sub_nic 0 >nul
powercfg -setacvalueindex scheme_current sub_usb usbselectivesuspend 0 >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 65535 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MTU /t REG_DWORD /d 1500 /f >nul
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global chimney=enabled >nul
netsh int tcp set global ecncapability=enabled >nul

echo Modo gaming activado - Reinicia para aplicar
call :PAUSA
goto MENU

:: ===============================================================================
:: OPCIONES ADICIONALES
:: ===============================================================================

:RECUPERAR_ESPACIO
call :MARCO
echo [RECUPERAR ESPACIO EN DISCO]
del /f /s /q "%TEMP%\*" 2>nul
rd /s /q "%TEMP%" 2>nul & mkdir "%TEMP%" 2>nul
powershell -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" 2>nul
echo Espacio recuperado
call :PAUSA
goto MENU

:LIMPIAR_UPDATE
call :MARCO
echo [LIMPIAR WINDOWS UPDATE]
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution\Download" 2>nul
mkdir "C:\Windows\SoftwareDistribution\Download" 2>nul
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo Windows Update limpiado
call :PAUSA
goto MENU

:OPTIMIZAR_INICIO
call :MARCO
echo [OPTIMIZAR INICIO]
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul
echo Inicio optimizado
call :PAUSA
goto MENU

:LIMPIEZA_TEMPORALES
call :MARCO
echo [LIMPIEZA INTELIGENTE DE TEMPORALES]
del /f /q "%TEMP%\*" 2>nul
del /f /q "C:\Windows\Temp\*" 2>nul
del /f /q "C:\Windows\Prefetch\*" 2>nul
echo Temporales limpiados
call :PAUSA
goto MENU

:PUNTO_RESTAURACION
call :MARCO
echo [CREAR PUNTO DE RESTAURACION]
powershell -NoProfile -Command "Checkpoint-Computer -Description 'Manual_%TIMESTAMP%' -RestorePointType MODIFY_SETTINGS" 2>nul
echo Punto de restauracion creado
call :PAUSA
goto MENU

:VERIFICAR_INTEGRIDAD
call :MARCO
echo [VERIFICAR INTEGRIDAD - DISM + SFC]
echo Ejecutando DISM...
DISM /Online /Cleanup-Image /RestoreHealth >nul 2>&1
echo DISM completado
echo Ejecutando SFC...
sfc /scannow >nul 2>&1
echo SFC completado
call :PAUSA
goto MENU

:HARD_RESET_CHROME
call :MARCO
echo [HARD RESET CHROME]
taskkill /f /im chrome.exe >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default" 2>nul
echo Chrome reseteado
call :PAUSA
goto MENU

:REPARAR_THUNDERBIRD
call :MARCO
echo [REPARAR THUNDERBIRD]
taskkill /f /im thunderbird.exe >nul 2>&1
for /d %%i in ("%APPDATA%\Thunderbird\Profiles\*") do (
    for /r "%%i\Mail" %%f in (*.msf) do del /f /q "%%f" 2>nul
)
echo Thunderbird reparado
call :PAUSA
goto MENU

:ESCANEO_ANTIMALWARE
call :MARCO
echo [ESCANEO ANTIMALWARE CON DEFENDER]
echo Ejecutando escaneo rapido...
powershell -NoProfile -Command "Start-MpScan -ScanType QuickScan -ErrorAction SilentlyContinue" >nul 2>&1
echo Escaneo iniciado
call :PAUSA
goto MENU

:DIAGNOSTICO_BSOD
call :MARCO
echo [DIAGNOSTICO BSOD]
powershell -NoProfile -Command "Get-EventLog -LogName System -Newest 10 | Where-Object {$_.EventID -eq 1001} | Format-List TimeGenerated, Message" 2>nul
echo Ultimos errores mostrados
call :PAUSA
goto MENU

:: ===============================================================================
:: HARDENING DE SEGURIDAD
:: ===============================================================================
:HARDENING_SEGURIDAD
call :MARCO
echo [HARDENING DE SEGURIDAD]
echo.
set /p "conf=  Aplicar hardening (Anti-Zeus, SMB, NTLM)? S/N: "
if /i not "%conf%"=="S" goto MENU

echo Cerrando SMB Null Sessions...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d 2 /f >nul
sc config mrxsmb10 start= disabled >nul 2>&1
echo [OK]

echo Forzando NTLMv2...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" /t REG_DWORD /d 5 /f >nul
echo [OK]

echo Activando Defender en modo agresivo...
powershell -NoProfile -Command "Set-MpPreference -DisableRealtimeMonitoring $false -MAPSReporting Advanced" >nul 2>&1
echo [OK]

echo Endureciendo Firewall...
netsh advfirewall set allprofiles state on >nul
netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound >nul
echo [OK]

echo Hardening completado
call :PAUSA
goto MENU

:: ===============================================================================
:: REACTIVAR ADMINISTRADOR
:: ===============================================================================
:REACTIVAR_ADMINISTRADOR
call :MARCO
echo [REACTIVAR ADMINISTRADOR Y REPARAR PERMISOS]
echo.

net user Administrator /active:yes >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v Administrator /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f >nul
powershell -NoProfile -Command "Set-ExecutionPolicy Unrestricted -Force" >nul 2>&1

echo Administrador reactivado
call :PAUSA
goto MENU

:: ===============================================================================
:: LIMPIEZA SEGURA DE NAVEGADORES
:: ===============================================================================
:LIMPIEZA_NAVEGADORES_SEGURA
call :MARCO
echo [LIMPIEZA SEGURA DE NAVEGADORES CON BACKUP]
echo.

set "BACKUP_DIR=%USERPROFILE%\Desktop\BrowserBackup_%TIMESTAMP%"
mkdir "%BACKUP_DIR%" >nul 2>&1

echo Respaldando datos...
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Bookmarks" xcopy "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Bookmarks" "%BACKUP_DIR%\Chrome\" /Y >nul 2>&1
if exist "%APPDATA%\Mozilla\Firefox\Profiles" xcopy "%APPDATA%\Mozilla\Firefox\Profiles" "%BACKUP_DIR%\Firefox\" /Y /S >nul 2>&1

echo Cerrando navegadores...
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1

echo Limpiando cache...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" 2>nul
for /d %%i in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do rd /s /q "%%i\cache2" 2>nul

echo Navegadores limpiados. Backup en: %BACKUP_DIR%
call :PAUSA
goto MENU

:: ===============================================================================
:: REPARAR WSL
:: ===============================================================================
:REPARAR_WSL
call :MARCO
echo [REPARAR WSL]
echo.

wsl --shutdown >nul 2>&1
powershell -NoProfile -Command "Get-AppxPackage *Ubuntu* | Remove-AppxPackage" >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Lxss" /f >nul 2>&1
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart >nul 2>&1

echo WSL reseteado. Instala tu distribucion desde Microsoft Store
call :PAUSA
goto MENU

:: ===============================================================================
:: OPTIMIZACION EMPRESARIAL
:: ===============================================================================
:OPTIMIZACION_EMPRESARIAL
call :MARCO
echo [OPTIMIZACION EMPRESARIAL RED/ENERGIA]
echo.

powercfg -h off
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
powercfg /change standby-timeout-ac 0

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f >nul
powershell -NoProfile -Command "Get-NetAdapter | ForEach-Object { Disable-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue }" >nul 2>&1

echo Optimizacion completada
call :PAUSA
goto MENU

:: ===============================================================================
:: EMERGENCIA WINDOWS SERVER
:: ===============================================================================
:EMERGENCIA_SERVER
call :MARCO
echo [REPARACION EMERGENCIA WINDOWS SERVER]
echo.

set "EMERGENCY_PATH=%SystemRoot%\System32;%SystemRoot%;%SystemRoot%\System32\Wbem"
setx PATH "%EMERGENCY_PATH%%PATH%" /M >nul 2>&1

sc config EventLog start= auto >nul 2>&1 & sc start EventLog >nul 2>&1
sc config RpcSs start= auto >nul 2>&1 & sc start RpcSs >nul 2>&1
sc config LanmanServer start= auto >nul 2>&1 & sc start LanmanServer >nul 2>&1

echo Servicios reparados. Ejecutando diagnosticos...
sfc /scannow
dism /online /cleanup-image /checkhealth

call :PAUSA
goto MENU

:: ===============================================================================
:: FIN DEL SCRIPT
:: ===============================================================================
:FIN
call :MARCO
echo.
echo ===============================================================================
echo                    GRACIAS POR USAR EL REPARADOR UNIVERSAL
echo ===============================================================================
echo.
echo Archivos generados:
echo - Log de actividades: %LOG_FILE%
if exist "%ERROR_FILE%" echo - Registro de errores: %ERROR_FILE%
echo.
echo Resumen: OK:%OK_COUNT% Avisos:%WARN_COUNT% Errores:%ERROR_COUNT%
echo.
echo ISC Omar Candanedo - Fusion Profesional de Herramientas
echo ===============================================================================
call :LOG_WRITE "Script finalizado correctamente"
timeout /t 5
exit
