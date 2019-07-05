@echo off
set "here=%~dp0"
set exi=call "%here%\setup\exi.bat"
set run=call "%here%\setup\path-run.bat"
set call=call "%here%\setup\path-call.bat"

:: <custom vars>
call "%here%\env\pre.bat" || %exi%
:: </custom vars>


:: <miniconda path confirmation>
set "prefix=%UserProfile%\Miniconda3"
If not exist "%prefix%\Scripts\conda.exe" goto no
:ask
echo:
echo Is Miniconda/Anaconda installed to "%prefix%"? (yes/no)
set INPUT=
set /P INPUT=Type 'y' or 'n': %=%
if /I "%INPUT%"=="y" goto yes
if /I "%INPUT%"=="n" goto no
echo Please type 'y' or 'n' only
goto ask
:no
echo:
echo Please type the path to Miniconda/Anaconda folder.
echo (you can drag'n'drop or paste it right here)
set /P prefix=Type the path (or 'x' to exit): %=%
set "conda=%prefix%\Scripts\conda.exe"
if exist "%conda%" goto ask
if "%prefix%" == "x" goto exit
echo "%conda%" was not found!
goto no
:yes

set "_cnd=%conda%"
:: </miniconda path confirmation>


cd /d "%here%\env" || %exi%
set PYTHONNOUSERSITE=1
set "PATH=%prefix%\Scripts;%prefix%\condabin;%PATH%"

%call% activate.bat base || %exi%
"%prefix%\python.exe" "%here%\setup\clear_global_channels.py" "%_cnd%" || %exi%

%run% conda.exe remove -n "%env%" --all || %exi%
%run% conda.exe env remove --name "%env%" || %exi%
%run% conda.exe update conda || %exi%
%run% conda.exe env create --file "%here%\env\%yaml%" || %exi%

%call% conda.bat deactivate || %exi%
%call% activate.bat "%env%" || %exi%


:: <custom commands after activate>
cd /d "%here%\env" || %exi%
call "%here%\env\post.bat" || %exi%
:: </custom commands after activate>

%call% conda.bat deactivate
pause
:exit
