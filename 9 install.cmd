set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PATH%;%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;

set here=%~dp0
set thispath=%here:~0,-1%
set funcs=%thispath%\files\functions.cmd


call "%funcs%" checkvars
pause


set envcache=%pypath%\%pyfolder%\pkgs\envs\%pyenv%_%pyver%


:: convert path to url:
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


:: needed for functions.cmd:
set envpath=%pypath%\%pyfolder%\envs\%pyenv%_%pyver%
set hash=0
set hash2=0
:: hashA: hash after

cd /d %thispath%\envs\%pyenv%_%pyver%
cmd "/c activate %pyenv%_%pyver% && install.cmd && deactivate"
pause
