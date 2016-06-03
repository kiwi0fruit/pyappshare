call:%*
exit/b


:hashcopy
set fromdir=%~1
set todir=%~2
set target=%~3

set command=PowerShell -C "$($(CertUtil -hashfile '%envpath%\%todir%\%target%' SHA256)[1] -replace ' ','')"
set targethash=O
IF exist "%envpath%\%todir%\%target%" (
	FOR /F "delims=" %%i IN ('%command%') DO set targethash=%%i
)

set "True="
IF "%4"=="nofile" IF not exist "%envpath%\%todir%\%target%" set True=1
IF %targethash%==%hash% set True=1
IF %targethash%==%hash2% set True=1
IF defined True (
	robocopy "%thispath%\files\%fromdir%" "%envpath%\%todir%" "%target%"
	Powershell write-host -foregroundcolor Green "Patch was applied."
) ELSE IF %targethash%==%hashA% (
	Powershell write-host -foregroundcolor Yellow "Patch has been already applied."
) ELSE (
	Powershell write-host -foregroundcolor Red "WARNING! Hash does not match. Patch was not applied."
)
set hash=0
set hash2=0
set hashA=0
exit/b


:shortcut
set pyname=%~1
set pyscript=%~2

robocopy "%thispath%\files\shortcut" "%workdir%"
set targetpath=%workdir%\shortcut.cmd
powershell -Command "(Get-Content '%targetpath%') -replace '__pyscript', '%pyscript%' | Set-Content '%targetpath%'"
cd /d "%workdir%"
IF exist "%pyname%.cmd" (
	del "%pyname%.cmd"
)
rename shortcut.cmd "%pyname%.cmd"

exit/b


:notepadppRegExp
set fromfolder=%~1
set targetfolder=%~2
set message=%~3

taskkill /im notepad++.exe
set notepadpp=%APPDATA%\Notepad++
robocopy "%notepadpp%" "%notepadpp%\__temp" session.xml config.xml
robocopy "%thispath%\files\%fromfolder%" "%notepadpp%" config.xml
robocopy "%thispath%\files\notepadpp" "%notepadpp%" session.xml
powershell -Command "(Get-Content '%notepadpp%\config.xml') -replace 'CustomPathToPythonSitePackages', '%pypath%\%pyfolder%\envs\%pyenv%_%pyver%\%targetfolder%' | Set-Content '%notepadpp%\config.xml'"
Powershell write-host -foregroundcolor Red "Do not close this window before closing Notepad++ window"
Powershell write-host -foregroundcolor Green "Press Ctrl+Shift+F"
Powershell write-host -foregroundcolor Yellow "%message%"
"%programfiles(x86)%\Notepad++\notepad++.exe"
robocopy "%notepadpp%\__temp" "%notepadpp%" session.xml config.xml

exit/b


:checkvars
IF not "%pypath%"=="" IF not "%pyfolder%"=="" IF not "%pyver%"=="" IF not "%pyenv%"=="" IF not "%pyapp%"=="" (
	Powershell write-host -foregroundcolor Green "All variables were set"
)

Powershell write-host -foregroundcolor Yellow "If you do not see the green message above then something went wrong"
IF "%pycomp%"=="" (
	Powershell write-host -foregroundcolor Red "pycomp is not set"
)
echo press any key to continue script

exit/b