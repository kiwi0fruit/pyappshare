::@echo off

cd /d "%envcache%"
::set tensorflow=tensorflow-<...>.whl
::set pkgs=%tensorflow% pandoctools

::# Conda post-update:
::# 'pipResolve' found conda/pip versions mismatch: markdown bleach
::call conda remove --force markdown bleach
::call conda install --force --copy markdown bleach
call conda install -c defaults -c conda-forge shutilwhich "jupyter_client>=5.2.1"

::# Check pip dependencies:
call "%funcs%" pipResolve "pandoctools"
@pause

::# Check pip dependencies:
call "%funcs%" pipResolve "panflute"
@pause

::# Tensorflow:
::pip install "%envcache%\%tensorflow%"

::# Pandoctools:
pip install "git+https://github.com/kiwi0fruit/pandoctools.git"
@pause

call conda install --force -c r rpy2
@pause
