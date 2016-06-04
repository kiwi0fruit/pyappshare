# Setting up Python portable assistant (for Windows)

* Path to Python portable assistant folder should contain english names only. Make sure that there are no Python distributions in the PATH. To do this run 
  `echo %PATH%`

* Install [Miniconda Python 2.7 64-bit](https://repo.continuum.io/miniconda/Miniconda2-latest-Windows-x86_64.exe) to `<<SamePath>>\Miniconda\Miniconda64`.

  Install [Miniconda Python 2.7 32-bit](https://repo.continuum.io/miniconda/Miniconda2-latest-Windows-x86.exe) to `<<SamePath>>\Miniconda\Miniconda32`.

  `<<SamePath>>` should contain english names only. At this point Python version does not matter. More info [here](http://conda.pydata.org/miniconda.html).

* Install [Notepad++](https://notepad-plus-plus.org/download/v6.9.2.html) with default settings.

* Install compiler for Python 3.5.

  Install [Microsoft Visual C++ Build Tools 2015](https://go.microsoft.com/fwlink/?LinkId=691126). Install it with Windows SDK 8.1. More info [here](https://blogs.msdn.microsoft.com/vcblog/2016/03/31/announcing-the-official-release-of-the-visual-c-build-tools-2015/).

* Install compiler for Python 2.7.

  Install [Microsoft Visual C++ Compiler for Python 2.7](https://www.microsoft.com/en-us/download/details.aspx?id=44266) (It is stable but has no OpenMP support). Then run:
  ```
    setx -m VS90COMNTOOLS "%LOCALAPPDATA%\Programs\Common\Microsoft\Visual C++ for Python\9.0"
  ```
  **IMPORTANT**: `setx` command works only with administrator privileges and it's changes are available only after command prompt restart.

* Use `N *.cmd` files in this folder to change variables and start scripts. These scripts do the same as described in this file below and in `envs\<<PythonEnvironmentName>>\information.md`. Here is [an example](https://github.com/kiwi0fruit/python-portable-assistant/blob/master/envs/enaml_test/information.md) of such file.

* Edit `0 set pypath = X set pyout = Y.cmd` file and specify the system variables:
  ```
    setx -m pypath <<SamePath>>\Miniconda
    setx -m pyout <<Output_Path>>
  ```
  First is the path to the folder that contain Miniconda32 and Miniconda64 folders (e.g. `C:\Miniconda`)
  
  `<<Output_Path>>` should contain english names only. It's the path to the folder (e.g. `D:`) to which __one folder only__ with portable Python will be copied. The copied folder will be named `Miniconda32` or `Miniconda64`.

* Run 
  `setx -m pyfolder Miniconda32`
  or
  `setx -m pyfolder Miniconda64`

* Run 
  `setx -m pyver py27`
  or 
  `setx -m pyver py35`

* If using Python 2.7 run 
  `setx -m pycomp msvc`
  or 
  `setx -m pycomp mingwpy`

* Run:
  ```
    setx -m pyenv <<Environment_Name>>
    setx -m pyapp <<Application_Name>>
  ```
  Names should match folder names from `envs` and `apps` folders.

* Python portable assistant (PPA) is an independent program. PPA is automatically included to the portable Python distributions that are createrd with PPA. `enaml_test` environment and `pyqtgraph2enaml` application are distributed with Python portable assistant as examles. If you delete them then PPA that is automatically included when new distribution is created will not have examples. Taking into account that the documentation of PPA is not very good the examples are important part of PPA.
