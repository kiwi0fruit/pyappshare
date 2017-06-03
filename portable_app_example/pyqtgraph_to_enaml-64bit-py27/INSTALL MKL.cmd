set here=%~dp0
set thispath=%here:~0,-1%
call "%thispath%\config\config.cmd"
call "%thispath%\config\mkl.cmd"

set PYTHONPATH=%thispath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%

cd /d "%thispath%\%pyfolder%\Scripts"
cmd "/c activate %pyenv%_%pyver% && conda install --force --yes --offline %mklfile% && deactivate"

pause
