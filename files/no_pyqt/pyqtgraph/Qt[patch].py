"""
if 'PyQt4' in sys.modules:
    USE_PYSIDE = False
elif 'PySide' in sys.modules:
    USE_PYSIDE = True
else:
    try:
        import PyQt4
        USE_PYSIDE = False
    except ImportError:
        try:
            import PySide
            USE_PYSIDE = True
        except ImportError:
            raise Exception("PyQtGraph requires either PyQt4 or PySide; neither package could be imported.")
"""

if 'PySide' in sys.modules:
    USE_PYSIDE = True
else:
    try:
        import PySide
        USE_PYSIDE = True
    except ImportError:
        raise Exception("PyQtGraph requires PySide; package could not be imported.")

"""
else:
    from PyQt4 import QtGui, QtCore, uic
    try:
        from PyQt4 import QtSvg
    except ImportError:
        pass
    try:
        from PyQt4 import QtOpenGL
    except ImportError:
        pass
    try:
        from PyQt4 import QtTest
    except ImportError:
        pass


    import sip
    def isQObjectAlive(obj):
        return not sip.isdeleted(obj)
    loadUiType = uic.loadUiType

    QtCore.Signal = QtCore.pyqtSignal
    VERSION_INFO = 'PyQt4 ' + QtCore.PYQT_VERSION_STR + ' Qt ' + QtCore.QT_VERSION_STR
"""
