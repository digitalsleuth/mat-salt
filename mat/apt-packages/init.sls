include:
  - mat.apt-packages.android-tools-adb
#  - mat.apt-packages.android-project-creator
  - mat.apt-packages.automake
  - mat.apt-packages.bison
  - mat.apt-packages.build-essential
  - mat.apt-packages.cherrytree
  - mat.apt-packages.curl
  - mat.apt-packages.dbus-x11
  - mat.apt-packages.default-jre
  - mat.apt-packages.docker
  - mat.apt-packages.firefox
  - mat.apt-packages.flex
  - mat.apt-packages.git
  - mat.apt-packages.libjansson-dev
  - mat.apt-packages.libmagic-dev
  - mat.apt-packages.libprotobuf-c-dev
  - mat.apt-packages.libreadline-dev
  - mat.apt-packages.libssl-dev
  - mat.apt-packages.libswt-gtk-4-java
  - mat.apt-packages.libtool
  - mat.apt-packages.nodejs
  - mat.apt-packages.openssh
  - mat.apt-packages.perl
  - mat.apt-packages.pkg-config
  - mat.apt-packages.procyon-decompiler
  - mat.apt-packages.protobuf-compiler
  - mat.apt-packages.python2
  - mat.apt-packages.python2-pip
  - mat.apt-packages.python3
  - mat.apt-packages.python3-pip
  - mat.apt-packages.python3-pyqt5
  - mat.apt-packages.python3-tk
  - mat.apt-packages.python3-venv
  - mat.apt-packages.python3-virtualenv
  - mat.apt-packages.radare2
  - mat.apt-packages.ruby-full
  - mat.apt-packages.scrcpy
  - mat.apt-packages.sleuthkit
  - mat.apt-packages.software-properties-common
  - mat.apt-packages.sqlite3
  - mat.apt-packages.sqlitebrowser
  - mat.apt-packages.sudo
  - mat.apt-packages.super-analyzer
  - mat.apt-packages.unzip
  - mat.apt-packages.virtualenv
  - mat.apt-packages.wireshark
  - mat.apt-packages.xdg-utils

mat-apt-packages:
  test.nop:
    - require:
      - sls: mat.apt-packages.android-tools-adb
#      - sls: mat.apt-packages.android-project-creator
      - sls: mat.apt-packages.automake
      - sls: mat.apt-packages.bison
      - sls: mat.apt-packages.build-essential
      - sls: mat.apt-packages.cherrytree
      - sls: mat.apt-packages.curl
      - sls: mat.apt-packages.dbus-x11
      - sls: mat.apt-packages.default-jre
      - sls: mat.apt-packages.docker
      - sls: mat.apt-packages.firefox
      - sls: mat.apt-packages.flex
      - sls: mat.apt-packages.git
      - sls: mat.apt-packages.libjansson-dev
      - sls: mat.apt-packages.libmagic-dev
      - sls: mat.apt-packages.libprotobuf-c-dev
      - sls: mat.apt-packages.libreadline-dev
      - sls: mat.apt-packages.libssl-dev
      - sls: mat.apt-packages.libswt-gtk-4-java
      - sls: mat.apt-packages.libtool
      - sls: mat.apt-packages.nodejs
      - sls: mat.apt-packages.openssh
      - sls: mat.apt-packages.perl
      - sls: mat.apt-packages.pkg-config
      - sls: mat.apt-packages.procyon-decompiler
      - sls: mat.apt-packages.protobuf-compiler
      - sls: mat.apt-packages.python2
      - sls: mat.apt-packages.python2-pip
      - sls: mat.apt-packages.python3
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.python3-pyqt5
      - sls: mat.apt-packages.python3-tk
      - sls: mat.apt-packages.python3-venv
      - sls: mat.apt-packages.python3-virtualenv
      - sls: mat.apt-packages.radare2
      - sls: mat.apt-packages.ruby-full
      - sls: mat.apt-packages.scrcpy
      - sls: mat.apt-packages.sleuthkit
      - sls: mat.apt-packages.software-properties-common
      - sls: mat.apt-packages.sqlite3
      - sls: mat.apt-packages.sqlitebrowser
      - sls: mat.apt-packages.sudo
      - sls: mat.apt-packages.super-analyzer
      - sls: mat.apt-packages.unzip
      - sls: mat.apt-packages.virtualenv
      - sls: mat.apt-packages.wireshark
      - sls: mat.apt-packages.xdg-utils
