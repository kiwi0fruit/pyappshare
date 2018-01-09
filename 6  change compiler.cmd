::@echo off
::# Modify PATH
::# ====================================
set PYTHONPATH=%pypath%\%pyfolder%
set PATH=%PYTHONPATH%;%PYTHONPATH%\Scripts;%PYTHONPATH%\Library\bin;%PATH%


::# Set vars that are needed for 'hashcopy'/'gitdiffcopy' functions:
::# ====================================
set here=%~dp0
set thispath=%here:~0,-1%
set envpath=%pypath%\%pyfolder%\envs\%pyenv%_%pyver%
set funcs=%thispath%\files\functions.cmd


::# Check if all variables were set
::# ====================================
call "%funcs%" checkvars


::# Change compiler settings
::# ====================================
call "%funcs%" gitdiffcopy compiler\%pycomp% Lib\distutils distutils.cfg nofile

@pause
