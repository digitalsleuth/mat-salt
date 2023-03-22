# Name: AndroidProjectCreator
# Website: https://maxkersten.nl/projects/androidprojectcreator
# Description: Convert an Android APK application file into an Android Studio project for easier analysis.
# Category: Android
# Author: Max Kersten: https://twitter.com/LibraAnalysis
# License: GNU General Public License (GPL) v3 (https://github.com/ThisIsLibra/AndroidProjectCreator/blob/master/LICENSE)
# Version: 1.5
# Notes: Run `AndroidProjectCreator -compactInstall` before first usage to download the latest depenencies. Use Android Studio to examine the output of the tool.

include:
  - mat.repos.remnux
  - mat.apt-packages.default-jdk

android-project-creator:
  pkg.installed:
    - pkgrepo: remnux
    - require:
      - sls: mat.apt-packages.default-jdk

mat-apt-packages-android-project-install:
  cmd.run:
    - name: AndroidProjectCreator -compactInstall
    - unless: ls /opt/AndroidProjectCreator/library
    - require:
      - pkg: android-project-creator
