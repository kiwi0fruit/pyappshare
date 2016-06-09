# -*- coding: utf-8 -*-
from __future__ import unicode_literals    # at top of module

# Model part:
import numpy as np
# Controller part:
import enaml
from enaml.qt.qt_application import QtApplication
# import qtpy


# << Model part:
data = np.random.normal(size=(10, 1000))
# >>


# << Controller part:
with enaml.imports():
    from pyqtgraph2enaml_view import Main

view = Main(data=data, timerTrigger=0)
app = QtApplication()
app.timed_call(50, setattr, view, "timerTrigger", 1)


view.show()
# Start the application event loop
app.start()
# >>
