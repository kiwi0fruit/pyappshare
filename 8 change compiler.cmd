set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PATH%;%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;

set here=%~dp0
set thispath=%here:~0,-1%
set funcs=%thispath%\files\functions.cmd


call "%funcs%" checkvars
pause


:: needed for functions.cmd:
set envpath=%pypath%\%pyfolder%\envs\%pyenv%_%pyver%
set hash=0
set hash2=0
:: hashA: hash after


IF %pyver%==py27 (
	:: hash: msvc, hash2: mingwpy
	set hash=71113d631ff265080cb60e4b1e683bfbad7e93aebb84f654d4c92f34d5b5a424
	set hash2=88607dc72aa8f66d6342bd38fe28606f9c0ff9fb8fbe27987807bfa9dfd5c01d
	call "%funcs%" hashcopy compiler\%pycomp% Lib\distutils distutils.cfg nofile
)

pause
