set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PATH%;%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;

set here=%~dp0
set thispath=%here:~0,-1%
set funcs=%thispath%\files\functions.cmd


call "%funcs%" checkvars
pause


set envcache=%pypath%\%pyfolder%\pkgs\envs\%pyenv%_%pyver%
mkdir "%envcache%"

cd /d %thispath%\envs\%pyenv%
cmd "/c activate %pyenv%_%pyver% && download.cmd && deactivate"
pause
