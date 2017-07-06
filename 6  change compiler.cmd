@REM  @echo off
@REM  Modify PATH
@REM  ====================================
set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%


@REM  Set vars that are needed for 'hashcopy' function:
@REM  ====================================
set here=%~dp0
set thispath=%here:~0,-1%
set envpath=%pypath%\%pyfolder%\envs\%pyenv%_%pyver%
set funcs=%thispath%\files\functions.cmd


@REM  Check if all variables were set
@REM  ====================================
call "%funcs%" checkvars
pause


@REM  Change compiler settings (hash: msvc, hash2: mingwpy)
@REM  ====================================
call "%funcs%" gitdiffcopy compiler\%pycomp% Lib\distutils distutils.cfg nofile
pause
