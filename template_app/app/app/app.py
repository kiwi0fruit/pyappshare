import os

def debug_GPL_infecting():
    """
    Debug only function - not for production.
    Loose test if import PySide2 and setting env var prevents importing PyQt.
    Should be performed on the conda environment that has installed PyQt.
    That's merely a helper not a panacea.
    """
    import sys
    import os
    os.environ['QT_API'] = 'pyside2'
    os.environ['PYQTGRAPH_QT_LIB'] = 'PySide2'
    import PySide2
    import qtpy
    import pyqtgraph

    b = ('PyQt4' in sys.modules) or ('PyQt5' in sys.modules) or ('sip' in sys.modules)
    print('PyQt was imported' if b else 'PyQt was not imported')


def test():
    return 'python'


def cli():
    print(os.environ.get('PATH'))
    input("Press Enter to exit.")
