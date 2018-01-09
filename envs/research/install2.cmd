::@echo off

::cd /d "%envcache%"
::set tensorflow=tensorflow-<...>.whl
::set pkgs=%tensorflow%

::# Conda post-update:
::# 'pipResolve' found conda/pip versions mismatch: markdown bleach
::call conda remove --force markdown bleach
::call conda install --force --copy markdown bleach

::# Check pip dependencies:
::call "%funcs%" pipResolve "%pkgs%"
::@pause

::# Tensorflow:
::pip install "%envcache%\%tensorflow%"
@pause
