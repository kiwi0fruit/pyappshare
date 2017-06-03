set here=%~dp0
set thispath=%here:~0,-1%

REM // import %pyfolder%, %pyenv%, %pyver% and %mklfile%
call "%thispath%\config\config.cmd"
call "%thispath%\config\mkl.cmd"

set PYTHONPATH=%thispath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%


REM // MKL file was copied to the 'Scripts' folder. If 'cd' to Scripts then when calling 'conda install' with filename only would be enough.
REM // Not sure if 'Scripts' folder is special but let it be...
cd /d "%thispath%\%pyfolder%\Scripts"
cmd "/c activate %pyenv%_%pyver% && conda install --force --yes --offline %mklfile% && deactivate"

pause
