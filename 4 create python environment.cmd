REM // Modify PATH
REM ===============================
set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%


REM // Check if all variables were set
REM ==================================
call "files\functions.cmd" checkvars
pause


REM // Run main command
REM ===========================
conda env create -f "envs\%pyenv%\%pyver%.yml"
pause
