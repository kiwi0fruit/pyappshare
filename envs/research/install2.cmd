::@echo off

cd /d "%envcache%"
::set tensorflow=tensorflow-<...>.whl
::set pkgs=%tensorflow% pandoctools

::# Conda post-update:
::# downgrade pandoc because of it's bug found in 'pipResolve':
call conda install -c defaults -c conda-forge "pandoc>=2.0,<2.1"
::# 'pipResolve' found conda/pip versions mismatch: jupyter_client mistune shutilwhich bleach jedi psutil
call conda install -c defaults -c conda-forge "jupyter_client=5.2.1" "mistune=0.8.3" shutilwhich
call conda remove --force bleach jedi psutil
call conda install --copy -c defaults -c conda-forge bleach jedi psutil
@pause

::# Check pip dependencies:
call "%funcs%" pipResolve "pandoctools"
@pause

::# Tensorflow:
::pip install "%envcache%\%tensorflow%"

::# Pandoctools:
pip install "git+https://github.com/kiwi0fruit/pandoctools.git"
@pause

call conda install --force -c r rpy2
@pause
