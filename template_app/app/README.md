# App

Imports `test` function, has `app` CLI executable
that prints PATH to show that the app runs in the
activated environment.

`app-ready` CLI creates desktop shortcuts to app executable and
app module folder via shortcutter.


# Build instructions

To run the script open Bash terminal, then type <code>. </code> (dot with space), then
drag and drop the script to the Bash terminal (the script will change CWD itself), press enter.

* open terminal with activated environment,
* run `build` script,
* copy python module from `dist/` whenever you want.


Hint: easily create shortcut to activated 
environment via Shortcutter:

* cross-platform installation:

      conda install -c defaults -c conda-forge shortcutter
      shortcutter --terminal

* To start Git Bash on windows (installed to default location)
  type `%b%` in the terminal created via Shortcutter
