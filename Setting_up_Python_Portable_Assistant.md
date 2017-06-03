# Setting up Python portable assistant (for Windows)

1\) Path to Python portable assistant folder should contain english names only.

2\) Make sure that there are no Python distributions in the PATH. To do this run
```
echo %PATH%
```
3\) Install [Miniconda Python 3.6+ 64-bit](https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86_64.exe) to the folder that ends with **64**. For example to
```
<ThePath>\Miniconda\Miniconda3_x64
```
4\) Install [Miniconda Python 2.7 32-bit](https://repo.continuum.io/miniconda/Miniconda2-latest-Windows-x86.exe) to the folder that ends with **32**. For example to
```
<ThePath>\Miniconda\Miniconda2_win32
```
You can also install [Miniconda Python 3.6 32-bit](https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86.exe) to the folder that ends with **32**. For example to
```
<ThePath>\Miniconda\Miniconda3_win32
```
Actually these two root python installations would do almost the same (all important packages will be installed to the conda environment). But only 2.7 version might be able to run on Windows XP. And the 3.6 version may support non-english names in the path to portable python app that would be created (but I'm not sure).

5\) `<ThePath>` should contain english names only and be the same for both 32-bit and 64-bit versions. At this point Python version does not matter much. But python 2.7 32 bit is preferable for old Windows versions compatibility. More info [here](http://conda.pydata.org/miniconda.html).

6\) Install [Notepad++](https://notepad-plus-plus.org/download) with default settings.

7\) Install [Git](https://git-scm.com/downloads) with default settings.

8\) (*Optional*) Install [7-Zip](http://www.7-zip.org/) for creation of SFX archives.

9\) Install compiler for Python 3.5. Install [Microsoft Visual C++ Build Tools 2015](https://go.microsoft.com/fwlink/?LinkId=691126). Install it with Windows SDK 8.1. More info [here](https://blogs.msdn.microsoft.com/vcblog/2016/03/31/announcing-the-official-release-of-the-visual-c-build-tools-2015/).

10\) Install compiler for Python 2.7. Install [Microsoft Visual C++ Compiler for Python 2.7](https://www.microsoft.com/en-us/download/details.aspx?id=44266) (It is stable but has no OpenMP support). Then run:
```
setx -m VS90COMNTOOLS "%LOCALAPPDATA%\Programs\Common\Microsoft\Visual C++ for Python\9.0"
```
**IMPORTANT**: `setx` command works only with administrator privileges and it's changes are available only after command prompt restart.

11\) Use `0 <...>.cmd`, `N <...>.cmd`, `10 <...>.cmd` files in this folder to change variables and start scripts. These scripts do the same as described in this file below and in [envs/enaml_test/information.md](envs/enaml_test/information.md).

12\) Edit `0 set pypath = X set pyout = Y.cmd` file and specify the system variables:
```
setx -m pypath <ThePath>\Miniconda
setx -m pyout <OutPath>
```
`<ThePath>` is the path to the folder that contain Miniconda32 and Miniconda64 folders (e.g. `C:\Miniconda`)

`<OutPath>` should contain english names only. It's the path to the folder (e.g. `D:`) to which __one folder only__ with portable Python app will be copied. The copied folder will be named `%pyapp%-32bit-%pyver%.7z` or `%pyapp%-64bit-%pyver%.7z` (see below the new variables).
