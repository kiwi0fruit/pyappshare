@echo off
set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%
set here=%~dp0
set thispath=%here:~0,-1%
set funcs=%thispath%\files\functions.cmd
set envcache=%pypath%\%pyfolder%\pkgs\envs\%pyenv%_%pyver%
call activate %pyenv%_%pyver%
call files\resolve_conda_pip.cmd
pause
