set here=%~dp0
set thispath=%here:~0,-1%
call "%thispath%\config\config.cmd"

set mklfile=mkl-11.3.3-1.tar.bz2

set PYTHONPATH=%thispath%\%pyfolder%
set PATH=%PATH%;%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;

cd /d %thispath%\%pyfolder%\Scripts
cmd "/c activate %pyenv%_%pyver% && conda install --force --yes --offline %mklfile% && deactivate"

pause

