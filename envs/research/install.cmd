cmd "/c conda list"
pause

REM  update for tensorflow:
cmd "/c conda install -c conda-forge html5lib"

REM  R:
cmd "/c conda install --force -c r rpy2"


REM conda above
REM ===============================================
REM pip below


REM check pip dependencies:
cmd "/c conda list"
pip download -d "%envcache%\pip" opencv_python knotr tensorflow
pause

REM  opencv:
pip install opencv_python

REM  stitch:
pip install git+%EnvCacheURL%/stitch#egg=knotr
REM  pip install git+https://github.com/kiwi0fruit/stitch.git#egg=knotr

REM  tensorflow - last because of setuptools update:
cmd "/c conda remove --force setuptools"
pip install --ignore-installed --upgrade setuptools
pip install tensorflow
pause
pip uninstall setuptools
cmd "/c conda install --force setuptools"
