#!/bin/bash
set -e
TMPDIR=$(mktemp -d)

echo Downloading Miniconda...
curl --progress-bar https://repo.anaconda.com/miniconda/Miniconda2-latest-MacOSX-x86_64.pkg -o "$TMPDIR/conda.pkg"

echo
echo Installing Miniconda...
installer -pkg "$TMPDIR/conda.pkg" -target CurrentUserHomeDirectory

echo
echo Installing SR Turtle dependencies...
export PATH=$HOME/opt/miniconda2/bin:$PATH
set -v
pip install pygame
pip install pyyaml
pip install pypybox2d
set +v

