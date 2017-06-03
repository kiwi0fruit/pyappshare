# -*- coding: utf-8 -*-
# Workaround for Enaml on Python 3 UTF-8 bug


class EnamlNames:
    test_pyside_bug = "Test PySide-Enaml bug"
    pyqtgragh_to_enaml_integration = "PyQtGraph to Enaml integration"
    alpha_betta_gamma = "αβγ"
    unicode_from_py = "Unicode imported from .py\nHere should be alpha betta gamma: "
    unicode_from_enaml = "Unicode declared in .enaml\nHere should be alpha betta gamma: "
    message_box_title = "Testing"
    pyside_bug_info = "If you see this then presumably PySide-Enaml bug was patched.\n" + \
                      "But it still can be broken if Python hangs after pressing OK."


enaml_names = EnamlNames()


def u(attribute):
    return getattr(enaml_names, attribute)
