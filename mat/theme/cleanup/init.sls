{% set desktop_items = ['libreoffice-calc.dockitem','libreoffice-writer.dockitem','org.gnome.Software.dockitem', 'org.gnome.Geary.desktop', 'nemo.dockitem'] %}
{%- set user = salt['pillar.get']('mat_user', 'mat') -%}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.apt-packages.docker
  - mat.config.user

mat-theme-cleanup-extra-apps:
  pkg.removed:
    - pkgs:
      - aisleriot
      - avahi-daemon
      - transmission
      - caffeine
      - cheese
      - gnome-mahjongg
      - gnome-mines
      - rhythmbox
      - gnome-sudoku
      - unattended-upgrades
      - transmission-gtk
      - gnome-2048

mat-theme-cleanup-disable-auto-upgrades:
  file.append:
    - name: /etc/apt/apt.conf.d/20auto-upgrades
    - text: "APT::Periodic::Update-Package-Lists \"0\";\nAPT::Periodic::Unattended-Upgrade \"0\";"
    - makedirs: True

{%- if salt['file.file_exists']('/sbin/runlevel') %}

mat-theme-cleanup-service-bluetooth:
  service.dead:
    - name: bluetooth
    - enable: False

mat-theme-cleanup-service-docker:
  service.dead:
    - name: docker
    - enable: False
    - require:
      - sls: mat.apt-packages.docker

mat-theme-cleanup-docker-wrapper:
  file.managed:
    - replace: False
    - user: root
    - group: root
    - mode: 755
    - name: /usr/local/bin/docker
    - source: salt://mat/theme/cleanup/docker-wrapper.sh
    - makedirs: True
    - require:
      - sls: mat.apt-packages.docker

{% endif %}

mat-theme-cleanup-autoremove:
  cmd.run:
    - name: apt-get autoremove -y

mat-user-directories-{{ user }}:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}
    - recurse:
      - user
      - group
    - require:
      - user: mat-user-{{ user }}

{% for item in desktop_items %}
mat-theme-cleanup-plank-{{ item }}:
  file.absent:
    - name: {{ home }}/.config/plank/dock1/launchers/{{ item }}
    - require:
      - user: mat-user-{{ user }}
{% endfor %}

mat-theme-cleanup-root-dir:
  file.absent:
    - name: /root/.cache/
    - watch:
      - file: mat-theme-cleanup-docker-wrapper
  
