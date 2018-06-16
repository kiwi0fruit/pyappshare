from setuptools import setup
from setuptools.command.install import install


class PostInstallCommand(install):
    def run(self):
        """
        Creates desktop shortcuts to app exec. and app module folder
        via shortcutter: https://github.com/kiwi0fruit/shortcutter
        Logs shortcut creation errors to ~/app_install_error_log.txt
        """
        import io
        import os
        from os import path as p
        import app  # always import the main module to make sure it's installed
        from shortcutter import ShortCutter
        import inspect

        error_log = io.StringIO()

        sc = ShortCutter(error_log=error_log)
        sc.create_desktop_shortcut('app')
        sc.create_desktop_shortcut(p.dirname(inspect.getfile(app)), 'app_dir')
        sc.create_shortcut_to_env_terminal(menu=False)

        print(error_log.getvalue(), file=open(p.join(p.expanduser('~'),
                                                     'app_install_error_log.txt'),
                                              'w', encoding="utf-8"))
        error_log.close()

        # must have:
        install.run(self)


setup(
    name='app-ready',
    version='0.1.0',
    cmdclass={'install': PostInstallCommand},

    description='My app shortcuts.',
    url='https://github.com/me/app-ready',
    author='My Name',
    author_email='me@mail.com',
    license='Proprietary',
    # install_requires=['app'],  # Do not add such deps!
    # Because 'app' is already on pypi and setup.py will attempt to install from there.
    # And it's not the 'app' that we need.
)
