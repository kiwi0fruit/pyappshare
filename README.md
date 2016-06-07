# Python portable assistant (for Windows)


Python portable assistant is a set of batch scripts (and also standards of writing new batch scripts) that partially automate the process of creation of standalone Python applications for Windows. It's intended to be used with Anaconda packages repository and Qt-PySide. It also supports rapid concurrent creation of applications for 32 bit and 64 bit operational systems and for different Python versions. 

- The instructions of setting up are given in [__Setting up Python portable assistant (for Windows).md][setup].

- The assistant uses Miniconda Python distribution and it's package repository as a basis but also allows using pip (sure it does).

- The workflow of creating standalone application is inteded to consist of writing scripts that are pretty short:
    
    - `apps\<<ApplicationName>>\shortcuts.cmd`
	
    - `envs\<<PythonEnvironmentName>>\<<PythonVersion>>.yml`
	
    - `envs\<<PythonEnvironmentName>>\download.cmd` *(optional)*
	
    - `envs\<<PythonEnvironmentName>>\install.cmd`

- Some batch scripts were written to allow legal redistribution of MKL libraries. According to [Anaconda EULA](https://docs.continuum.io/anaconda/eula) we are *“authorized to redistribute the MKL binaries with Anaconda or in the conda package that contains them”*. As assistant doesn't use Anaconda but uses Miniconda so the MKL should be redistributed in a conda package. And as stated [here](http://conda.pydata.org/docs/intro.html) *“A conda package is a compressed tarball file that contains system-level libraries, Python or other modules, executable programs, or other components”* so the only convenient option seems to include `mkl-*.tar.bz2` file to the distribution and allow end-user to install it offline. So batch scripts were written to automate this without manually specifying any parameters.

- The redistribution of MKL seems to be incompatible with GPL modules. So be aware of PyQt. Modules that can import from PyQt may cause troubles too (see next point).

- Some patches are applied semi-automatically in order to make sure that packages like QtPy, PyQtGraph and Enaml can not import from PyQt and so can be legally distributed and used without GPL-infecting the whole project (and also infecting with [Riverbank GPL Exception](https://github.com/cms-externals/pyqt/blob/master/GPL_EXCEPTION.TXT)). At the moment I'm not sure completely that this solves the problem (see [this question](http://kiwi0fruit.tumblr.com/post/145394097575) for more details) so use it at your own risk.


## Brief description of the work

1. The assistant should be installed to proper folders.
2. Python compilers and Notepad++ should be installed ([example][setup]). 
3. User fills batch script that specifies shortcuts to python scripts ([example][shortcuts]).
4. User fills `*.yml` file that specifies conda environment ([example][enaml_test_yml]).
5. User fills *optional* batch script that caches pip wheels and git repositories ([example][enaml_test_download]).
6. User fills batch script that perform additional conda and pip installations, and also patches files if needed ([example][enaml_test_install]).
7. The alogorithms from 4-6 are described in the [example][enaml_test_information] description. 
8. Then the environment is created and patched (if needed).
9. Then the Miniconda installation together with environment is copied to new folder. This folder already contains everything needed for distribution. So the folder can be zipped and sent to end-user.
10. In 9. cached conda and pip packages are not copied to the new folder. MKL package is uninstalled. Mingwpy package is uninstalled. The `tar.bz2` package with latest MKL version is determined in conda cache folder and copied to the new folder. Batch script that can install MKL package on the end-user computer is added.
11. About patches. There are two kinds of them:
  - If needed some patches are applied to the files specified. User also provides hash for the file to be patched. If the specified file's hash checksum matches with the provided hash then the patch is applied (actually the file is replaced by patched version). If it doesn't match then warning nessage is shown.
  - If needed regualar expressions patches are applied to all files in the specified directories via Notepad++. Notepadd++ is automatically opened with automatically added regular expressions. So the user doesn't need to copy-paste anything.


[setup]: https://github.com/kiwi0fruit/python-portable-assistant/blob/master/__Setting%20up%20Python%20portable%20assistant%20(for%20Windows).md
[shortcuts]: https://github.com/kiwi0fruit/python-portable-assistant/blob/master/apps/pyqtgraph2enaml/shortcuts.cmd
[enaml_test_yml]: https://github.com/kiwi0fruit/python-portable-assistant/blob/master/envs/enaml_test/py27.yml
[enaml_test_download]: https://github.com/kiwi0fruit/python-portable-assistant/blob/master/envs/enaml_test/download.cmd
[enaml_test_install]: https://github.com/kiwi0fruit/python-portable-assistant/blob/master/envs/enaml_test/install.cmd
[enaml_test_information]: https://github.com/kiwi0fruit/python-portable-assistant/blob/master/envs/enaml_test/information.md
