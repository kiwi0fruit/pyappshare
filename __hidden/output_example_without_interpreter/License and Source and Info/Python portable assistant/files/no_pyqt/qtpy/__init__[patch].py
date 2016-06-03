
#: names of the expected PyQt5 api
PYQT5_API = ['nopyqt5']
#: names of the expected PyQt4 api
PYQT4_API = [
    'nopyqt',  # name used in IPython.qt
    'nopyqt4'  # pyqode.qt original name
]
#: names of the expected PySide api
PYSIDE_API = ['pyside']

os.environ.setdefault(QT_API, 'pyside')
assert os.environ[QT_API] in (PYSIDE_API)

API = os.environ[QT_API]
API_NAME = {'pyqt5': 'PyQt5', 'pyqt': 'PyQt4', 'pyqt4': 'PyQt4',
            'pyside': 'PySide'}[API]

is_old_pyqt = is_pyqt46 = False
PYQT5 = False
PYQT4 = False
PYSIDE = True
