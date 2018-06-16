# Installation

1. Install [Miniconda3](https://conda.io/miniconda.html) (this instruction
is for Python 3.6). I suggest not adding Miniconda to the PATH unless you
have a reason - the app starts nicely via shortcut to be created.
    * on Windows installation is straight-forward,
    * this is [Linux installation instruction](https://conda.io/docs/user-guide/install/linux.html),
    * this is [macOS installation instruction](https://conda.io/docs/user-guide/install/macos.html).

2. _(Optional. Needed only if the app developer is lazy)_ Install [Git](https://git-scm.com/downloads). Install instructions are
  straight-forward. Another option on macOS is to install the Xcode Command Line Tools.
  On Mavericks (10.9) or above you can do this simply by trying to run git from the Terminal
  the very first time.

       git --version

    If you don’t have it installed already, it will prompt you to install it.

3. _(Optional. Needed only if the app developer is lazy)_ If on Windows install [Build Tools for Visual Studio 2017](https://www.visualstudio.com/ru/thank-you-downloading-visual-studio/?sku=BuildTools&rel=15)
  from [visualstudio.com](https://www.visualstudio.com/ru/downloads/) (as stated [here](https://wiki.python.org/moin/WindowsCompilers#Compilers_Installation_and_configuration)).
  Check Windows 8.1 SDK and Windows 10 SDK options.

2. Make sure conda is callble from terminal. I assume that you didn't change default Miniconda3
  install dir (otherwise drag'n'drop the dir to the terminal window or copy it's path from the file
  manager).
    * on Windows:

          cd /d %UserProfile%\Miniconda3\Scripts
          set "PATH=%PATH%;%cd%"

    * on Unix (Linux/macOS):

          cd ~/miniconda3/bin
          export PATH="$PATH:$(pwd)"

3. Go to this dir and run (drag'n'drop the dir to the terminal window or copy from the file manager):
    * on Windows:

          cd /d <ThisDir>
          conda env create --file env_win.yaml

    * on Unix (Linux/macOS):

          cd <ThisDir>
          conda env create --file ./env_unix.yaml

   * Important: do not specify custom `-p` / `--prefix` path: this might make shortcut creation fail.
4. If you need - Uninstall env:

        conda env remove --name app
