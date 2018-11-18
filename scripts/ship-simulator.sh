#!/usr/bin/env bash

set -e

export PATH=env/bin:${PATH}

pip install pyinstaller

rm -rf dist/ simulator.zip

pyinstaller --paths env/lib/python2.7/site-packages --onefile --clean simulator.py

cp -r games/ sr/ extra/* robot.py dist/

cd dist && zip -lr ../simulator.zip * && cd -
