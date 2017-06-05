# Python portable assistant (for Windows)


[Python portable assistant](https://github.com/kiwi0fruit/python-portable-assistant) is a set of batch scripts (and also standards of writing new batch scripts) that partially automate the process of creation of standalone Python applications for Windows. It has is a user inteface via batch scripts and configs. It's intended to be used with Anaconda packages repository and Qt-PySide. It also supports rapid concurrent creation of applications for 32 bit and 64 bit operational systems and for different Python versions.

- Here are the [instructions of setting up Python Portable Assistant][setup].

- The assistant uses Miniconda Python distribution and it's package repository as a basis but also allows using pip (sure it does).

- The work-flow of creating standalone application is intended to consist of writing scripts that are pretty short:

    - `apps\<AppName>\shortcuts.ps1`

    - `envs\<PyEnvName>\<PyVer>.yml`

    - `envs\<PyEnvName>\download.cmd` *(optional)*

    - `envs\<PyEnvName>\install.cmd`

- Some batch scripts were written to allow legal redistribution of MKL libraries. According to [Anaconda EULA](https://docs.continuum.io/anaconda/eula) we are *“authorized to redistribute the MKL binaries with Anaconda or in the conda package that contains them”*. As assistant doesn't use Anaconda but uses Miniconda so the MKL should be redistributed in a conda package. And as stated [here](http://conda.pydata.org/docs/intro.html) *“A conda package is a compressed tarball file that contains system-level libraries, Python or other modules, executable programs, or other components”* so the only convenient option seems to include `mkl-*.tar.bz2` file to the distribution and allow end-user to install it off-line. So batch scripts were written to automate this without manually specifying any parameters.

- The redistribution of MKL seems to be incompatible with GPL modules. So be aware of PyQt. Modules that can import from PyQt may cause troubles too (see next point).

- Some patches are applied semi-automatically in order to make sure that packages like QtPy, PyQtGraph and Enaml can not import from PyQt and so can be legally distributed and used without GPL-infecting the whole project (and also infecting with [Riverbank GPL Exception](https://github.com/cms-externals/pyqt/blob/master/GPL_EXCEPTION.TXT)). At the moment I'm not sure completely that this solves the problem (see [this question](http://kiwi0fruit.tumblr.com/post/145394097575) for more details) so use it at your own risk.

- [Download][enaml_test_download] and [Install][enaml_test_install] example scripts are for working PySide/Enaml installations for different Python versions. 


## Brief description of the work

1. The assistant should be installed to proper folders.
2. Python compilers and Notepad++ should be installed ([example][setup]).
3. User fills PowerShell script that specifies shortcuts to python scripts ([example][shortcuts]).
4. User fills `*.yml` file that specifies conda environment ([example][enaml_test_yml]).
5. User fills *optional* batch script that caches pip wheels and git repositories ([example][enaml_test_download]).
6. User fills batch script that perform additional conda and pip installations, and also patches files if needed ([example][enaml_test_install]).
7. Then the environment is created and patched (if needed). To do this the user edits `0 <...>.cmd` and then successively runs `N <...>.cmd` files: `N = 0,...,9`.
8. Then the Miniconda installation together with environment is copied to new folder. This folder already contains everything needed for distribution ([example][output_example]). So the folder can be 7-zipped to self extracting archive and sent to end-user (**7z** is preferable to **zip** because root python and environment python share lots of files and 7zip reuses them).
9. In 8. cached conda and pip packages are not copied to the new folder. MKL package is uninstalled. Mingwpy package is uninstalled. The `tar.bz2` package with latest MKL version is determined in conda cache folder and copied to the new folder. Batch script that can install MKL package on the end-user computer is added. Some absolute paths are replaced.
10. About patches. There are two kinds of them:
  * If needed some patches are applied to the files specified. User also provides original version of the file to be patched. If the specified file's hash checksum matches with the original's file hash then the patch is applied (actually the file is replaced by patched version). If it doesn't match then warning message is shown.
  * If needed regular expressions patches are applied to all files in the specified directories via Notepad++. Notepad++ is automatically opened with automatically added regular expressions. So the user doesn't need to copy-paste anything.


[setup]: Setting_up_Python_Portable_Assistant.md
[shortcuts]: apps/pyqtgraph_to_enaml/shortcuts.ps1
[enaml_test_yml]: envs/enaml_test/py36.yml
[enaml_test_download]: envs/enaml_test/download.cmd
[enaml_test_install]: envs/enaml_test/install.cmd
[output_example]: portable_app_example
