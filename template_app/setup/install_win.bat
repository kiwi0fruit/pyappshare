@echo off
set "miniconda_dir=%UserProfile%\Miniconda3"


If not exist "%miniconda_dir%\python.exe" goto no
:ask
echo Is Miniconda installed to "%miniconda_dir%"?
set INPUT=
set /P INPUT=(yes/no) Type 'y' or 'n': %=%
If /I "%INPUT%"=="y" goto yes
If /I "%INPUT%"=="n" goto no
echo Please type 'y' or 'n' only
goto ask
:no
echo Please type the path to Miniconda folder.
echo (you can drag'n'drop or paste it right here)
set /P miniconda_dir=Type the path: %=%
If EXIST "%miniconda_dir%\python.exe" goto ask
echo "%miniconda_dir%\python.exe" was not found!
goto no
:yes


set "setup_dir=%~dp0"
cd /d %setup_dir%

set PYTHONNOUSERSITE=1
"%miniconda_dir%\Scripts\conda.exe" env create --file env_win.yaml
pause

:: Do not specify custom -p/--prefix path
:: this might make shortcut creation fail.
:: If you need so specify custim prefix
:: first add %miniconda_dir%\Scripts to the PATH.
