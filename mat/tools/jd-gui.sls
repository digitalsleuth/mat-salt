# Name: JD-GUI Java Decompiler
# Website: https://java-decompiler.github.io/
# Description: Java decompiler with GUI
# Category: 
# Author: Emmanuel Dupuy
# License: GNU General Public License (GPL) v3: https://github.com/java-decompiler/jd-gui/blob/master/LICENSE
# Notes: jd-gui

include:
  - mat.apt-packages.xdg-utils
  - mat.repos.remnux

mat-xdg-directory-create:
  file.directory:
    - names: 
      - /usr/share/desktop-directories/
      - /usr/share/icons/hicolor/    
    - user: root
    - group: root
    - mode: 755
    - makedirs: true
    - watch:
      - sls: mat.apt-packages.xdg-utils

jd-gui:
  pkg.installed
