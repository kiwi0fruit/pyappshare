::@echo off
cd /d "%envcache%"
::# Fix setuptools - needed for proper work of 'pipResolve':
::call conda remove --force setuptools
::call conda install --force --copy setuptools
::pip install --ignore-installed setuptools
