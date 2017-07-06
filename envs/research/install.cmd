cmd "/c conda list"
@pause

@REM  R:
cmd "/c conda install --force -c r rpy2"

@REM  tensorflow:
cmd "/c conda remove --force markdown"

@REM  =========================================================

@REM  update setuptools:
cmd "/c conda remove --force setuptools"
pip install --ignore-installed setuptools

@REM  post-update:
@REM  cmd "/c conda install -c conda-forge protobuf=3.3.0 entrypoints=0.2.3 markupsafe=1.0"
