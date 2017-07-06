set here=%~dp0
set thispath=%here:~0,-1%

set pyscript=__pyscript

@REM  import %pyfolder%, %pyenv%, %pyver% and run 'env.cmd'
call "%thispath%\config\config.cmd"
IF exist "%thispath%\config\env.cmd" (
	call "%thispath%\config\env.cmd"
)

set PYTHONPATH=%thispath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%

cd /d %thispath%\apps
@REM  run 'cmd "/c activate %pyenv%_%pyver% && python %pyscript% && deactivate"' minimized:
start "Miniconda" /min "%thispath%\config\start.cmd" %*
