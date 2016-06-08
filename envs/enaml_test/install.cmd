IF %pyver%==py27 (
	pip install --find-links="%envcache%" mingwpy
	conda remove --force pyqt sip qt enaml pyqtgraph qtpy
	conda install pyside
	conda install --force --copy enaml pyqtgraph qtpy
)
:: hint: patch only packages that were installed with --copy parameter

IF not %pyver%==py27 (
	pip install git+%EnvCacheURL%/kiwisolver#egg=kiwisolver
	pip install git+%EnvCacheURL%/atom#egg=atom
	pip install git+%EnvCacheURL%/enaml#egg=enaml
)


echo off


:: enaml-pyside fix (pyver = py27 or py35)
IF %pyver%==py27 (
	set hash=462497f61f44b0d20cb04d4f0a60adf8a769c91eacc11871b2761c2b3550b27b
) ELSE (
	set hash=2104c3565cf6f9197eed990f4f9b2c435f57fb4f4686a21d7851c847196e5a35
)
call "%funcs%" hashcopy enaml_pyside_fix\%pyver% Lib\site-packages\enaml\qt q_window_base.py


:: 'hash' is the SHA 256 hash of the valid unpatched file.
:: 'hash2' is the SHA 256 hash of the second valid unpatched file.


IF %pyver%==py27 (

:: no pyqt: enaml (hash: py27, hash2: py35)
set hash=0718750f0f5d8dac28801cceebf53e4750e6d17dc58a63762b27adc113dc4844
set hash2=b7bffc303a1dfa94b6d9f4ec9b8d15006ab6596dd86631c86edd7a239f6b78d0
call "%funcs%" hashcopy no_pyqt\enaml Lib\site-packages\enaml\qt __init__.py


:: no pyqt: pyqtgraph
set hash=6be0d5111316c92803821be6cfb1971fc2e3113db6b33b62801478eaf4fa432d
call "%funcs%" hashcopy no_pyqt\pyqtgraph Lib\site-packages\pyqtgraph Qt.py


:: no pyqt: qtpy
set hash=45518285f8b97e99b15e4e0e38dae44aab238925b6a87a3271b3df5c802dc58d
call "%funcs%" hashcopy no_pyqt\qtpy Lib\site-packages\qtpy __init__.py


:: no pyqt: notepad++ reg exp
call "%funcs%" notepadppRegExp no_pyqt\notepadpp Lib\site-packages\enaml "Patch Enaml"
call "%funcs%" notepadppRegExp no_pyqt\notepadpp Lib\site-packages\pyqtgraph "Patch PyQtGraph"
call "%funcs%" notepadppRegExp no_pyqt\notepadpp Lib\site-packages\qtpy "Patch QtPy"
call "%funcs%" notepadppRegExp no_pyqt\notepadpp Lib\site-packages "Check _import/from PyQt_ but do not replace!"

)
