{% set repo_base = 'https://github.com/libimobiledevice' %}
{% set repos = ['libplist', 'libimobiledevice-glue', 'libusbmuxd', 'libimobiledevice', 'usbmuxd', 'ifuse', 'ideviceinstaller', 'libirecovery'] %}

include:
  - mat.apt-packages.python3
  - mat.apt-packages.build-essential
  - mat.apt-packages.git
  - mat.apt-packages.autoconf
  - mat.apt-packages.automake
  - mat.apt-packages.libtool-bin
  - mat.apt-packages.cython3
  - mat.apt-packages.pkg-config
  - mat.apt-packages.libssl-dev
  - mat.apt-packages.libusb-1
  - mat.apt-packages.udev
  - mat.apt-packages.libfuse-dev
  - mat.apt-packages.libreadline-dev
  - mat.apt-packages.libzip-dev

remove-older-libimobile:
  pkg.removed:
    - names:
      - libimobiledevice6
      - libusbmuxd
      - ideviceinstaller
      - libimobiledevice-utils

libimobile-directory:
  file.directory:
    - name: /usr/local/src/libimobile
    - makedirs: True
    - dir_mode: 755
    - user: root
    - group: root
    - recurse:
      - user
      - group
      - mode

python-symlink:
  file.symlink:
    - name: /usr/bin/python
    - target: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3

{% for repo in repos %}

clone-{{ repo }}:
  git.latest:
    - name: {{ repo_base }}/{{ repo }}
    - target: /usr/local/src/libimobile/{{ repo }}
    - require:
      - sls: mat.apt-packages.git

autogen-{{ repo }}:
  cmd.run:
    - name: ./autogen.sh
    - cwd: /usr/local/src/libimobile/{{ repo }}
    - require:
      - git: clone-{{ repo }}
      - sls: mat.apt-packages.python3
      - sls: mat.apt-packages.build-essential
      - sls: mat.apt-packages.autoconf
      - sls: mat.apt-packages.automake
      - sls: mat.apt-packages.libtool-bin
      - sls: mat.apt-packages.cython3
      - sls: mat.apt-packages.pkg-config
      - sls: mat.apt-packages.libssl-dev
      - sls: mat.apt-packages.libusb-1
      - sls: mat.apt-packages.udev
      - sls: mat.apt-packages.libfuse-dev
      - sls: mat.apt-packages.libreadline-dev
      - sls: mat.apt-packages.libzip-dev

make-{{ repo }}:
  cmd.run:
    - name: make -j `nproc`
    - cwd: /usr/local/src/libimobile/{{ repo }}
    - require:
      - cmd: autogen-{{ repo }}

make-install-{{ repo }}:
  cmd.run:
    - name: make install
    - cwd: /usr/local/src/libimobile/{{ repo }}
    - require:
      - cmd: make-{{ repo }}

{% endfor %}

ldconfig:
  cmd.run
 
