cd /d "%envcache%"

rmdir stitch /s /q
git clone https://github.com/kiwi0fruit/stitch.git

set URL=https://ci.tensorflow.org/view/Nightly/job/nightly-win/M=windows,PY=36/lastSuccessfulBuild/artifact/cmake_build/tf_python/dist/tensorflow-1.2.1-cp36-cp36m-win_amd64.whl
pip download %URL%
