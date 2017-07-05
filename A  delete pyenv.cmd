@echo off
set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%
cd /d "%USERPROFILE%"

conda env remove --name %pyenv%_%pyver%
pause
