# ---- prevent GPL infecting: ----
import pkg_resources

class LicenseError(Exception):
    pass

blacklisted_pkgs = ['PyQt4', 'PyQt5', 'sip', 'pyqt']
installed_pkgs = [pkg.key.lower() for pkg in pkg_resources.working_set]
for pkg in blacklisted_pkgs:
    if pkg.lower() in installed_pkgs:
        raise LicenseError('Uninstall {} module to use the app (module name was lowercased).'.format(pkg.lower()))
# ----

import os

def test():
    return 'python'

def cli():
    print(os.environ.get('PATH'))
    input("Press Enter to exit.")
