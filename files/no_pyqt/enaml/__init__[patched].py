#------------------------------------------------------------------------------
# Copyright (c) 2013, Nucleic Development Team.
#
# Distributed under the terms of the Modified BSD License.
#
# The full license is in the file COPYING.txt, distributed with this software.
#------------------------------------------------------------------------------
import os


QT_API = os.environ.get('QT_API', '').lower().strip()


if not QT_API:
    try:
        import PySide
        QT_API = os.environ['QT_API'] = 'pyside'
    except ImportError:
        raise ImportError('Cannot import PySide')
elif QT_API != 'pyside':
    msg = "Invalid Qt API %r, valid value is 'pyside'"
    raise ValueError(msg % QT_API)
