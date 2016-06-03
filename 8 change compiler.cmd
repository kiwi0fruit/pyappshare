set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PATH%;%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;

set here=%~dp0
set thispath=%here:~0,-1%


set funcs=%thispath%\files\functions.cmd
:: needed for functions.cmd:
set envpath=%pypath%\%pyfolder%\envs\%pyenv%_%pyver%
set hash=0
set hash2=0
set hashA=0
:: hashA: hash after


IF %pyver%==py27 (
	:: hash: msvc, hash2: mingwpy
	set hash=ac67b06633f20e36b3255263c1e1977ae5eecb4fffbec2d42c3ba70cf4696051
	set hash2=8cd72164a78c9fc7a2c0d969ca14881510d9422831bda5d23fbdc2192784d6e6
	call "%funcs%" hashcopy compiler\%pycomp% Lib\distutils distutils.cfg nofile
)

pause
