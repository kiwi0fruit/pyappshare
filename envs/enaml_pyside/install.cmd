@REM  this is a shortened version of 'enaml_test' scripts - without comments and for python >= 3.5

@REM  see matplotlib version
cmd "/c conda list"
@pause

@REM  --copy pyqtgraph qtpy matplotlib enaml
cmd "/c conda remove --force pyqtgraph qtpy matplotlib enaml"
cmd "/c conda install --force --copy qtpy pyqtgraph"
cmd "/c conda install --force --copy -c conda-forge matplotlib"
cmd "/c conda install --force --copy -c ecpy enaml

@REM  pyqt - remove
cmd "/c conda remove --force pyqt sip"

@REM  fix setuptools - needed for proper work of 'pipResolve'
@REM  cmd "/c conda remove --force setuptools"
@REM  cmd "/c conda install --force --copy setuptools"
@REM  pip install --ignore-installed setuptools

@REM  ==================================

@REM  check pip dependencies
call "%funcs%" pipResolve opencv_python
@pause

@REM  opencv
pip install opencv_python
@pause

@REM  no pyqt patch
@echo off
@REM  pyqtgraph qtpy - if hash match
call "%funcs%" gitdiffcopy  no_pyqt\qtpy-1.2.1  Lib\site-packages\qtpy  __init__.py
call "%funcs%" gitdiffcopy  no_pyqt\pyqtgraph-0.10.0  Lib\site-packages\pyqtgraph  Qt.py
@REM  notepad++ regex replacements
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\enaml      Yellow  "Patch Enaml"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\pyqtgraph  Yellow  "Patch PyQtGraph"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\qtpy       Yellow  "Patch QtPy"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\matplotlib Yellow  "Patch Matplotlib"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages            Red     "Check _import/from PyQt_. First search only but not replace. Then search again in case-insensitive mode. If something important is found then you can replace - decide yourself."
