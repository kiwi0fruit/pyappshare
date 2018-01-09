::# Set some vars
::# ==============================
set here=%~dp0
set thispath=%here:~0,-1%

set funcs=%thispath%\files\functions.cmd

::# Output app folder:
call "%funcs%" setpybit
set workdir=%pyout%\%pyapp%-%pybit%bit-%pyver%

::# This time envpath is in output folder!
set envpath=%workdir%\%pyfolder%\envs\%pyenv%_%pyver%

set LicenseFolder=License and Info


::# Modify copied python: uninstall mkl, mingwpy & write packages list
::# ================================================================
set PYTHONPATH=%workdir%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%

call activate %pyenv%_%pyver%
pip uninstall mingwpy
call conda remove --force mkl
cd /d "%workdir%\%LicenseFolder%"
call conda env export -n %pyenv%_%pyver% -f PackagesList.txt
call deactivate

@pause
