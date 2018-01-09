::# Modify PATH
::# ==================================
set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%


::# Check if all variables were set
::# ==================================
call "files\functions.cmd" checkvars


::# Run main command
::# ==================================
conda env create -f "envs\%pyenv%\%pyver%.yml"

@pause
