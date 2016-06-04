* Run
  `setx -m pyenv enaml_test`

* Restart commnad prompt and run:
  ```
  conda create -n %pyenv%_py35 python=3.5 ply future setuptools pyqtgraph pip wheel vs2015_runtime=14.00.23026.0=0
  conda create -n %pyenv%_py27 python=2.7 enaml pyqtgraph
  activate %pyenv%_%pyver%
  ```

* If using Python 2.7:

  Set compiler to Microsoft Visual C++ for Python (It is stable but has no OpenMP support). For this edit `%pyfolder%\envs\%pyenv%_%pyver%\Lib\distutils\distutils.cfg`:
  ```
  [build]
  compiler = msvc
  ```
  
  or
  
  Install Mingwpy that is the mingw-w64 gcc toolchain customized for building Python extensions (less stable than Microsoft Visual C++ for Python but supports OpenMP):
  ```
  pip install -i https://pypi.anaconda.org/carlkl/simple mingwpy
  ```
  And edit `%pyfolder%\envs\%pyenv%_%pyver%\Lib\distutils\distutils.cfg`:
  ```
  [build]
  compiler = mingw32
  ```

* If using Python 2.7:
  ```
  conda remove --force pyqt sip qt enaml pyqtgraph qtpy
  conda install pyside
  conda install --force --copy enaml pyqtgraph qtpy
  ```
  Hint: patch only packages that were installed with `--copy` parameter.

* If using Python 3.5:
  ```
  pip install git+https://github.com/nucleic/kiwi.git#egg=kiwisolver
  pip install git+https://github.com/MatthieuDartiailh/atom.git@py23#egg=atom
  pip install git+https://github.com/MatthieuDartiailh/enaml.git@parser23#egg=enaml
  ```

* Apply Enaml-PySide patch from [here](https://github.com/frmdstryr/enaml/commit/c9cebd72ac6152217ac8a0689a882576c240ba31). More info [here](https://github.com/nucleic/enaml/pull/111).

* Run `deactivate`

* If using Python 2.7:

  Remove PyQt dependencies: apply patches to Enaml, PyQtGraph and QtPy.
  
  * Apply patches from `files\no_pyqt\enaml`, `files\no_pyqt\pyqtgraph` and `files\no_pyqt\qtpy`.
  
  * Apply patches via Notepad++. For this apply patches to the following files:
  
    `%APPDATA%\Notepad++\session.xml`:
    ```
    <NotepadPlus>
        <Session activeView="0">
            <mainView activeIndex="0" />
            <subView activeIndex="0" />
        </Session>
    </NotepadPlus>
    ```
    
    `%APPDATA%\Notepad++\config.xml`:
    ```
        <GUIConfig name="AppPosition" x="100" y="100" width="600" height="600" isMaximized="no" />
        
    <FindHistory nbMaxFindHistoryPath="10" nbMaxFindHistoryFilter="10" nbMaxFindHistoryFind="10" nbMaxFindHistoryReplace="10" matchWord="no" matchCase="no" wrap="yes" directionDown="yes" fifRecuisive="yes" fifInHiddenFolder="yes" dlgAlwaysVisible="no" fifFilterFollowsDoc="no" fifFolderFollowsDoc="no" searchMode="2" transparencyMode="1" transparency="150" dotMatchesNewline="no">
        <Path name="CustomPathToPythonSitePackages" />
        <Filter name="*.py *.enaml" />
        <Find name="from( )+?pyqt(|5|4)(\.|,|;|:| |\n|\r\n)" />
	<Find name="import( .*? | )pyqt(|5|4)(\.|,|;|:| |\n|\r\n)" />
        <Replace name="from( )" />
    </FindHistory>
	<History nbMaxFile="15" inSubMenu="no" customLength="-1">
    </History>
    ```
    
    Then:
      * replace `CustomPathToPythonSitePackages` → `%pypath%\%pyfolder%\envs\%pyenv%_%pyver%\Lib\site-packages\enaml`
      
      * run Notepad++, press **Ctrl+Shift+F**, use first regular expression and replace in all files.
      
      * replace `CustomPathToPythonSitePackages` → `%pypath%\%pyfolder%\envs\%pyenv%_%pyver%\Lib\site-packages\pyqtgraph`
      
      * run Notepad++, press **Ctrl+Shift+F**, use first regular expression and replace in all files.      

      * replace `CustomPathToPythonSitePackages` → `%pypath%\%pyfolder%\envs\%pyenv%_%pyver%\Lib\site-packages\qtpy`
      
      * run Notepad++, press **Ctrl+Shift+F**, use first regular expression and replace in all files.
      
      * replace `CustomPathToPythonSitePackages` → `%pypath%\%pyfolder%\envs\%pyenv%_%pyver%\Lib\site-packages`
      
      * run Notepad++, press **Ctrl+Shift+F**, use **second** regular expression, make sure that nothing was found (or only comments). If something was found then fix it yourself :) 
