# Python portable assistant (for Windows)

Python portable assistant is a set of batch scripts (and also standards of writing new batch scripts) that partially automate the process of creation of standalone Python applications for Windows. It's intended to be used with Anaconda packages repository and Qt-PySide. It also supports rapid concurrent creation of applications for 32 bit and 64 bit operational systems and for different Python versions. 

- The instructions of setting up are given in [__Setting up Python portable assistant (for Windows).md](https://github.com/kiwi0fruit/python-portable-assistant/blob/master/__Setting%20up%20Python%20portable%20assistant%20(for%20Windows).md).

- The assistant uses Miniconda Python distribution and it's package repository as a basis but also allows using pip (sure he does).

- The workflow of creating standalone application is inteded to consist of writing the scripts that are pretty short:
    
    - `apps\<<ApplicationName>>\shortcuts.cmd`
	
    - `envs\<<PythonEnvironmentName>>\<<PythonVersion>>.yml`
	
    - `envs\<<PythonEnvironmentName>>\download.cmd` *(optional)*
	
    - `envs\<<PythonEnvironmentName>>\install.cmd`

- Some batch scripts were written to allow legal redistribution of MKL libraries. According to [Anaconda EULA](https://docs.continuum.io/anaconda/eula) we are *“authorized to redistribute the MKL binaries with Anaconda or in the conda package that contains them”*. As assistant doesn't use Anaconda but uses Miniconda so the MKL should be redistributed in a conda package. And as stated [here](http://conda.pydata.org/docs/intro.html) *“A conda package is a compressed tarball file that contains system-level libraries, Python or other modules, executable programs, or other components”* so the only convenient option seem to be include `mkl-*.tar.bz2` file to the distribution and allow end-user to install it offline. So batch scripts were written to automate this without manually specifying any parameters.

- The redistribution of MKL seems to be incompatible with GPL modules. So be aware of PyQt. Modules that can import from PyQt are also may cause troubles. See next point.

- Some patches are applied semi-automatically in order to make sure that packages like QtPy, PyQtGraph and Enaml can not import from PyQt and so can be legally distributed and used without GPL-infecting the whole project (and also infecting with [Riverbank GPL Exception](https://github.com/cms-externals/pyqt/blob/master/GPL_EXCEPTION.TXT)). At the moment I'm not sure completely that this solves the problem (see [this question](http://kiwi0fruit.tumblr.com/post/145394097575) for more details) so use at your own risk.
