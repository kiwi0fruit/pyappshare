call "%thispath%\config\config.cmd"
IF exist "%thispath%\config\env.cmd" (
	call "%thispath%\config\env.cmd"
)
cd /d %thispath%\%pyfolder%\envs\%pyenv%_%pyver%
python "%thispath%\apps\%pyscript%"