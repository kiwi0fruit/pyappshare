cd /d %UserProfile%\Miniconda3\Scripts

set "current_dir=%cd%"
set "PATH=%PATH%;%current_dir%"

set "script_dir=%~dp0"
cd /d %script_dir%

set PYTHONNOUSERSITE=1
conda env create --file env_win.yaml

:: do not specify custom -p/--prefix path
:: this might make shortcut creation fail
pause
