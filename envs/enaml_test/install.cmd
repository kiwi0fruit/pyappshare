::@echo off

::# conda install
::# ===============================================
::# you can use: 'IF defined py35plus' (>=3.5)
::# or: 'IF %pyverMajor%==py3' (>=3.0)


::# Vars:
::# ===============================================
set pkgs=opencv_python


::# See Matplotlib version
::# ===============================================
call conda list
@pause


::# --copy install: pyqtgraph qtpy matplotlib enaml
::# ===============================================
::# Hint: patch only packages that were installed with --copy parameter
::# Conda by default links packages but not copies them. So when patching
::# such packages you modify all environments.
call conda remove --force pyqtgraph qtpy matplotlib enaml
IF %pyverMajor%==py3 (
	call conda install --force --copy qtpy pyqtgraph
	call conda install --force --copy -c conda-forge matplotlib
	call conda install --force --copy -c ecpy enaml
) ELSE (
	call conda install --force --copy qtpy pyqtgraph matplotlib enaml
)


::# Remove: pyqt sip
::# ===============================================
call conda remove --force pyqt sip


::# Fix setuptools - needed for proper work of 'pipResolve'
::# ===============================================
call conda remove --force setuptools
call conda install --force --copy setuptools
pip install --ignore-installed setuptools


::# Check pip dependencies
::# ===============================================
call "%funcs%" pipResolve "%pkgs%"
