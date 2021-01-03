# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.ruby-full

fileutils:
  gem.installed:
    - require:
      - sls: mat.apt-packages.ruby-full
