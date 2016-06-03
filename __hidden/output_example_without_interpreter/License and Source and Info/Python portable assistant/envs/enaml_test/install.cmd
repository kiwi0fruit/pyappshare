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
	set hashA=df5f50fed70f8c2906890432363181c2c9a161bc5d53d8082b041084ec663e58
) ELSE (
	set hash=2104c3565cf6f9197eed990f4f9b2c435f57fb4f4686a21d7851c847196e5a35
	set hashA=496975306d7c58f0b5aa02e20b2fb10b699b70bfcf07fb6c0337b6041a567426
)
call "%funcs%" hashcopy enaml_pyside_fix\%pyver% Lib\site-packages\enaml\qt q_window_base.py


:: 'hash' is the SHA 256 hash of the valid unpatched file.
:: 'hash2' is the SHA 256 hash of the second valid unpatched file.
:: 'hashA' is the SHA 256 hash of the valid patched file.


IF %pyver%==py27 (

:: no pyqt: enaml (hash: py27, hash2: py35)
set hash=0718750f0f5d8dac28801cceebf53e4750e6d17dc58a63762b27adc113dc4844
set hash2=b7bffc303a1dfa94b6d9f4ec9b8d15006ab6596dd86631c86edd7a239f6b78d0
set hashA=033b30386cd67c07846d8f6f694d522ca8ef4e309d6416e253e8fb77e38d7fce
call "%funcs%" hashcopy no_pyqt\enaml Lib\site-packages\enaml\qt __init__.py


:: no pyqt: pyqtgraph
set hash=6be0d5111316c92803821be6cfb1971fc2e3113db6b33b62801478eaf4fa432d
set hashA=40d76f46eaed24c244e909a2c920eefd8df580276cbbcabe04e235e26796413b
call "%funcs%" hashcopy no_pyqt\pyqtgraph Lib\site-packages\pyqtgraph Qt.py


:: no pyqt: qtpy
set hash=126d722d1462b1e23f60d08d92b054cc416074cc2b1dbed3a22a3bf5aac17bb3
set hashA=48aaa4f21f363ea9f173f2bd243e584cc419b64786f07f1686866f7db1902fec
call "%funcs%" hashcopy no_pyqt\qtpy Lib\site-packages\qtpy __init__.py


:: no pyqt: notepad++ reg exp
call "%funcs%" notepadppRegExp no_pyqt\notepadpp Lib\site-packages\enaml "Patch Enaml"
call "%funcs%" notepadppRegExp no_pyqt\notepadpp Lib\site-packages\pyqtgraph "Patch PyQtGraph"
call "%funcs%" notepadppRegExp no_pyqt\notepadpp Lib\site-packages\qtpy "Patch QtPy"
call "%funcs%" notepadppRegExp no_pyqt\notepadpp2 Lib\site-packages "Check _import PyQt_ but do not replace!"

)
