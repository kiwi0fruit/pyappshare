call:%*
@exit/b


REM  Copy file with hash (or git diff) validation
REM  ============================================================
REM  Copy the file only: if we know that there should be no such file
REM  OR if hash of the file to replace matches the hash given
REM  Input: (1) folder to copy from (that will be prepended with 'PPA\files\'),
REM  (2) destination folder (that will be prepended with path to python environment)
REM  (3) target file name.
REM  For proper work function needs unpatched file samples in the folder to copy from.
REM  Their names should be prepended with __original__ or __original_ID__
REM  (4) first ID, (5) second ID, (4/5/6) if the last option is 'nofile' then copy if there is no such file
REM  Function also uses environment variables: (1) hash, (2) hash2, (3) envpath, (4) thispath.

:hashcopy
set fromdir=%~1
set todir=%~2
set target=%~3

set "nofileTrue="
IF "%4"=="nofile" set nofileTrue=1
IF "%5"=="nofile" set nofileTrue=1
IF "%6"=="nofile" set nofileTrue=1

set "False="
IF "%4"=="" set False=1
IF "%4"=="nofile" set False=1
IF defined False (
	set hashfile=__original__%target%
) ELSE (
	set prepID=%~4
	set hashfile=__original_%prepID%__%target%
)

set "False="
IF "%5"=="" set False=1
IF "%5"=="nofile" set False=1
IF defined False (
	set hashfile2=__original__%target%
) ELSE (
	set prepID=%~5
	set hashfile2=__original_%prepID%__%target%
)

set hashtarget=%thispath%\files\%fromdir%\%hashfile%
set hash=1
set command=PowerShell -C "$($(CertUtil -hashfile '%hashtarget%' SHA256)[1] -replace ' ','')"
FOR /F "delims=" %%i IN ('%command%') DO set hash=%%i
IF not exist "%hashtarget%" set hash=1


set hashtarget=%thispath%\files\%fromdir%\%hashfile2%
set hash2=1
set command=PowerShell -C "$($(CertUtil -hashfile '%hashtarget%' SHA256)[1] -replace ' ','')"
FOR /F "delims=" %%i IN ('%command%') DO set hash2=%%i
IF not exist "%hashtarget%" set hash2=1
IF "%hashfile%"=="%hashfile2%" set hash2=1

set hashtarget=%envpath%\%todir%\%target%
set targethash=0
set command=PowerShell -C "$($(CertUtil -hashfile '%hashtarget%' SHA256)[1] -replace ' ','')"
FOR /F "delims=" %%i IN ('%command%') DO set targethash=%%i
IF not exist "%hashtarget%" set targethash=0

set hashtarget=%thispath%\files\%fromdir%\%target%
set patchedhash=0
set command=PowerShell -C "$($(CertUtil -hashfile '%hashtarget%' SHA256)[1] -replace ' ','')"
FOR /F "delims=" %%i IN ('%command%') DO set patchedhash=%%i
IF not exist "%hashtarget%" set patchedhash=0

set "True="
IF defined nofileTrue IF not exist "%envpath%\%todir%\%target%" set True=1
IF /i %targethash%==%hash% set True=1
IF /i %targethash%==%hash2% set True=1
IF defined True (
	robocopy "%thispath%\files\%fromdir%" "%envpath%\%todir%" "%target%"
	powershell write-host -foregroundcolor Green "Patch was applied."
) ELSE IF /i %targethash%==%patchedhash% (
	powershell write-host -foregroundcolor Yellow "Patch has been already applied."
) ELSE (
	powershell write-host -foregroundcolor Red "Hash does not match. Patch was not applied."
)

@exit/b


:gitdiffcopy
set fromdir=%~1
set todir=%~2
set target=%~3

set "nofileTrue="
IF "%4"=="nofile" set nofileTrue=1
IF "%5"=="nofile" set nofileTrue=1
IF "%6"=="nofile" set nofileTrue=1

set "False="
IF "%4"=="" set False=1
IF "%4"=="nofile" set False=1
IF defined False (
	set hashfile=__original__%target%
) ELSE (
	set prepID=%~4
	set hashfile=__original_%prepID%__%target%
)

set "False="
IF "%5"=="" set False=1
IF "%5"=="nofile" set False=1
IF defined False (
	set hashfile2=__original__%target%
) ELSE (
	set prepID=%~5
	set hashfile2=__original_%prepID%__%target%
)

set maintarget=%envpath%\%todir%\%target%

set filetarget=%thispath%\files\%fromdir%\%hashfile%
git diff "%filetarget%" "%maintarget%" > tmp.diff
set diff=1
IF exist tmp.diff for %%a in ("tmp.diff") do set diff=%%~za

set filetarget=%thispath%\files\%fromdir%\%hashfile2%
git diff "%filetarget%" "%maintarget%" > tmp.diff
set diff2=1
IF exist tmp.diff for %%a in ("tmp.diff") do set diff2=%%~za
IF "%hashfile%"=="%hashfile2%" set diff2=1

set filetarget=%thispath%\files\%fromdir%\%target%
git diff "%filetarget%" "%maintarget%" > tmp.diff
set patchDiff=1
IF exist tmp.diff for %%a in ("tmp.diff") do set patchDiff=%%~za

IF exist tmp.diff del tmp.diff

set "True="
IF defined nofileTrue IF not exist "%envpath%\%todir%\%target%" set True=1
IF /i %diff%==0 set True=1
IF /i %diff2%==0 set True=1
IF defined True (
	robocopy "%thispath%\files\%fromdir%" "%envpath%\%todir%" "%target%"
	powershell write-host -foregroundcolor Green "Patch was applied."
) ELSE IF /i %patchDiff%==0 (
	powershell write-host -foregroundcolor Yellow "Patch has been already applied."
) ELSE (
	powershell write-host -foregroundcolor Red "Hash does not match. Patch was not applied."
)

@exit/b


REM  Checks if needed environment variables were set to something
REM  ===============================================================
REM  Function uses environment variables: (1) pypath, (2) pyfolder, (3) pyver, (4) pycomp, (5) pyapp, (6) pyout.

:checkvars
@set "False="
@IF "%pypath%"=="" set False=1
@IF "%pyfolder%"=="" set False=1
@IF "%pyver%"=="" set False=1
@IF "%pyenv%"=="" set False=1
@If defined False (
	powershell write-host -foregroundcolor Red "pypath, pyfolder, pyver, pyenv variables were NOT set"
) ELSE (
	powershell write-host -foregroundcolor Green "pypath, pyfolder, pyver, pyenv, variables were set"
)
@IF "%pycomp%"=="" (
	powershell write-host -foregroundcolor Red "pycomp is not set"
)
@IF "%pyapp%"=="" (
	powershell write-host -foregroundcolor Red "pyapp is not set"
)
@IF "%pyout%"=="" (
	powershell write-host -foregroundcolor Red "pyout is not set"
)
@echo pypath=%pypath%
@echo pyfolder=%pyfolder%
@echo pyver=%pyver%
@echo pyenv=%pyenv%
@echo pyapp=%pyapp%
@echo pycomp=%pycomp%
@echo pyout=%pyout%
@echo press any key to continue script
@pause

@exit/b


REM  Set pybit from pyfolder
REM  ==========================
REM  Function uses environment variable (1) pyfolder and sets (2) pybit.

:setpybit
set LastTwo=%pyfolder:~-2%
IF %LastTwo%==64 (
	set pybit=64
) ELSE IF %LastTwo%==32 (
	set pybit=32
) ELSE (
	powershell write-host -foregroundcolor Red "Wrong pyfolder name: %pyfolder%. Should end with 32 or 64."
	pause
)

@exit/b


REM  Shows download instructions
REM  ==============================
REM  Input: (1) file description, (2) URL.
REM  Function uses environment variables: (1) pybit, (2) pyver, (3) pyenv, (4) pyver, (5) pyfolder.

:filedownload
set echotext=%~1
set url=%~2

echo %url% | clip
@powershell write-host -foregroundcolor Yellow "Download %echotext% for %pyver%-%pybit%bit`nto %pyfolder%\pkgs\envs\%pyenv%_%pyver%`nfrom URL that was copied to clipboard."
start .
pause

@exit/b


REM  Regular expressions replacements in a folder
REM  ============================================================
REM  Temporary replaces Notepad++ settings with custom 'config.xml' and 'session.xml'
REM  Edits python module target folder in this file. Displays instructions. Starts Notepad++.
REM  Assumes that Notepad++ settings are in %APPDATA%\Notepad++.
REM  Input: (1) folder with custom 'config.xml' (that will be prepended with 'PPA\files\'),
REM  (2) target folder where to replace (that will be prepended with path to python environment),
REM  (3) final message, (4) it's color.
REM  Function also uses environment variables: (1) thispath, (2) envpath.

:nppVarFolder
set fromfolder=%~1
set targetfolder=%~2
set color=%~3
set message=%~4

taskkill /im notepad++.exe
set notepadpp=%APPDATA%\Notepad++
robocopy "%notepadpp%" "%notepadpp%\__temp" session.xml config.xml
robocopy "%thispath%\files\%fromfolder%" "%notepadpp%" session.xml config.xml
powershell -Command "(Get-Content '%notepadpp%\config.xml') -replace 'nppRegExp_func_replace', '%envpath%\%targetfolder%' | Set-Content '%notepadpp%\config.xml'"
@powershell write-host -foregroundcolor Yellow "Do not close this window before closing Notepad++ window otherwize will you loose your Notepad++ settings."
@powershell write-host -foregroundcolor White "Press Ctrl+Shift+F and replace in all files"
@powershell write-host -foregroundcolor %color% "%message%"
"%programfiles(x86)%\Notepad++\notepad++.exe"
robocopy "%notepadpp%\__temp" "%notepadpp%" session.xml config.xml

@exit/b


REM  String replacements in a folder
REM  ============================================================
REM  Temporary replaces Notepad++ settings with custom 'config.xml' and 'session.xml'
REM  Edits python module target folder in this file. Displays instructions. Starts Notepad++.
REM  Assumes that Notepad++ settings are in %APPDATA%\Notepad++.
REM  Input: (1) folder with custom 'config.xml' (that will be prepended with 'PPA\files\'),
REM  (2) target folder where to replace (that will be prepended with path to OUTPUT python environment),
REM  (3) string to find, (4) final message, (5) it's color.
REM  Function also uses environment variables: (1) thispath, (2) envpath.

:nppVarFindConstReplace
set fromfolder=%~1
set targetfolder=%~2
set StrToFind=%~3
set color=%~4
set message=%~5

taskkill /im notepad++.exe
set notepadpp=%APPDATA%\Notepad++
robocopy "%notepadpp%" "%notepadpp%\__temp" session.xml config.xml
robocopy "%thispath%\files\%fromfolder%" "%notepadpp%" session.xml config.xml
powershell -Command "(Get-Content '%notepadpp%\config.xml') -replace 'nppStr_folder', '%envpath%\%targetfolder%' | Set-Content '%notepadpp%\config.xml'"
powershell -Command "(Get-Content '%notepadpp%\config.xml') -replace 'nppStr_find', '%StrToFind%' | Set-Content '%notepadpp%\config.xml'"
@powershell write-host -foregroundcolor Yellow "Do not close this window before closing Notepad++ window otherwize you will loose your Notepad++ settings."
@powershell write-host -foregroundcolor White "Press Ctrl+Shift+F and replace in all files"
@powershell write-host -foregroundcolor %color% "%message%"
"%programfiles(x86)%\Notepad++\notepad++.exe"
robocopy "%notepadpp%\__temp" "%notepadpp%" session.xml config.xml

@exit/b


:nppVarFindVarReplace
set fromfolder=%~1
set targetfolder=%~2
set StrToFind=%~3
set StrToReplace=%~4
set color=%~5
set message=%~6

taskkill /im notepad++.exe
set notepadpp=%APPDATA%\Notepad++
robocopy "%notepadpp%" "%notepadpp%\__temp" session.xml config.xml
robocopy "%thispath%\files\%fromfolder%" "%notepadpp%" session.xml config.xml
powershell -Command "(Get-Content '%notepadpp%\config.xml') -replace 'nppStr_folder', '%envpath%\%targetfolder%' | Set-Content '%notepadpp%\config.xml'"
powershell -Command "(Get-Content '%notepadpp%\config.xml') -replace 'nppStr_find', '%StrToFind%' | Set-Content '%notepadpp%\config.xml'"
powershell -Command "(Get-Content '%notepadpp%\config.xml') -replace 'nppStr_replace', '%StrToReplace%' | Set-Content '%notepadpp%\config.xml'"
@powershell write-host -foregroundcolor Yellow "Do not close this window before closing Notepad++ window otherwize you will loose your Notepad++ settings."
@powershell write-host -foregroundcolor White "Press Ctrl+Shift+F and replace in all files"
@powershell write-host -foregroundcolor %color% "%message%"
"%programfiles(x86)%\Notepad++\notepad++.exe"
robocopy "%notepadpp%\__temp" "%notepadpp%" session.xml config.xml

@exit/b


REM  Resolve pip-conda dependencies
REM  ============================================================
REM  Compares installed packages (from 'conda list') with packages that
REM  pip is going to install (from 'pip download thepackage').
REM  Prints output to command prompt and writes to file '%envcache%\diff_list.txt'
REM  Input: (1) whitespace separated list of packages.
REM  Function also uses environment variables: (1) thispath, (2) envcache.

:pipResolve
set pkgs=%~1
cd /d %envcache%
rmdir pip /s /q
cmd "/c conda list > conda_list.txt"
pip download -d pip %pkgs%
cd pip
dir /b /a-d > ..\pip_list.txt
cd ..
@powershell write-host -foregroundcolor White "List of pip-conda differences:"
python "%thispath%\files\pip_conda_diff.py"

@exit/b
