{%- set files = ['WP8_AppPerms.py','bing-bar-parser.pl','chunkymonkey.py','dextract.def','dextract.py','docx-font-extractor.pl','exif2map.pl','fbmsg-extractor.py','gis4cookie.pl','google-ei-time.py','imgcache-parse-mod.py','imgcache-parse.py','ios14_maps_history.py','json-printer.pl','msoffice-pic-extractor.py','plist2db.py','print_apk_perms.py','s2-cellid2latlong.py','s2-latlong2cellid.py','sms-grep-sample-config.txt','sms-grep.pl','sqlite-base64-decode.py','sqlite-blob-dumper.py','sqlite-parser.pl','squirrelgripper-README.txt','squirrelgripper.pl','timediff32.pl','vmail-db-2-html.pl','wp8-1-callhistory.py','wp8-1-contacts.py','wp8-1-mms-filesort.py','wp8-1-mms.py','wp8-1-sms.py','wp8-callhistory.py','wp8-contacts.py','wp8-fb-msg.py','wp8-sha256-pin-finder.py','wp8-sms.py','wwf-chat-parser.py'] %}
{%- set noshebang = ['sqlite-base64-decode.py','sqlite-blob-dumper.py','wp8-sha256-pin-finder.py'] %}

include:
  - mat.apt-packages.git
  - mat.apt-packages.python2
  - mat.apt-packages.python3
  - mat.perl-packages.exiftool
  - mat.perl-packages.cgi
  - mat.perl-packages.xpath
  - mat.perl-packages.quicktable
  - mat.perl-packages.json
  - mat.perl-packages.dbi
  - mat.perl-packages.datecalc

mat-scripts-cheeky4n6monkey-source:
  git.latest:
    - name: https://github.com/cheeky4n6monkey/4n6-scripts.git
    - target: /usr/local/src/4n6-scripts
    - user: root
    - rev: master
    - force_clone: True
    - require:
      - sls: mat.apt-packages.git
      - sls: mat.apt-packages.python2
      - sls: mat.apt-packages.python3

{%- for file in files %}
mat-scripts-cheeky4n6monkey-{{ file }}:
  file.copy:
    - name: /usr/local/bin/{{ file }}
    - source: /usr/local/src/4n6-scripts/{{ file }}
    - force: True
    - mode: 755
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source
{%- endfor %}

{%- for file in files %}
mat-scripts-cheeky4n6monkey-python-{{ file }}:
  file.replace:
    - name: /usr/local/bin/{{ file }}
    - pattern: '#! /usr/bin/env python\n'
    - repl: '#!/usr/bin/env python2\n'
    - count: 1
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source
{%- endfor %}

mat-scripts-cheeky4n6monkey-plistdb2py-shebang:
  file.prepend:
    - name: /usr/local/bin/plist2db.py
    - text: '#!/usr/bin/env python3'
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source

{%- for file in noshebang %}
mat-scripts-cheeky4n6monkey-add-shebang-{{ file }}:
  file.prepend:
    - name: /usr/local/bin/{{ file }}
    - text: '#!/usr/bin/env python2'
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source
{%- endfor %}


