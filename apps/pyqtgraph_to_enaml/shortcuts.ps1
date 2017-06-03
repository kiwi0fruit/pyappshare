# UTF-8 file. Should be named 'shortcuts.ps1' and be in 'apps\%pyapp%' folder. Should import:
Import-Module -Name "$env:psfuncs"
# Specify shortcuts names and paths to the python scripts (mind that later it would be prepended with 'apps\')
shortcut "PyQtGraph to Enaml" pyqtgraph_to_enaml\pyqtgraph_to_enaml.py
# You can create several shortcuts this way
shortcut "PyQtGraph to Enaml (αβγ)" pyqtgraph_to_enaml\pyqtgraph_to_enaml.py
