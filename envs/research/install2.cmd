set tensorflow=tensorflow-1.2.1-cp36-cp36m-win_amd64.whl

@REM  check pip dependencies:
cd /d "%envcache%"
rmdir pip /s /q
cmd "/c conda list > conda_list.txt"
pip download -d pip opencv_python knotr %tensorflow%
cd pip
dir /b /a-d > ..\pip_list.txt
cd ..
@pause

@REM  opencv:
pip install opencv_python
@pause

@REM  stitch:
pip install git+%EnvCacheURL%/stitch#egg=knotr
@REM  pip install git+https://github.com/kiwi0fruit/stitch.git#egg=knotr

@REM  tensorflow - last because of setuptools update:
pip install "%envcache%\%tensorflow%"
