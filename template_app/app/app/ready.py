import sys
from os import path as p
from shortcutter import ShortCutter


def ready():
    """
    Creates desktop shortcuts to app exec. and app module folder
    via shortcutter: https://github.com/kiwi0fruit/shortcutter
    """
    # Find module:
    #   import the_module
    #   import inspect
    #   mod_dir = p.dirname(inspect.getfile(the_module))
    # Find module without importing:
    #   from importlib.util import find_spec as find_module
    #   find_module('the_module').origin

    sc = ShortCutter(error_log=sys.stderr)
    sc.create_desktop_shortcut('app')
    sc.create_desktop_shortcut(p.join(p.dirname(__file__), 'extra'), 'app_extra_dir')
    sc.create_shortcut_to_env_terminal(menu=False)
