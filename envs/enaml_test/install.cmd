REM  @echo off
REM  conda install
REM  ===============================================
REM  you can use: 'IF defined py35plus' (>=3.5)
REM  or: 'IF %pyverMajor%==py3' (>=3.0)


REM  PySide: py35+ or py34x64 - first to see matplotlib version
REM  ===============================================
IF defined py35plus (
	cmd "/c conda install -c conda-forge pyside"
)
IF %pyver%==py34 IF %pybit%==64 (
	cmd "/c conda install -c bpentz pyside"
)
REM  py35,  x86, x64  https://github.com/krrr/PySide/releases
REM  py35+, x86, x64  http://www.lfd.uci.edu/~gohlke/pythonlibs/#pyside


REM  Enaml: py3
REM  ===============================================
IF %pyverMajor%==py3 (
	cmd "/c conda install -c ecpy enaml"
)


REM  --copy install: pyqtgraph qtpy matplotlib enaml
REM  ===============================================
REM  Hint: patch only packages that were installed with --copy parameter
REM  Conda by default links packages but not copies them. So when patching
REM  such packages you modify all environments.

cmd "/c conda remove --force pyqtgraph qtpy matplotlib enaml"
cmd "/c conda install --force --copy qtpy pyqtgraph"

IF defined py35plus (
	cmd "/c conda install --force --copy -c conda-forge matplotlib=1"
) ELSE (
	cmd "/c conda install --force --copy matplotlib"
)
IF %pyverMajor%==py3 (
	cmd "/c conda install --force --copy -c ecpy enaml
) ELSE (
	cmd "/c conda install --force --copy enaml"
)


REM  Remove: pyqt sip
REM  ===============================================
cmd "/c conda remove --force pyqt sip"
