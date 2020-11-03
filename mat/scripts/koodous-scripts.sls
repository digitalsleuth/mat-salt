{%- set move_scripts = ["compare_apks.py","cromosome.py","feed.py","feed.sh","new_detections.py","pykoodous.py","scan_device.py","search.py","unpack_apk.py"] -%}

include:
  - mat.apt-packages.git
  - mat.apt-packages.python2
  - mat.python2-packages.requests
  - mat.python2-packages.python-magic

mat-scripts-koodous-source:
  git.latest:
    - name: https://github.com/Koodous/Scripts.git
    - target: /usr/local/src/mat/files/koodous-scripts
    - user: root
    - branch: master
    - force_fetch: True
    - force_checkout: True
    - force_clone: True
    - force_reset: True
    - require:
      - sls: mat.apt-packages.git
      - sls: mat.python2-packages.requests
      - sls: mat.python2-packages.python-magic

{% for script in move_scripts -%}
mat-scripts-koodous-move-{{ script }}:
  file.managed:
    - name: /usr/local/bin/{{ script }}
    - source: /usr/local/src/mat/files/koodous-scripts/{{ script }}
    - mode: 755
    - require:
      - git: mat-scripts-koodous-source

mat-scripts-koodous-shebang-{{ script }}:
  file.replace:
    - name: /usr/local/bin/{{ script }}
    - pattern: '#!/usr/bin/python'
    - repl: '#!/usr/bin/env python2'
    - prepend_if_not_found: True
    - count: 1
    - require:
      - file: mat-scripts-koodous-move-{{ script }}

{% endfor -%}
