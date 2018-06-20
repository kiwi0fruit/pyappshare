# Installation

1. Install [Miniconda3](https://conda.io/miniconda.html)
  (this instruction is for Python 3.6). I suggest
  not adding Miniconda to the PATH unless you have a
  reason - the app starts nicely via shortcut to be
  created.
    * on Windows installation is straight-forward,
    * [Linux install instruction](https://conda.io/docs/user-guide/install/linux.html),
    * [macOS install instruction](https://conda.io/docs/user-guide/install/macos.html).

2. _(Optional. Needed only if the app developer is
  lazy)_ Install [Git](https://git-scm.com/downloads).
  Install instructions are straight-forward. Another
  option on macOS is to install the Xcode Command
  Line Tools. On Mavericks (10.9) or above you can
  do this simply by trying to run git from the
  Terminal the very first time.

       git --version

    If you don’t have it installed already, it will
    prompt you to install it.

3. _(Optional. Needed only if the app developer is
  lazy)_ If on Windows install
  [Build Tools for Visual Studio 2017](https://www.visualstudio.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=15)
  from [visualstudio.com](https://www.visualstudio.com/downloads/).
  Check Windows 8.1 SDK and Windows 10 SDK options.
  Previous version:
  [Microsoft Visual C++ Build Tools 2015](https://go.microsoft.com/fwlink/?LinkId=691126).

2. Create conda environment with the app:
    * on Windows: run `install_win.bat` in this folder.  
      The script will close on error. To debug press `start`,
      type `cmd`, press enter - you will launch a command
      prompt. Then drag'n'drop `install_win.bat` into the
      cmd window, press enter.

    * on Linux/macOS: open this folder in terminal, run
      `. ./install_unix` (current working dir should be this
      folder).

    * I assume that you didn't change default Miniconda3
      install dir (`%UserProfile%\Miniconda3` or
      `~/miniconda3`). Otherwise edit `install_win.bat` or
      `install_unix` script accordingly and run it
      (on Linux you can drag'n'drop Miniconda folder to the
      terminal then copy it's path from terminal to the
      text editor).

4. If you need to uninstall environment - run terminal with
  activated root conda environment. Then type:

       conda env remove --name app
