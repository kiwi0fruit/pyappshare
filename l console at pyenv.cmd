set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%

cd /d "%USERPROFILE%"
cmd /k "activate %pyenv%_%pyver% && cmd /k"
