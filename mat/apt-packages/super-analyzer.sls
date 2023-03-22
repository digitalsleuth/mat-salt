# Name: super-android-analyzer
# Website: https://github.com/SUPERAndroidAnalyzer/super
# Description: Vulnerability assessment tool for Android Applications
# Category: Android
# Author: Iban Equia (https://medium.com/@Razican)
# License: GNU General Public License v3.0 (https://github.com/SUPERAndroidAnalyzer/super/blob/master/LICENSE)
# Version: 0.5.1
# Notes: super-analyzer

mat-apt-packages-super-analyzer:
  file.managed:
    - name: /usr/local/src/super-analyzer_0.5.1_debian_amd64.deb
    - source: https://github.com/SUPERAndroidAnalyzer/super/releases/download/0.5.1/super-analyzer_0.5.1_debian_amd64.deb
    - source_hash: 3e4cf2bb358d49410aa5b49b8635df6c2e1ad5bb61574e85079bdac9f48b8926

mat-apt-packages-super-analyzer-installed:
  pkg.installed:
    - sources:
      - super-analyzer: /usr/local/src/super-analyzer_0.5.1_debian_amd64.deb
    - watch:
      - file: mat-apt-packages-super-analyzer

mat-apt-packages-super-analyzer-cleanup:
  file.absent:
    - name: /usr/local/src/super-analyzer_0.5.1_debian_amd64.deb
    - watch:
      - pkg: mat-apt-packages-super-analyzer-installed
