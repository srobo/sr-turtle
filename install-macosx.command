#!/bin/bash
set -e
# Search for Homebrew
brew --version > /dev/null || (echo 'No Homebrew detected. Please install Homebrew from http://brew.sh/' ; false)

# Install from Homebrew
export PATH=/usr/local/miniconda2/bin:$PATH
set -v
brew cask install miniconda2
pip install pygame
pip install pyyaml
pip install pypybox2d
set +v

# Create runner script

