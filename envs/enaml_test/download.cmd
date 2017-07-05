REM  @echo off
REM  pip download
REM  ==============================================
REM  Use this script to pre-download packages that otherwise would
REM  be downloaded every time you 'pip install'.

REM  you can use: 'IF defined py35plus' (>=3.5)
REM  or: 'IF %pyverMajor%==py3' (>=3.0)


REM  we should be in %envcache% context
cd /d "%envcache%"


REM  MingwPy (py27 or py34)
REM  ==============================================
IF %pycomp%==mingwpy IF not defined py35plus (
	pip download -i https://pypi.anaconda.org/carlkl/simple mingwpy
	pause
)


REM  Deprecated manual pip caching
REM  ==============================================
REM  pip automatically caches in %LOCALAPPDATA%\pip\cache
REM  pip download opencv_python


REM  Manual download
REM  ==============================================
REM  set URL=http://www.lfd.uci.edu/~gohlke/pythonlibs/#opencv
REM  IF %pyver%==py27 IF %pybit%==32 call "%funcs%" filedownload "opencv_python-...whl" "%URL%"


REM  Pip direct URL download
REM  ==============================================
REM  set URL=https://pypi.python.org/<...>cp27-cp27m-win32.whl
REM  IF %pyver%==py27 IF %pybit%==32 pip download %URL%


REM  Installation from GitHub
REM  ==============================================
REM  cd /d "%envcache%"
REM  rmdir kiwisolver /s /q
REM  git clone https://github.com/nucleic/kiwi.git kiwisolver
REM  rmdir atom /s /q
REM  git clone -b py23 https://github.com/MatthieuDartiailh/atom.git
REM  rmdir enaml /s /q
REM  git clone -b python3-parsing https://github.com/MatthieuDartiailh/enaml.git
