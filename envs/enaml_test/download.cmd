REM @echo off
REM // we should be in %envcache% context
cd /d "%envcache%"

REM // you can use:
REM // IF defined py35plus
REM // >=3.5
REM // IF %pyver:~0,3%==py3



REM // MingwPy (py27 or py34)
REM ===============================
IF %pycomp%==mingwpy IF not defined py35plus (
	pip download -i https://pypi.anaconda.org/carlkl/simple mingwpy
)



REM // PySide (py34-32bit)
REM ===============================
IF %pybit%==32 IF %pyver%==py34 (
	pip download pyside
)

REM // OpenCV
REM ===============================
pip download opencv_python



REM // Manual download
REM ===============================
REM // set URL=http://www.lfd.uci.edu/~gohlke/pythonlibs/#opencv
REM // IF %pyver%==py27 IF %pybit%==32 call "%funcs%" filedownload "opencv_python-...whl" "%URL%"



REM // Pip direct URL download
REM ===============================
REM // set URL=https://pypi.python.org/<...>cp27-cp27m-win32.whl
REM // IF %pyver%==py27 IF %pybit%==32 pip download %URL%
