@echo off
:: inverse order of channels:
%run% conda config --env --add channels conda-forge
%run% conda config --env --add channels defaults

:: %run% python -m ipykernel install --user --name %env%
