REM  @echo off
REM  pip install
REM  ===============================================
REM  Make sure that pip installs packages that were listed only. Otherwise
REM  it may update some conda packages. And this will affect all environments.
REM  Download and pause before install are performed to track this issue.
REM  See '%envcache%\pip' folder for dependencies versions.

REM  you can use: 'IF defined py35plus' (>=3.5)
REM  or: 'IF %pyverMajor%==py3' (>=3.0)


REM  we should be in %envcache% context
cd /d "%envcache%"


REM  Check pip dedendencies
REM  ===============================================
cmd "/c conda list"
IF %pyver%==py34 IF %pybit%==32 (
	pip download -d pip pyside
)
pip download -d pip opencv_python
pause


REM  PySide: py34win32
REM  ===============================================
IF %pyver%==py34 IF %pybit%==32 (
	pip install pyside
	pause
)


REM  MingwPy: py27 or py34
REM  ===============================================
IF %pycomp%==mingwpy IF not defined py35plus (
	pip install --no-cache-dir --no-index --find-links="%envcache%" mingwpy
	pause
)


REM  OpenCV
REM  ===============================================
pip install opencv_python
pause


REM  Patch modules if hash match or with reg exp
REM  ===============================================
REM  Patch section should be in the end
REM  See 'hashcopy' and 'nppVarFolder' functions description in 'files\functions.cmd'

@echo off
REM  enaml-pyside bug patch
echo enaml-pyside bug patch:
call "%funcs%" hashcopy  enaml_pyside_fix_2\%pyverMajor%  Lib\site-packages\enaml\qt  q_window_base.py
REM  call "%funcs%" hashcopy  enaml_pyside_fix_1  Lib\site-packages\enaml\qt  qt_dialog.py

REM  no pyqt patch: enaml pyqtgraph qtpy
echo no pyqt patch - qtpy (two attemps, one should be successful):
call "%funcs%" hashcopy  no_pyqt\qtpy-1.0.2  Lib\site-packages\qtpy  __init__.py
call "%funcs%" hashcopy  no_pyqt\qtpy-1.2.1  Lib\site-packages\qtpy  __init__.py

echo no pyqt patch - pyqtgraph (two attemps, one should be successful):
call "%funcs%" hashcopy  no_pyqt\pyqtgraph-0.9.10  Lib\site-packages\pyqtgraph  Qt.py
call "%funcs%" hashcopy  no_pyqt\pyqtgraph-0.10.0  Lib\site-packages\pyqtgraph  Qt.py

echo no pyqt patch - enaml (for older versions, 0.10.0 doesn't need it):
call "%funcs%" hashcopy  no_pyqt\enaml  Lib\site-packages\enaml\qt  __init__.py  py2  py3

REM  no pyqt patch: notepad++ regex replacements
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\enaml      Yellow  "Patch Enaml"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\pyqtgraph  Yellow  "Patch PyQtGraph"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\qtpy       Yellow  "Patch QtPy"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\matplotlib Yellow  "Patch Matplotlib"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages            Red     "Check _import/from PyQt_. First search only but not replace. Then search again in case-insensitive mode. If something important is found then you can replace - decide yourself."


REM  Enaml for Python 3 installation from GitHub
REM  ===============================================
REM  pip install git+%EnvCacheURL%/kiwisolver#egg=kiwisolver
REM  pip install git+%EnvCacheURL%/atom#egg=atom
REM  pip install git+%EnvCacheURL%/enaml#egg=enaml

REM  Installation without caching:
REM  ===============================================
REM  pip install git+https://github.com/nucleic/kiwi.git#egg=kiwisolver
REM  pip install git+https://github.com/MatthieuDartiailh/atom.git@py23#egg=atom
REM  pip install git+https://github.com/MatthieuDartiailh/enaml.git@python3-parsing#egg=enaml

REM  Installation by the particular commit hash (from particular branch):
REM  ===============================================
REM  cd /d "%envcache%"
REM  rmdir enaml /s /q
REM  git clone -b python3-parsing https://github.com/MatthieuDartiailh/enaml.git
REM  cd /d %envcache%\enaml
REM  git reset --hard bd5adc89d314cafdbd0575cfa995ce857af490b9
REM  pip install git+%EnvCacheURL%/enaml#egg=enaml
