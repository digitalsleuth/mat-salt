# Name: 4n6-scripts
# Website: https://github.com/cheeky4n6monkey/4n6-scripts
# Description: A collection of DFIR scripts
# Category: Scripts
# Author: Adrian Leong
# License: GNU GPL (https://github.com/cheeky4n6monkey/4n6-scripts/raw/master/README.md)
# Notes: 

{% set all_files = {'Android':['fbmsg-extractor.py', 'imgcache-parse-mod.py', 'imgcache-parse.py', 'print_apk_perms.py', 'wwf-chat-parser.py'],
                'Ford':['sync3-unisearch.py', 'sync3-unisearch2kml.py'],
                'Samsung_Gallery3d_2022':['java-hashcode.py', 'samsung_gallery3d_filesysmon_parser_v11.py', 'samsung_gallery3d_log_parser_v10.py', 'samsung_gallery3d_log_parser_v11.py', 'samsung_gallery3d_trash_parser_v10.py'],
                'WindowsPhone8':['WP8_AppPerms.py', 'wp8-1-callhistory.py', 'wp8-1-contacts.py', 'wp8-1-mms-filesort.py', 'wp8-1-mms.py', 'wp8-1-sms.py', 'wp8-callhistory.py', 'wp8-contacts.py', 'wp8-fb-msg.py', 'wp8-sha256-pin-finder.py', 'wp8-sms.py'],
                'iOS':['ios14_maps_history.py', 'vmail-db-2-html.pl'],
                'perl':['bing-bar-parser.pl', 'docx-font-extractor.pl', 'exif2map.pl', 'gis4cookie.pl', 'json-printer.pl', 'sms-grep-sample-config.txt', 'sms-grep.pl'],
                'utilities':['chunkymonkey.py', 'dextract.def', 'dextract.py', 'google-ei-time.py', 'msoffice-pic-extractor.py', 'parse_garmin56LM.py', 'plist2db.py', 's2-cellid2latlong.py', 's2-latlong2cellid.py', 'sqlite-base64-decode.py', 'sqlite-blob-dumper.py', 'sqlite-parser.pl', 'squirrelgripper.pl', 'timediff32.pl']
                } %}

{% set py2shebang = ['fbmsg-extractor.py','imgcache-parse-mod.py','imgcache-parse.py','print_apk_perms.py','wwf-chat-parser.py','sync3-unisearch.py','sync3-unisearch2kml.py',
                     'WP8_AppPerms.py','wp8-1-callhistory.py','wp8-1-contacts.py','wp8-1-mms-filesort.py','wp8-1-mms.py','wp8-1-sms.py','wp8-callhistory.py','wp8-contacts.py','wp8-fb-msg.py',
                     'wp8-sms.py','chunkymonkey.py','dextract.py','google-ei-time.py','msoffice-pic-extractor.py','s2-cellid2latlong.py','s2-latlong2cellid.py'] %}
{% set noshebang = ['sqlite-base64-decode.py','sqlite-blob-dumper.py','wp8-sha256-pin-finder.py'] %}
{% set py3shebang = ['java-hashcode.py','samsung_gallery3d_filesysmon_parser_v11.py','samsung_gallery3d_log_parser_v10.py','samsung_gallery3d_log_parser_v11.py','samsung_gallery3d_trash_parser_v10.py'] %}

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

{% for folder, files in all_files.items() %}
{% for file in files %}
mat-scripts-cheeky4n6monkey-move-{{ file }}:
  file.copy:
    - name: /usr/local/bin/{{ file }}
    - source: /usr/local/src/4n6-scripts/{{folder}}/{{ file }}
    - force: True
    - mode: 755
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source
{% endfor %}
{% endfor %}

{% for file in py2shebang %}
mat-scripts-cheeky4n6monkey-py2shebang-return-{{ file }}:
  file.replace:
    - name: /usr/local/bin/{{ file }}
    - pattern: '#! /usr/bin/env python\r'
    - repl: '#!/usr/bin/env python2'
    - count: 1
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source
{% endfor %}

{% for file in py2shebang %}
mat-scripts-cheeky4n6monkey-py2shebang-newline-{{ file }}:
  file.replace:
    - name: /usr/local/bin/{{ file }}
    - pattern: '#! /usr/bin/env python\n'
    - repl: '#!/usr/bin/env python2\n'
    - count: 1
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source
{% endfor %}

mat-scripts-cheeky4n6monkey-plist2dbpy-shebang:
  file.prepend:
    - name: /usr/local/bin/plist2db.py
    - text: '#!/usr/bin/env python3'
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source

{% for file in py3shebang %}
mat-scripts-cheeky4n6monkey-py3shebang-{{ file }}:
  file.replace:
    - name: /usr/local/bin/{{ file }}
    - pattern: '#! /usr/bin/env python\n'
    - repl: '#!/usr/bin/env python3\n'
    - count: 1
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source
{% endfor %}

{% for file in noshebang %}
mat-scripts-cheeky4n6monkey-add-shebang-{{ file }}:
  file.prepend:
    - name: /usr/local/bin/{{ file }}
    - text: '#!/usr/bin/env python2'
    - watch:
      - git: mat-scripts-cheeky4n6monkey-source
{% endfor %}
