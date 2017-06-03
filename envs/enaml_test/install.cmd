REM // @echo off
REM // You can use:
REM // IF defined py35plus
REM // >=3.5
REM // IF %pyver:~0,3%==py3
set "py34win32="
IF %pybit%==32 IF %pyver%==py34 set py34win32=1



REM // MingwPy (py27 or py34)
REM ==============================
IF %pycomp%==mingwpy IF not defined py35plus (
	pip install --no-cache-dir --no-index --find-links="%envcache%" mingwpy
)



REM // OpenCV
REM =========
pip install --no-cache-dir --no-index --find-links="%envcache%" opencv_python



REM // --copy install: pyqtgraph, qtpy
REM =================================
cmd "/c conda remove --force pyqtgraph qtpy"
cmd "/c conda install --force --copy qtpy pyqtgraph"
	REM // Hint: patch only packages that were installed with --copy parameter
	REM // Conda by default links packages but not copies them. So when patching
	REM // such packages you modify all environments.



REM // PySide, Enaml (py3)
REM ==============================
IF %pybit%==32 IF %pyver%==py34 (
	pip install --no-cache-dir --no-index --find-links="%envcache%" pyside
	cmd "/c conda install -c ecpy enaml"
)
IF not defined py34win32 IF %pyver:~0,3%==py3 (
	cmd "/c conda install -c ecpy enaml"
	cmd "/c conda install freetype libiconv libtiff tornado vc"
	cmd "/c conda install -c conda-forge pyside libxml2 libxslt"
)
	REM // https://anaconda.org/ecpy/enaml
	REM // py34,  x64       https://anaconda.org/bpentz/pyside
	REM // py35,  x86, x64  https://github.com/krrr/PySide/releases
	REM // py35+, x86, x64  http://www.lfd.uci.edu/~gohlke/pythonlibs/#pyside
	REM // py35+, x86, x64  https://anaconda.org/conda-forge/pyside



REM // --copy install: matplotlib, enaml
REM ====================================
cmd "/c conda remove --force matplotlib enaml"
IF %pyver%==py27 (
	cmd "/c conda install --force --copy matplotlib enaml"
)
IF %pybit%==32 IF %pyver%==py34 (
	cmd "/c conda install --force --copy matplotlib"
)
IF not defined py34win32 IF %pyver:~0,3%==py3 (
	cmd "/c conda install --force --copy -c conda-forge matplotlib"
)
IF %pyver:~0,3%==py3 (
	cmd "/c conda install --force --copy -c ecpy enaml
)
	REM // pyside from conda-forge (or it's dependences) want matplotlib=2.0.0 (see log from commands above)



REM // Remove: pyqt, sip
REM ==============================
cmd "/c conda remove --force pyqt sip"



REM // Patch modules if hash match or with reg exp
REM ==============================================
	REM // Patch section should be in the end
	REM // See 'hashcopy' and 'nppRegExp' functions description in 'files\functions.cmd'

@echo off
REM // enaml-pyside bug patch
echo enaml-pyside bug patch:
call "%funcs%" hashcopy  enaml_pyside_fix_2\%pyver:~0,3%  Lib\site-packages\enaml\qt  q_window_base.py
REM // call "%funcs%" hashcopy  enaml_pyside_fix_1  Lib\site-packages\enaml\qt  qt_dialog.py

REM // no pyqt patch: enaml, pyqtgraph, qtpy
echo no pyqt patch - qtpy (two attemps, one should be successful):
call "%funcs%" hashcopy  no_pyqt\qtpy-1.0.2  Lib\site-packages\qtpy  __init__.py
call "%funcs%" hashcopy  no_pyqt\qtpy-1.2.1  Lib\site-packages\qtpy  __init__.py

echo no pyqt patch - pyqtgraph (two attemps, one should be successful):
call "%funcs%" hashcopy  no_pyqt\pyqtgraph-0.9.10  Lib\site-packages\pyqtgraph  Qt.py
call "%funcs%" hashcopy  no_pyqt\pyqtgraph-0.10.0  Lib\site-packages\pyqtgraph  Qt.py

echo no pyqt patch - enaml (for older versions, 0.10.0 doesn't need it):
call "%funcs%" hashcopy  no_pyqt\enaml  Lib\site-packages\enaml\qt  __init__.py  py2  py3

REM // no pyqt patch: Notepad++ Reg Exp replacements
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\enaml      Yellow  "Patch Enaml"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\pyqtgraph  Yellow  "Patch PyQtGraph"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages\qtpy       Yellow  "Patch QtPy"
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages            Red     "Check _import/from PyQt_. First search only but not replace. Then search again in case-insensitive mode. If something important is found then you can replace - decide yourself."



REM // Enaml for Python 3 installation from GitHub
REM ==============================================
	REM // pip install git+https://github.com/nucleic/kiwi.git#egg=kiwisolver
	REM // pip install git+https://github.com/MatthieuDartiailh/atom.git@py23#egg=atom
	REM // pip install git+https://github.com/MatthieuDartiailh/enaml.git@parser23#egg=enaml

	REM // cd /d "%envcache%"
	REM // rmdir kiwisolver /s /q
	REM // git clone https://github.com/nucleic/kiwi.git kiwisolver
	REM // rmdir atom /s /q
	REM // git clone -b py23 https://github.com/MatthieuDartiailh/atom.git
	REM // rmdir enaml /s /q
	REM // git clone -b parser23 https://github.com/MatthieuDartiailh/enaml.git
	
	REM // cd /d "%envcache%"
	REM // rmdir enaml /s /q
	REM // git clone -b python3-parsing https://github.com/MatthieuDartiailh/enaml.git
	REM // cd /d %envcache%\enaml
	REM // git reset --hard bd5adc89d314cafdbd0575cfa995ce857af490b9
	REM // pip install git+%EnvCacheURL%/enaml#egg=enaml

	REM // pip install git+%EnvCacheURL%/kiwisolver#egg=kiwisolver
	REM // pip install git+%EnvCacheURL%/atom#egg=atom
	REM // pip install git+%EnvCacheURL%/enaml#egg=enaml
