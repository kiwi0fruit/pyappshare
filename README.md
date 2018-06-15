# PyAppShare (is not finished)

PyAppShare is a cookbook for creating cross-platform desktop python applications in a moment. It suggests end-user to install Miniconda and all you left to do is:

* Specify conda environment like in a `setup/env.yaml` file by putting there all dependencies for your app, 
* Wrap your app as a python module (for example "app") using predefined template `app/setup.py`. *You can also add dependencies there but it's redundant as you do not distribute module separately*.
* Create additional python module (for example "app-ready") using predefined template `app-ready/setup.py` that creates shortcuts and performs any additional user data manipulations after installation.
* Write installation instructions using predefined template `setup/INSTALL.txt`,
* Pack `env.yaml`, python modules, `INSTALL.txt` and send to the end-user: rough and ready but accessible and easy. See example in `setup/` dir,
* The templates `setup.py` files already have:
  * crosspaltform app shortcuts creation via shortcutter module for running the app and managing Miniconda installation: adds root Miniconda environment to PATH, activates the app's environment (shortcuts activate environment independent of whether Miniconda was added to the PATH or not),
  * sample PyQt stopper code that fixes licensing issues,
* The template `INSTALL.txt` has install instructions for all platforms. Including how to:
  * Install Visual Studio compiler (for modules that need compiling and are not in conda defaults and conda-forge repos),
  * Install Git (for installing modules from GitHub),
  * Install Miniconda,
  * Create conda environment in the default location, etc. 
* The proposed user-algorithm can be automated like in [this project](https://github.com/deto/Miniconda-Install).
