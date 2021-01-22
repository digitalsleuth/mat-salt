# Name: cherrytree
# Website: https://www.giuspen.com
# Description: Note taking application
# Category:
# Author: Giuseppe Penone
# License: GNU General Public License v3.0+ (https://github.com/giuspen/cherrytree/blob/master/license.txt)
# Notes: cherrytree

{% if grains['oscodename'] == "bionic" %}

include:
  - mat.apt-packages.libcanberra-gtk-module

cherrytree:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.libcanberra-gtk-module

{% elif grains['oscodename'] == "focal" %}

include:
  - mat.repos.giuspen
  - mat.apt-packages.libcanberra-gtk-module

cherrytree:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.libcanberra-gtk-module
      - sls: mat.repos.giuspen

{% endif %}
