# PyAppShare (is not finished)

Share pyapp is a cookbook for creating cross-platform python applications in a moment. It suggests end-user to install Miniconda and all you left to do is:

* Specify conda environment in a env.yaml file, 
* Wrap your app as a python module using predefined template setup.py,
* Write installation instructions using predefined template INSTALL.txt,
* Pack env.yaml, python module(s), INSTALL.txt and send to the end-user: rough and ready but accessible and easy,
* The template setup.py already has:
  * crosspaltform app shortcuts creation via shortcut(s) module for running the app and managing Miniconda installation: add root Miniconda environment to PATH, activate the app's environment (shortcuts activate environment independent of whether Miniconda was added to the PATH or not),
  * sample PyQt stopper code that fixes licensing issues,
* The template INSTALL.txt has install instructions for all platforms. Including how to:
  * Install Visual Studio compile(for modules that need compiling and are not in conda defaults/conda-forge repo),
  * Install Git (for installing modules from GitHub),
  * Install Miniconda,
  * Create conda environment in the default location, etc. 

