@echo off

:: inverse order of channels:
%run% conda.exe config --env --add channels conda-forge
%run% conda.exe config --env --add channels defaults


%run% pip install .\app-0.1.0.tar.gz || %exi%
%run% app-ready
:: %run% python.exe -m ipykernel install --user --name %env%
