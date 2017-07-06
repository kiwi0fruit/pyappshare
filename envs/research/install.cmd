@REM  vars:
set tensorflow=tensorflow-1.2.1-cp36-cp36m-win_amd64.whl
set pkgs=opencv_python knotr %tensorflow%

@REM  R:
cmd "/c conda install --force -c r rpy2"

@REM  check pip dependencies:
call "%funcs%" pipResolve "%pkgs%"
@pause
