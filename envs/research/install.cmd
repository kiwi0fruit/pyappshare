cmd "/c conda list"
@pause

@REM  R:
cmd "/c conda install --force -c r rpy2"

@REM  =========================================================

@REM  update setuptools:
cmd "/c conda remove --force setuptools"
pip install --ignore-installed setuptools

@REM  check pip dependencies:
cd /d "%envcache%"
rmdir pip /s /q
cmd "/c conda list"
pip download -d "%envcache%\pip" opencv_python knotr tensorflow
@pause

@REM  post-update:
@REM  cmd "/c conda install -c conda-forge protobuf=3.3.0 entrypoints=0.2.3 markupsafe=1.0"
