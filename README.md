# PyAppShare

PyAppShare is a cookbook for creating cross-platform desktop python applications in a moment. It suggests end-user to install Miniconda and all you left to do is:

* Specify conda environment like in a [`setup/env_unix.yaml`](template_app/setup/env_unix.yaml) file by putting there all dependencies for your app, 
* Wrap your app as a python module (for example "app") using predefined template [`app/setup.py`](template_app/app/setup.py). *You can also add dependencies there but it's redundant if you do not plan to distribute the module separately*.
* Create additional python module (for example "app-ready") using predefined template [`app-ready/setup.py`](template_app/app-ready/setup.py) that creates shortcuts and performs any additional user data manipulations after installation.
* Write installation instructions for the end-user using predefined template [`setup/INSTALL.md`](template_app/setup/INSTALL.md),
* Pack `*.yaml` env, python modules, `INSTALL.md` to zip archive and send to the end-user: rough and ready but accessible and easy. See example in [`setup/`](template_app/setup) dir,
* The templates `setup.py` files already have:
  * cross-platform app shortcuts creation via [shortcutter](https://github.com/kiwi0fruit/shortcutter) module for running the app and managing Miniconda installation. Shortcuts activate Miniconda environment (`app` in case of [`env_unix.yaml`](template_app/setup/env_unix.yaml)) and launch the application (shortcuts activate environment independent of whether Miniconda was added to the PATH or not),
  * **TODO**: sample PyQt stopper code that fixes licensing issues,
* The template [`setup/INSTALL.md`](template_app/setup/INSTALL.md) has install instructions for all platforms. Including how to:
  * **TODO**: Install Visual Studio compiler (for modules that need compiling and are not in conda defaults and conda-forge repos),
  * **TODO**: Install Git (for installing modules from GitHub),
  * Install Miniconda,
  * Create conda environment in the default location, etc. 
* The proposed user-side algorithm can be automated like in [this project](https://github.com/deto/Miniconda-Install).
