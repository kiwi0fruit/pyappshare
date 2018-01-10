::@echo off
::# this is a shortened version of 'enaml_test' scripts - without comments and for python >= 3.5

set pckgs=pyqtgraph qtpy matplotlib enaml

@echo check repos for: %pckgs%
call conda list
@pause

::# Remove pyqt sip / --copy install %pckgs%
call conda remove --force %pckgs% pyqt sip
call conda install --force --copy -c defaults -c conda-forge %pckgs%
