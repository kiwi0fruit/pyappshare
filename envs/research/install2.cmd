@REM  opencv:
pip install opencv_python
@pause

@REM  stitch:
pip install git+%EnvCacheURL%/stitch#egg=knotr
@REM  pip install git+https://github.com/kiwi0fruit/stitch.git#egg=knotr

@REM  tensorflow - last because of setuptools update:
pip install tensorflow
@pause

@REM  =========================================================

@REM  conda setuptools back:
pip uninstall setuptools
cmd "/c conda install --force setuptools"
