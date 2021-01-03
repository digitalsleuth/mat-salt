# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

{% set files = ['sysdiagnose-appconduit.py','sysdiagnose-appupdates.py','sysdiagnose-mobileactivation.py','sysdiagnose-mobilebackup.py','sysdiagnose-mobilecontainermanager.py','sysdiagnose-net-ext-cache.py','sysdiagnose-networkinterfaces.py','sysdiagnose-networkprefs.py','sysdiagnose-sys.py','sysdiagnose-uuid2path.py','sysdiagnose-wifi-icloud.py','sysdiagnose-wifi-kml.py','sysdiagnose-wifi-net.py','sysdiagnose-wifi-plist.py'] %}

include:
  - mat.apt-packages.git

mat-scripts-ios-sysdiagnose-source:
  git.cloned:
    - name: https://github.com/cheeky4n6monkey/iOS_sysdiagnose_forensic_scripts
    - target: /usr/local/src/ios-sysdiagnose
    - require:
      - sls: mat.apt-packages.git

{% for file in files %}
mat-scripts-ios-sysdiagnose-shebang-{{ file }}:
  file.replace:
    - name: /usr/local/src/ios-sysdiagnose/{{ file }}
    - pattern: '#! /usr/bin/env python\n'
    - repl: '#!/usr/bin/env python3\n'
    - count: 1
    - prepend_if_not_found: False
    - require:
      - git: mat-scripts-ios-sysdiagnose-source

mat-scripts-ios-sysdiagnose-symlink-{{ file }}:
  file.symlink:
    - target: /usr/local/src/ios-sysdiagnose/{{ file }}
    - name: /usr/local/bin/{{ file }}
    - mode: 755
    - require:
      - git: mat-scripts-ios-sysdiagnose-source

{% endfor %}
