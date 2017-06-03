set here=%~dp0
set thispath=%here:~0,-1%
call "%thispath%\config\config.cmd"
call "%thispath%\config\mkl.cmd"

set PYTHONPATH=%thispath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%

cd /d %thispath%\%pyfolder%\Scripts
cmd "/c activate %pyenv%_%pyver% && conda remove --force --yes mkl && deactivate"
conda clean --packages --yes
set targetfile=%thispath%\%pyfolder%\pkgs\%mklfile%
IF exist "%targetfile%" del /q "%targetfile%"

pause
