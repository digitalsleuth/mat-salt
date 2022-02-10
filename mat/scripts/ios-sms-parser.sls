# Name: iOS_sms_parser
# Website: https://github.com/digitalsleuth/iOS_sms_parser
# Description: sms.db parser for iOS 7-11.3
# Category: iOS
# Author: Heather Mahalik (maintained by digitalsleuth)
# License: GNU GPL v3 (https://github.com/digitalsleuth/iOS_sms_parser/blob/master/LICENSE)
# Notes: iOS_sms_parser

include:
  - mat.apt-packages.python3

mat-scripts-ios-sms-parser-source:
  file.managed:
    - name: /usr/local/bin/iOS_sms_parser.py
    - source: https://github.com/digitalsleuth/iOS_sms_parser/raw/master/iOS_sms_parser.py
    - source_hash: sha256=0ed5d182985dcc8f1e9422a17c542df1c4c5a1e42861b483a3eae0e384fb6634
    - mode: 755
    - require:
      - sls: mat.apt-packages.python3
