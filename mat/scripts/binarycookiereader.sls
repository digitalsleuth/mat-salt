# Name: binarycookiereader.py
# Website: https://github.com/digitalsleuth/BinaryCookieReader
# Description: A tool to read the binarycookie format of Cookies on iOS applications
# Category: iOS
# Author: Satishb3
# License: Free, Unknown License
# Notes: binarycookiereader.py

mat-scripts-binarycookiereader:
  file.managed:
    - name: /usr/local/bin/binarycookiereader.py
    - source: https://github.com/digitalsleuth/BinaryCookieReader/raw/master/binarycookiereader.py
    - source_hash: sha256=ef58db8caa640db0a9ed6a0f5216e4b556785ea59b272bd61786f62f26a0907f
    - mode: 755

