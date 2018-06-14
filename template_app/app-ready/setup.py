from setuptools import setup
from setuptools.command.install import install


class PostInstallCommand(install):
    def run(self):
        import io
        import os
        from os import path as p
        import app
        from shortcutter import ShortCutter
        import inspect

        error_log = io.StringIO()
        sc = ShortCutter(error_log=error_log)
        sc.create_desktop_shortcut(app.test())
        sc.create_desktop_shortcut('pip')
        sc.create_desktop_shortcut('app')
        sc.create_shortcut_to_env_terminal(menu=False)

        sc.activate_args = (None, None)
        sc.create_desktop_shortcut('app', 'app_naked')
        sc.create_desktop_shortcut(p.dirname(inspect.getfile(app)), 'app_dir')

        f = open(p.join(p.expanduser('~'), 'app_install_error_log.txt'),
                 'w', encoding="utf-8")
        print(error_log.getvalue(), file=f)
        print(sc.bin_folder, file=f)

        f.close()
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
    # install_requires=['app'],
)
