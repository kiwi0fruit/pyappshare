@REM  conda install
@REM  ===============================================
@REM  @echo off
@REM  you can use: 'IF defined py35plus' (>=3.5)
@REM  or: 'IF %pyverMajor%==py3' (>=3.0)

@REM  See Matplotlib version
@REM  ===============================================
cmd "/c conda list"
@pause

@REM  --copy install: pyqtgraph qtpy matplotlib enaml
@REM  ===============================================
@REM  Hint: patch only packages that were installed with --copy parameter
@REM  Conda by default links packages but not copies them. So when patching
@REM  such packages you modify all environments.
cmd "/c conda remove --force pyqtgraph qtpy matplotlib enaml"
IF %pyverMajor%==py3 (
	cmd "/c conda install --force --copy qtpy pyqtgraph"
	cmd "/c conda install --force --copy -c conda-forge matplotlib"
	cmd "/c conda install --force --copy -c ecpy enaml
) ELSE (
	cmd "/c conda install --force --copy qtpy pyqtgraph matplotlib enaml"
)

@REM  Remove: pyqt sip
@REM  ===============================================
cmd "/c conda remove --force pyqt sip"

@REM  pip install preparations
@REM  ===============================================
@REM  Update setuptools:
@REM  cmd "/c conda remove --force setuptools"
@REM  pip install --ignore-installed setuptools

@REM  Check pip dedendencies:
cd /d "%envcache%"
rmdir pip /s /q
cmd "/c conda list"
pip download -d "%envcache%\pip" opencv_python

@REM  Post-update:
@REM  cmd "/c conda install -c conda-forge thepackage=1.0"
