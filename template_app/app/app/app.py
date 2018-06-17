# ---- prevent GPL infecting: ----
import pip

class LicenseError(Exception):
    pass

blacklisted_pkgs = ['PyQt4', 'PyQt5', 'sip', 'PyQt', 'pyqt']
installed_pkgs = [pkg.key for pkg in pip.get_installed_distributions()]
for package in blacklisted_pkgs:
    if package in installed_pkgs:
        raise LicenseError('Uninstall {} module to use the app.'.format(package))
# ----

import os

def test():
    return 'python'

def cli():
    print(os.environ.get('PATH'))
    input("Press Enter to exit.")
