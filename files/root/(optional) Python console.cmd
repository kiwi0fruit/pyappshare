set here=%~dp0
set thispath=%here:~0,-1%

@REM  import %pyfolder%, %pyenv%, %pyver%
call "%thispath%\config\config.cmd"

set PYTHONPATH=%thispath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%


@echo When Conda uninstalles packages it does not delete files. It only unlinks them.
cmd /k "activate %pyenv%_%pyver%"
