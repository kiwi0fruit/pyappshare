@REM  vars:
set tensorflow=tensorflow-1.2.1-cp36-cp36m-win_amd64.whl
set pkgs=opencv_python knotr %tensorflow%

@REM  conda post-update:
cmd "/c conda remove --force markdown"
@REM  cmd "/c conda install -c conda-forge thepackage=1.0"

@REM  check pip dependencies:
call "%funcs%" pipResolve "%pkgs%"
@pause

@REM  opencv:
pip install opencv_python
@pause

@REM  stitch:
pip install git+%EnvCacheURL%/stitch#egg=knotr
@pause
    @REM  git+https://github.com/kiwi0fruit/stitch.git#egg=knotr

@REM  tensorflow:
pip install "%envcache%\%tensorflow%"
