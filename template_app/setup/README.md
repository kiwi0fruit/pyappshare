# Installation

1. Install [Miniconda3](https://conda.io/miniconda.html)
  (this instruction is for Python 3.6+). I suggest
  installing to default location and not adding Miniconda
  to the PATH unless you have a reason - the app starts
  nicely via shortcut to be created.
    * on Windows installation is straight-forward,
    * [Linux install instruction](https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html)
      (open folder with downloaded Miniconda in the terminal before running the command),
    * [macOS install instruction](https://docs.conda.io/projects/conda/en/latest/user-guide/install/macos.html).

2. If on **Windows** install [Git Bash](https://git-scm.com/downloads).
  Install instructions are straight-forward.

3. _(Optional if on Unix. Needed only if the app developer is
  lazy and the environment installs modules from GitHub)_
  Install [Git](https://git-scm.com/downloads).
  Install instructions are straight-forward. Another
  option on macOS is to install the Xcode Command
  Line Tools. On Mavericks (10.9) or above you can
  do this simply by trying to run git from the
  Terminal the very first time.

       git --version

    If you don’t have it installed already, it will
    prompt you to install it.
    
    _**UPD for developer: or you can add git to conda deps.**_

4. _(Optional. Needed only if the app developer is
  lazy and the environment compiles some modules)_
  If on Windows install
  [Build Tools for Visual Studio 2017](https://www.visualstudio.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=15)
  from [visualstudio.com](https://www.visualstudio.com/downloads/).
  Check Windows 8.1 SDK and Windows 10 SDK options.
  Previous version:
  [Microsoft Visual C++ Build Tools 2015](https://go.microsoft.com/fwlink/?LinkId=691126).

5. Create conda environment with the app:

    - open *this folder* in terminal (if on Windows:
      right mouse click in the white space of the current folder then "Git Bash Here"),
    - type `. ./install`, enter,  

      >  **or**  

    - open terminal (Git Bash if on Windows),
    - type dot (`.`), type space (` `),
    - drag'n'drop `install` script to the terminal, enter  


## Uninstall

If you need to uninstall environment - run terminal with
activated root conda environment. Then type:

    conda remove --name app --all
    conda env remove --name app

Sometimes conda environment is not deleted but renamed and placed to special trash
folder inside root Miniconda installation. It's out of action this way but still takes
disk space. You may need to delete it via `conda clean --help`. Manually deleting may
break your conda installation.


## Reinstall

If you need to reinstall the app (this would be with latest packages) simply run
installation again: it will delete the appropriate environment first.

*Save this folder somewhere in case you would like to reinstall it in future*.
