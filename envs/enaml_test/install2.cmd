::@echo off

::# pip install
::# ===============================================
::# you can use: 'IF defined py35plus' (>=3.5)
::# or: 'IF %pyverMajor%==py3' (>=3.0)

::# Make sure that pip installs packages that were listed only. Otherwise
::# it may update some conda packages. And this will affect all environments.
::# 'pipResolve' is used to handle this issue. See '%envcache%\diff_list.txt'
::# for packages versions conflicts.


::# Vars:
::# ===============================================
set pkgs=opencv_python


::# Conda post-update
::# ===============================================
::call conda install -c conda-forge thepackage=1.0


::# Check pip dependencies
::# ===============================================
call "%funcs%" pipResolve "%pkgs%"
@pause


::# MingwPy: py27 or py34
::# ===============================================
IF %pycomp%==mingwpy IF not defined py35plus (
	pip install --no-cache-dir --no-index --find-links="%envcache%" mingwpy
	pause
)


::# OpenCV
::# ===============================================
pip install opencv_python
@pause


::# Patch modules if no git diff or with reg exp
::# ===============================================
::# Patch section should be in the end
::# See 'gitdiffcopy' and 'nppVarFolder' functions description in 'files\functions.cmd'

@echo off
::# enaml-pyside bug patch
@echo enaml-pyside bug patch:
call "%funcs%" gitdiffcopy  enaml_pyside_fix_2\%pyverMajor%  Lib\site-packages\enaml\qt  q_window_base.py
::# call "%funcs%" gitdiffcopy  enaml_pyside_fix_1  Lib\site-packages\enaml\qt  qt_dialog.py

::# no pyqt patch: enaml pyqtgraph qtpy
@echo no pyqt patch - qtpy (two attemps, one should be successful):
call "%funcs%" gitdiffcopy  no_pyqt\qtpy-1.0.2  Lib\site-packages\qtpy  __init__.py
call "%funcs%" gitdiffcopy  no_pyqt\qtpy-1.2.1  Lib\site-packages\qtpy  __init__.py

@echo no pyqt patch - pyqtgraph (two attemps, one should be successful):
call "%funcs%" gitdiffcopy  no_pyqt\pyqtgraph-0.9.10  Lib\site-packages\pyqtgraph  Qt.py
call "%funcs%" gitdiffcopy  no_pyqt\pyqtgraph-0.10.0  Lib\site-packages\pyqtgraph  Qt.py

@echo no pyqt patch - enaml (for older versions, 0.10.0 doesn't need it):
call "%funcs%" gitdiffcopy  no_pyqt\enaml  Lib\site-packages\enaml\qt  __init__.py  py2  py3

::# no pyqt patch: notepad++ regex replacements
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\enaml      Yellow  "Patch Enaml"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\pyqtgraph  Yellow  "Patch PyQtGraph"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\qtpy       Yellow  "Patch QtPy"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\matplotlib Yellow  "Patch Matplotlib"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages            Red     "Check _import/from PyQt_. First search only but not replace. Then search again in case-insensitive mode. If something important is found then you can replace - decide yourself."


::# Enaml for Python 3 installation from GitHub
::# ===============================================
::pip install git+%EnvCacheURL%/kiwisolver#egg=kiwisolver
::pip install git+%EnvCacheURL%/atom#egg=atom
::pip install git+%EnvCacheURL%/enaml#egg=enaml


::# Installation without caching
::# ===============================================
::pip install git+https://github.com/nucleic/kiwi.git#egg=kiwisolver
::pip install git+https://github.com/MatthieuDartiailh/atom.git@py23#egg=atom
::pip install git+https://github.com/MatthieuDartiailh/enaml.git@python3-parsing#egg=enaml


::# Installation by the particular commit hash (from particular branch)
::# ===============================================
::cd /d "%envcache%"
::rmdir enaml /s /q
::git clone -b python3-parsing https://github.com/MatthieuDartiailh/enaml.git
::cd /d %envcache%\enaml
::git reset --hard bd5adc89d314cafdbd0575cfa995ce857af490b9
::pip install git+%EnvCacheURL%/enaml#egg=enaml
