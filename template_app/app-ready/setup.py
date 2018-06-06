from setuptools import setup
from setuptools.command.install import install


class PostInstallCommand(install):
    """
    Post-installation for installation mode.
    """
    def run(self):
        # ---------------------------------
        from shortcutter import ShortCutter
        from app import test

        sc = ShortCutter()
        sc.create_desktop_shortcut(test())

        # ---------------------------------
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
