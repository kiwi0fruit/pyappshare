from setuptools import setup
from setuptools.command.install import install


class PostInstallCommand(install):
    def run(self):
        from shortcutter import ShortCutter
        from app import test
        import io
        import os
        error_log = io.StringIO()
        sc = ShortCutter(error_log=error_log)
        sc.create_desktop_shortcut(test())
        sc.create_desktop_shortcut('pip')

        f = open(os.path.join(os.path.expanduser('~'), 'app_install_error_log.txt'),
                 'w', encoding="utf-8")
        print(error_log.getvalue(), file=f)
        print(sc.bin_folder, sc.site_packages, file=f)
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

    install_requires=['app'],
)
