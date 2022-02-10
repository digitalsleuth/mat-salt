{%- set base_url = "https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-" -%}
{%- set version = "4.11.1" -%}
{%- set filename = "sleuthkit-4.11.1.tar.gz" -%}
{%- set hash = "8ad94f5a69b7cd1a401afd882ab6b8e5daadb39dd2a6a3bbd5aecee2a2ea57a0" -%}

# Name: SleuthKit
# Website: https://www.sleuthkit.org/sleuthkit
# Description: Analyze disk images and recover artifacts
# Category:
# Author: Brian Carrier and others
# License: IBM Public License, Common Public License, GNU General Public License (GPL) v2 (https://www.sleuthkit.org/sleuthkit/licenses.php)
# Notes: For a listing of commands, see http://wiki.sleuthkit.org/index.php?title=TSK_Tool_Overview

include:
  - mat.repos.gift
  - mat.apt-packages.libewf-dev
  - mat.apt-packages.libvmdk-dev
  - mat.apt-packages.libafflib-dev
  - mat.apt-packages.zlib1g-dev
  - mat.apt-packages.libvhdi-dev
  - mat.apt-packages.build-essential

mat-apt-packages-sleuthkit-source:
  file.managed:
    - name: /usr/local/src/mat/files/{{ filename }}
    - source: {{ base_url }}{{ version }}/{{ filename }}
    - source_hash: sha256={{ hash }}
    - makedirs: true

mat-apt-packages-sleuthkit-archive:
  archive.extracted:
    - name: /usr/local/src/mat/
    - source: /usr/local/src/mat/files/{{ filename }}
    - enforce_toplevel: true
    - watch:
      - file: mat-apt-packages-sleuthkit-source

mat-apt-packages-sleuthkit-configure:
  cmd.run:
    - name: ./configure && make && make install
    - cwd: /usr/local/src/mat/sleuthkit-{{ version }}
    - watch:
      - archive: mat-apt-packages-sleuthkit-archive

mat-apt-packages-sleuthkit-rm-dir:
  file.absent:
    - name: /usr/local/src/mat/sleuthkit-{{ version }}
    - watch:
      - cmd: mat-apt-packages-sleuthkit-configure
