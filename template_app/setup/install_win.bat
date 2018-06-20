cd /d %UserProfile%\Miniconda3\Scripts

set "CurrentDir=%cd%"
set "PATH=%PATH%;%CurrentDir%"

set "ScriptDir=%~dp0"
cd /d %ScriptDir%

set PYTHONNOUSERSITE=1
conda env create --file env_win.yaml
