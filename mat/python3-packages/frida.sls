# Name: Frida
# Website: https://frida.re
# Description: Trace the execution of a process to analyze its behavior.
# Category:
# Author: Ole Andre Vadla Ravnas
# License: wxWindows Library License 3.1: https://github.com/frida/frida/blob/master/COPYING
# Notes: frida, frida-ps, frida-trace, frida-discover, frida-ls-devices, frida-kill

include:
  - mat.packages.python-pip
  - mat.packages.python3-pip

mat-python3-packages-frida-install:
  pip.installed:
    - name: frida-tools
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.packages.python3-pip
