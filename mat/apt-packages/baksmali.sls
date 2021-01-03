# Name: baksmali
# Website: https://bitbucket.org/JesusFreke/smali
# Description: Disassembler for the dex format used by Dalvik, Android's Java VM implementation.
# Category: 
# Author: Ben Gruver
# License: Apache License 2.0 (https://bitbucket.org/JesusFreke/smali/src/master/NOTICE)
# Notes:

include:
  - mat.repos.remnux

mat-apt-packages-baksmali:
  pkg.installed:
    - name: baksmali
    - pkgrepo: remnux
