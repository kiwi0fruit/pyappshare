call "config\config.cmd"
IF exist "config\env.cmd" (
	call "config\env.cmd"
)
echo %pyfolder%\envs\%pyenv%_%pyver%
pause
cd /d %pyfolder%\envs\%pyenv%_%pyver%

python "%thispath%\apps\%pyscript%"
exit
