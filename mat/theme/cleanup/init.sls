{%- set user = salt['pillar.get']('mat_user', 'mat') -%}

include:
  - mat.apt-packages.docker

yelp:
  pkg.removed

avahi-daemon:
  pkg.removed

unattended-upgrades:
  pkg.removed

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
