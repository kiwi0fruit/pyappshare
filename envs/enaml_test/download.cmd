::@echo off

::# pip download
::# ==============================================
::# Use this script to pre-download packages that otherwise would
::# be downloaded every time you 'pip install'.

::# you can use: 'IF defined py35plus' (>=3.5)
::# or: 'IF %pyverMajor%==py3' (>=3.0)

::# we should be in %envcache% context
cd /d "%envcache%"


::# MingwPy (py27 or py34)
::# ==============================================
IF %pycomp%==mingwpy IF not defined py35plus (
	pip download -i https://pypi.anaconda.org/carlkl/simple mingwpy
	pause
)


::# Deprecated manual pip caching
::# ==============================================
::# pip automatically caches in %LOCALAPPDATA%\pip\cache
::pip download opencv_python


::# Manual download
::# ==============================================
::set URL=http://www.lfd.uci.edu/~gohlke/pythonlibs/#opencv
::IF %pyver%==py27 IF %pybit%==32 call "%funcs%" filedownload "opencv_python-...whl" "%URL%"


::# Pip direct URL download
::# ==============================================
::set URL=https://pypi.python.org/<...>cp27-cp27m-win32.whl
::IF %pyver%==py27 IF %pybit%==32 pip download %URL%


::# Installation from GitHub with caching
::# ==============================================
::cd /d "%envcache%"
::rmdir kiwisolver /s /q
::git clone https://github.com/nucleic/kiwi.git kiwisolver
::rmdir atom /s /q
::git clone -b py23 https://github.com/MatthieuDartiailh/atom.git
::rmdir enaml /s /q
::git clone -b python3-parsing https://github.com/MatthieuDartiailh/enaml.git


::# PySise alt. binaries
::# ==============================================
::# py34,  x64       conda install -c bpentz pyside
::# py35,  x86, x64  https://github.com/krrr/PySide/releases
::# py35+, x86, x64  http://www.lfd.uci.edu/~gohlke/pythonlibs/#pyside
