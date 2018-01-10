::@echo off

::# no pyqt patch
@echo off
::# notepad++ regex replacements
call "%funcs%" nppVarFolder  no_pyqt\notepadpp  Lib\site-packages            Red     "Check _import/from PyQt_. First search only but not replace. Then search again in case-insensitive mode. If something important is found then you can safely replace only in pyqtgraph qtpy matplotlib enaml modules."
