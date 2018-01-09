@echo off
set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%
cd /d "%USERPROFILE%"

call conda env remove --name %pyenv%_%pyver%
pause
