set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PATH%;%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;

set here=%~dp0
set thispath=%here:~0,-1%
set funcs=%thispath%\files\functions.cmd


call "%funcs%" checkvars
pause


conda env create -f "%thispath%\envs\%pyenv%\%pyver%.yml"
pause