set here=%~dp0
set thispath=%here:~0,-1%
call "%thispath%\config\config.cmd"

set PYTHONPATH=%thispath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%

cd /d %thispath%\%pyfolder%\Scripts

echo I'm not sure whether Conda uninstalls packages correctly. I don't know whether Conda deletes files or only unlinks them.
cmd /k "activate %pyenv%_%pyver%"
