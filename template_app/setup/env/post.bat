@echo off
%run% pip install .\app-0.1.0.tar.gz
%run% app-ready

:: inverse order of channels:
%run% conda.exe config --env --add channels conda-forge
%run% conda.exe config --env --add channels defaults

:: %run% python.exe -m ipykernel install --user --name %env%
