::@echo off
cd /d "%envcache%"

::# Check pip dependencies:
call "%funcs%" pipResolve "pandoctools"
@pause
::pandoctools knitty sugartex shortcut

::# pip install failed because 'pandoc-attributes' was missing:
::call conda install -c conda-forge pandoc-attributes
::@pause

::set tensorflow=tensorflow-<...>.whl
::set pkgs=%tensorflow% pandoctools knitty sugartex

::# Check pip dependencies:
::call "%funcs%" pipResolve "%pkgs%"
::@pause

::# Conda post-update:
::# downgrade pandoc because of it's bug found in 'pipResolve':
::call conda install -c defaults -c conda-forge "pandoc>=2.0,<2.1"
::# 'pipResolve' found conda/pip versions mismatch: jupyter_client mistune shutilwhich bleach jedi psutil
::call conda remove --force bleach jedi psutil jupyter_client mistune
::call conda install --copy -c defaults -c conda-forge bleach jedi psutil jupyter_client mistune
::@pause

::# Tensorflow:
::pip install "%envcache%\%tensorflow%"

::# Pandoctools:
pip install pandoctools
@pause

::call conda install --force -c r rpy2
::@pause
