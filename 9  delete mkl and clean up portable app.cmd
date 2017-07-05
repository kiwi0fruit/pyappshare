REM // Set some vars
REM ==============================
set here=%~dp0
set thispath=%here:~0,-1%

set funcs=%thispath%\files\functions.cmd

REM // Output app folder:
call "%funcs%" setpybit
set workdir=%pyout%\%pyapp%-%pybit%bit-%pyver%
REM // This time envpath is in output folder!
set envpath=%workdir%\%pyfolder%\envs\%pyenv%_%pyver%

set LicenseFolder=License and Info



REM // Modify copied python: uninstall mkl, mingwpy & write packages list
REM ================================================================
set PYTHONPATH=%workdir%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%

cmd "/c activate %pyenv%_%pyver% && pip uninstall mingwpy && deactivate"
cmd "/c activate %pyenv%_%pyver% && conda remove --force mkl && deactivate"

cd /d "%workdir%\%LicenseFolder%"
cmd "/c activate %pyenv%_%pyver% && conda env export -n %pyenv%_%pyver% -f PackagesList.txt && deactivate"

pause
