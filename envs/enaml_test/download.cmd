cd /d "%envcache%"

IF %pyver%==py27 (
	pip download -i https://pypi.anaconda.org/carlkl/simple mingwpy
)

IF not %pyver%==py27 (
	rmdir kiwisolver /s /q
	git clone https://github.com/nucleic/kiwi.git kiwisolver
	rmdir atom /s /q
	git clone -b py23 https://github.com/MatthieuDartiailh/atom.git
	rmdir enaml /s /q
	git clone -b parser23 https://github.com/MatthieuDartiailh/enaml.git
)
