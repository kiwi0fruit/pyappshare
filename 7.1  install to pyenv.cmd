REM  @echo off
REM  Modify PATH
REM  ========================================
set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%


REM  Set vars that are needed for 'PPA\envs\%pyenv%\install.cmd':
REM  ========================================
REM  'install.cmd' can use any function from 'functions.cmd'
REM  So all env vars that may be used by functions are set:
set here=%~dp0
set thispath=%here:~0,-1%
set envpath=%pypath%\%pyfolder%\envs\%pyenv%_%pyver%
set funcs=%thispath%\files\functions.cmd
set envcache=%pypath%\%pyfolder%\pkgs\envs\%pyenv%_%pyver%
call "%funcs%" setpybit

set pyverMajor=%pyver:~0,3%
set "py35plus="
IF %pyverMajor%==py3 IF not %pyver%==py30 IF not %pyver%==py31 IF not %pyver%==py32 IF not %pyver%==py33 IF not %pyver%==py34 (
	set py35plus=1
)


REM  Check if all variables were set
REM  ========================================
call "%funcs%" checkvars
pause


REM  Convert path to url: replace \ with /
REM  ========================================
REM  'PPA\envs\%pyenv%\install.cmd' needs %URLpath%
setlocal disableDelayedExpansion
set "URLpath=file:///%envcache%"
setlocal enableDelayedExpansion
set "URLpath=!URLpath:\=/!"
set "URLpath=!URLpath: =%%20!"
echo !URLpath!>__temp__.txt
endlocal
endlocal
set /p EnvCacheURL=<__temp__.txt
del __temp__.txt


REM  Run main script
REM  ========================================
REM  'cd' so we can use simply 'install.cmd'
cd /d "envs\%pyenv%"


REM  activate %pyenv%_%pyver%
REM  install.cmd
cmd "/c activate %pyenv%_%pyver% && install.cmd"

pause
