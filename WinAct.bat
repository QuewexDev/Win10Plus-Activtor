@echo off
color 8f

echo Win10+ Activator

for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID"') do (
    set "id=%%a"
)

for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuild"') do set Build=%%a

if %Build% GEQ 10240 (
    echo System is supported for activation
) else (
    goto err
)

cscript //B "%windir%\system32\slmgr.vbs" /skms kms.digiboy.ir

if "%id%"=="Professional" set "key=W269N-WFGWX-YVC9B-4J6C9-T83GX"
if "%id%"=="ProfessionalWorkstation" set "key=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J"
if "%id%"=="Education" set "key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
if "%id%"=="ProfessionalEducation" set "key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
if "%id%"=="Enterprise" set "key=NPPR9-FWDCX-D2C8J-H872K-2YT43"
if not defined key goto err

cscript //B "%windir%\system32\slmgr.vbs" /ipk %key%
cscript //B "%windir%\system32\slmgr.vbs" /ato
goto end

:err
color 4f
echo Sorry! But your system is not supported for the batch activation! Press any key to exit...
pause > nul
exit

:end
color 2f
echo Activation process completed. Press any key to exit...
pause > nul
exit
