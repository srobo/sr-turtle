#!/usr/bin/env bash

set -e

export PATH=env/bin:${PATH}

pip install pyinstaller

rm -rf dist/ simulator.zip

pyinstaller --paths env/lib/python2.7/site-packages --onefile --clean run.py

cp -r games/ sr/ extra/* test.py dist/

cd dist && zip -lr ../simulator.zip * && cd -
