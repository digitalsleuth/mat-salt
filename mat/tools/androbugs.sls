# Name: androbugs
# Website: https://github.com/Androbugs/Androbugs_Framework
# Description:
# Category:
# Author: 
# License: 
# Notes: 

{% set files = ["AndroBugs_MassiveAnalysis.py","AndroBugs_ReportByVectorKey.py","AndroBugs_ReportSummary.py","androbugs.py"] %}

include:
  - mat.apt-packages.python2
  - mat.apt-packages.git
  - mat.python2-packages.pymongo

mat-tools-androbugs-source:
  git.latest:
    - name: https://github.com/Androbugs/Androbugs_Framework.git
    - target: /usr/local/androbugs/
    - user: root
    - branch: master
    - force_fetch: True
    - force_checkout: True
    - force_clone: True
    - force_reset: True
    - require:
      - sls: mat.apt-packages.git
      - sls: mat.apt-packages.python2
      - sls: mat.python2-packages.pymongo

{% for file in files %}
mat-tools-androbugs-shebang-{{ file }}:
  file.prepend:
    - name: /usr/local/androbugs/{{ file }}
    - text: '#!/usr/bin/env python2'
    - require:
      - git: mat-tools-androbugs-source

mat-tools-androbugs-permissions-{{ file }}:
  file.managed:
    - name: /usr/local/androbugs/{{ file }}
    - mode: 755
    - require:
      - git: mat-tools-androbugs-source

mat-tools-androbugs-wrapper-{{ file }}:
  file.managed:
    - name: /usr/local/bin/{{ file }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - /usr/bin/python2 /usr/local/androbugs/{{ file }} ${*}
    - watch:
      - file: mat-tools-androbugs-permissions-{{ file }}

#mat-tools-androbugs-symlink-{{ file }}:
#  file.symlink:
#    - target: /usr/local/androbugs/{{ file }}
#    - name: /usr/local/bin/{{ file }}
#    - mode: 755
#    - watch:
#      - file: mat-tools-androbugs-shebang-{{ file }}

{% endfor %}

