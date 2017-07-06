@REM  Some debug options
@REM  ====================================================
@REM  @echo off
@REM  Debug mode OFF/ON: 
set "debug="
@REM  set debug=pause
set debugecho=echo Read the log if needed and press any key to continue.
@REM  set "debugecho="

@REM  Modify PATH
@REM  ====================================================
set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%

@REM  Set some vars
@REM  ====================================================
set here=%~dp0
set thispath=%here:~0,-1%

set funcs=%thispath%\files\functions.cmd
set psfuncs=%thispath%\files\functions.psm1

@REM  Output app folder:
call "%funcs%" setpybit
set workdir=%pyout%\%pyapp%-%pybit%bit-%pyver%
@REM  This time envpath is in output folder!
set envpath=%workdir%\%pyfolder%\envs\%pyenv%_%pyver%

set LicenseFolder=License and Info

@REM  Check if all variables were set
@REM  ====================================================
call "%funcs%" checkvars

@REM  Delete some folders from app folder
@REM  ====================================================
set outdir=%workdir%\%LicenseFolder%
IF exist "%outdir%" rd /s /q "%outdir%"

IF exist "%workdir%\config" rd /s /q "%workdir%\config"
IF exist "%workdir%\apps" rd /s /q "%workdir%\apps"
IF exist "%workdir%\%pyfolder%\pkgs" rd /s /q "%workdir%\%pyfolder%\pkgs"

@REM  ====================================================
@%debugecho%
@%debug%

@REM  Copy root python and desired environment
@REM  ====================================================
@REM  Copy root python except 'envs' and 'pkgs' folders
robocopy "%pypath%\%pyfolder%" "%workdir%\%pyfolder%" /mir /xd "%pypath%\%pyfolder%\envs" "%pypath%\%pyfolder%\pkgs"
@REM  Copy desired environment only
robocopy "%pypath%\%pyfolder%\envs\%pyenv%_%pyver%" "%workdir%\%pyfolder%\envs\%pyenv%_%pyver%" /mir
@REM  Copy 'pkgs\cache' and 'pkgs\urls.txt'
robocopy "%pypath%\%pyfolder%\pkgs\cache" "%workdir%\%pyfolder%\pkgs\cache" /e
robocopy "%pypath%\%pyfolder%\pkgs" "%workdir%\%pyfolder%\pkgs" urls.txt
@REM  Copy all from 'PPA\files\root' folder except 'shortcut.cmd'
robocopy "%thispath%\files\root" "%workdir%" /e /xf "shortcut.cmd"
@REM  Copy 'PPA\envs\%pyenv%\config' folder. It should contain 'env.cmd' script if exists.
IF exist "%thispath%\envs\%pyenv%\config" (
	robocopy "%thispath%\envs\%pyenv%\config" "%workdir%\config" /e
)
@REM  Copy 'PPA\envs\%pyenv%\license' folder
IF exist "%thispath%\envs\%pyenv%\license" (
	robocopy "%thispath%\envs\%pyenv%\license" "%workdir%\%LicenseFolder%" /e
)

@REM  ====================================================
@%debugecho%
@%debug%

@REM  Create shortcuts
@REM  ====================================================
@REM  Copy all from 'PPA\apps\%pyapp%' except 'shortcuts.ps1'
robocopy "%thispath%\apps\%pyapp%" "%workdir%" /e /xf "shortcuts.ps1"
@REM  Run 'shortcuts.ps1' that create a shortcut in %workdir%.
powershell -executionpolicy remotesigned -File  "%thispath%\apps\%pyapp%\shortcuts.ps1"
@REM  'shortcuts.ps1' is UTF-8 file it imports 'shortcut' function from 'functions.psm1'
@REM  this function creates .cmd shortcuts with UFT-8 names
@REM  It uses 'PPA\files\shortcut\shortcut.cmd' as a template
@REM  Function input: 1) shortcut UTF-8 name, 2) path to the python script (that would be prepended with 'apps\') 

@REM  Copy MKL .tar.bz2
@REM  ====================================================
set pypkgs=%workdir%\%pyfolder%\pkgs
IF exist "%pypkgs%\temp0" rd /s /q "%pypkgs%\temp0"
IF exist "%pypkgs%\temp" rd /s /q "%pypkgs%\temp"
mkdir "%pypkgs%\temp0"
mkdir "%pypkgs%\temp"

robocopy "%pypath%\%pyfolder%\pkgs" "%pypkgs%\temp0" mkl-0*.tar.bz2 mkl-1*.tar.bz2 mkl-2*.tar.bz2 mkl-3*.tar.bz2 mkl-4*.tar.bz2 mkl-5*.tar.bz2 mkl-6*.tar.bz2 mkl-7*.tar.bz2 mkl-8*.tar.bz2 mkl-9*.tar.bz2 /xd *
powershell -Command "gci '%pypkgs%\temp0' | select -last 1 | move-item -Destination '%pypkgs%\temp' -force"

cd /d "%pypkgs%\temp"
dir /B mkl*.tar.bz2 > 1.txt
for /f "tokens=* delims= " %%a in (1.txt) do (
	set mklfile=%%a
)
@REM  MKL file is copied to the 'Scripts' folder. If 'cd' to Scripts then when calling 'conda install' with filename only would be enough.
@REM  Not sure if 'Scripts' folder is special but let it be...
move "%pypkgs%\temp\%mklfile%" "%workdir%\%pyfolder%\Scripts"
IF exist "%pypkgs%\temp0" rd /s /q "%pypkgs%\temp0"
IF exist "%pypkgs%\temp" rd /s /q "%pypkgs%\temp"

@REM  ====================================================
@%debugecho%
@%debug%

@REM  Set app configs
@REM  ====================================================
set targetpath=%workdir%\config\config.cmd
powershell -Command "(Get-Content '%targetpath%') -replace '__pyfolder', '%pyfolder%' | Set-Content '%targetpath%'"
powershell -Command "(Get-Content '%targetpath%') -replace '__pyenv', '%pyenv%' | Set-Content '%targetpath%'"
powershell -Command "(Get-Content '%targetpath%') -replace '__pyver', '%pyver%' | Set-Content '%targetpath%'"
set targetpath=%workdir%\config\mkl.cmd
powershell -Command "(Get-Content '%targetpath%') -replace '__mklfile', '%mklfile%' | Set-Content '%targetpath%'"

@REM  Replace absolute paths with variable %PYTHONPATH%
@REM  ====================================================
@echo off
call "%funcs%" nppVarFindConstReplace  npp_abs_paths\to_pythonpath  Scripts  "%PYTHONPATH%"  Yellow  "Replace absolute paths with variable PYTHONPATH in batch scripts only. So search first."
call "%funcs%" nppVarFindVarReplace    npp_abs_paths\to_new_ones  conda-meta  "%PYTHONPATH%"  "%workdir%\%pyfolder%"  Yellow  "Replace old absolute paths with new ones. Search first."
@REM  For some reason conda creates environment files with absolute paths.


@pause
