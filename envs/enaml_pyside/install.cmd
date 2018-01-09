::@echo off
::# this is a shortened version of 'enaml_test' scripts - without comments and for python >= 3.5

::# see matplotlib version
call conda list
@pause

::# --copy pyqtgraph qtpy matplotlib enaml
call conda remove --force pyqtgraph qtpy matplotlib enaml
call conda install --force --copy qtpy pyqtgraph
call conda install --force --copy -c conda-forge matplotlib
call conda install --force --copy -c ecpy enaml

::# pyqt - remove
call conda remove --force pyqt sip


::# ==================================

::# no pyqt patch
@echo off
::# pyqtgraph qtpy - if hash match
call "%funcs%" gitdiffcopy  no_pyqt\qtpy-1.2.1  Lib\site-packages\qtpy  __init__.py
call "%funcs%" gitdiffcopy  no_pyqt\pyqtgraph-0.10.0  Lib\site-packages\pyqtgraph  Qt.py
::# notepad++ regex replacements
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\enaml      Yellow  "Patch Enaml"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\pyqtgraph  Yellow  "Patch PyQtGraph"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\qtpy       Yellow  "Patch QtPy"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\matplotlib Yellow  "Patch Matplotlib"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages            Red     "Check _import/from PyQt_. First search only but not replace. Then search again in case-insensitive mode. If something important is found then you can replace - decide yourself."
