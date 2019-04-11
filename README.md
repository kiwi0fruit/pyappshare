# PyAppShare

PyAppShare is a cookbook for creating cross-platform desktop python applications in a moment: with shortcuts and info how to make sure Qt GUI is LGPL. It suggests end-user to install Miniconda and all you left to do is:

* Specify conda environment like in a [`setup/env/def.yml`](template_app/setup/env/def.yml) file by putting there all dependencies for your app (additional OS'es and pre/post scripts see in [`setup/env`](template_app/setup/env)), 
* Wrap your app as a python module (for example "app") using predefined template [`app/setup.py`](template_app/app/setup.py). *You can also add dependencies there but it's redundant if you do not plan to distribute the module separately*. Create additional exec entry point (for example "app-ready") using predefined template [`app/ready.py`](template_app/app/ready.py) that creates shortcuts and performs any additional user data manipulations after installation.
* Write installation instructions for the end-user using predefined template [`setup/README.md`](template_app/setup/README.md),
* Pack the whole setup folder (with `*.yml` env, python modules, `README.md`, etc.) to zip archive and send to the end-user: rough and ready but accessible and easy. See example in [`setup/`](template_app/setup) dir.


## Examples

* Simple [template_app](./template_app),
* More advanced [Enaml video application](https://github.com/kiwi0fruit/enaml-video-app).
* **NEW**: see example of how to build **conda noarch** package [here](https://github.com/kiwi0fruit/enaml-video-app/tree/master/enaml-video-app) ([meta.yaml](https://github.com/kiwi0fruit/enaml-video-app/blob/master/enaml-video-app/meta.yaml), [build](https://github.com/kiwi0fruit/enaml-video-app/blob/master/enaml-video-app/build)) that is based on the default conda-forge [template](https://github.com/conda-forge/staged-recipes/blob/master/recipes/example/meta.yaml).


## Features

* The templates `setup.py` files already have:
  * Cross-platform app shortcuts creation via [shortcutter](https://github.com/kiwi0fruit/shortcutter) module for running the app and managing Miniconda installation. Shortcuts activate Miniconda environment (`app` in case of [`env/def.yml`](template_app/setup/env/def.yml)) and launch the application (shortcuts activate environment independent of whether Miniconda was added to the PATH or not),
  * Sample code of PyQt stopper-debugger that helps to fix GPL licensing issues was added to the [`app.py`](template_app/app/app/app.py). Actually [these license issues](https://github.com/kiwi0fruit/pyappshare/issues/3) are not that obvious... 
* The template [`setup/README.md`](template_app/setup/README.md) has install instructions for all platforms. Including how to:
  * Install Visual Studio compiler (for modules that need compiling and are not in conda defaults and conda-forge repos) - _needed only if the app developer is lazy_,
  * Install Git (for installing modules from GitHub) - _needed only if the app developer is lazy_,
  * Install Miniconda,
  * Run install script.


# Alternatives and automatic user-side install

The proposed user-side algorithm can be automated like in [Miniconda-Install](https://github.com/deto/Miniconda-Install) but I see no point in complicating things.

There are alternative implementations of app distribution elevating Conda ecosystem:

* [(conda) constructor](https://github.com/conda/constructor),
* [Anaconda Project](https://github.com/Anaconda-Platform/anaconda-project),
* [Conda-Pack](https://github.com/conda/conda-pack)

May be these projects would suit your needs better.
