import os


def check():
    """prevent GPL infecting"""
    from importlib.util import find_spec as find_module

    class LicenseError(Exception):
        pass

    blacklisted = ['PyQt4', 'PyQt5', 'sip', 'PyQt', 'pyqt']
    for mod in blacklisted:
        if find_module(mod) is not None:
            raise LicenseError('Uninstall {} module to use the app.'.format(mod))

check()


def test():
    return 'python'


def cli():
    print(os.environ.get('PATH'))
    input("Press Enter to exit.")
