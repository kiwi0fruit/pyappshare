1. Install [Miniconda3](https://conda.io/miniconda.html)  
(I suggest not adding it to the PATH unless you 
have a reason - the app starts nicely via shortcut 
to be created)

2. Make sure conda is callble from terminal  
(I assume that you didn't change default Miniconda3 
install dir)
    * on Windows:

          cd /d %UserProfile%\Miniconda3\Scripts
          set "PATH=%PATH%;%cd%"

    * on Unix (Linux/macOS):

          cd ~/miniconda3/bin
          export PATH="$PATH:$(pwd)"


3. Go to this dir

4. Run:
    * on Windows:

          conda env create --file env_win.yaml

    * on Unix (Linux/macOS):

          conda env create --file ./env_unix.yaml

5. If you need - Uninstall env:

        conda env remove --name app
