# Name: simplekml
# Website: https://readthedocs.org/projects/simplekml/
# Description: KML file generator
# Category: System
# Author: Kyle Lancaster, Patrick Eisoldt
# License: GNU GPLv3 (https://github.com/eisoldt/simplekml/blob/master/LICENSE.txt)
# Notes: simplekml

include:
  - mat.apt-packages.python3-pip

simplekml:
  pip.installed:
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
