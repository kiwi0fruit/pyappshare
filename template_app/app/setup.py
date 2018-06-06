from setuptools import setup, find_packages


setup(
    name='app',
    version='0.1.0',

    description='My app.',
    url='https://github.com/me/app',
    author='My Name',
    author_email='me@mail.com',
    license='Proprietary',

    packages=find_packages(),
    install_requires=['setuptools'],
    entry_points={
        'console_scripts': [
            'app=app.test:cli',
        ],
    },
    # scripts=[
    #     'scripts/myscript.bat',
    # ],
)
