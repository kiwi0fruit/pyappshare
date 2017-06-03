# -*- coding: utf-8 -*-
from __future__ import unicode_literals    # at top of module

# MODEL:
import numpy as np

# CONTROLLER:
import enaml
from enaml.qt.qt_application import QtApplication
# import qtpy


# <MODEL>
data = np.random.normal(size=(10, 1000))
# </MODEL>


# <CONTROLLER>
with enaml.imports():
    from pyqtgraph2enaml_view import Main

view = Main(data=data, timer_trigger=0)
app = QtApplication()
app.timed_call(50, setattr, view, "timer_trigger", 1)


view.show()
# Start the application event loop
app.start()
# </CONTROLLER>
