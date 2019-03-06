import sys
import app  # make sure the main module is installed
import io
from os import path as p
import inspect
from shortcutter import ShortCutter


def ready():
    """
    Creates desktop shortcuts to app exec. and app module folder
    via shortcutter: https://github.com/kiwi0fruit/shortcutter
    """
    # Find module without importing:
    # from importlib.util import find_spec as find_module
    # find_module('app').origin

    sc = ShortCutter(error_log=sys.stderr)
    sc.create_desktop_shortcut('app')
    app_dir = p.dirname(inspect.getfile(app))
    sc.create_desktop_shortcut(p.join(app_dir, 'extra'), 'app_extra_dir')
    sc.create_shortcut_to_env_terminal(menu=False)
