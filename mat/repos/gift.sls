mat-gift-key:
  file.managed:
    - name: /usr/share/keyrings/GIFT-GPG-KEY.asc
    - source: https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5e80511b10c598b8
    - skip_verify: True
    - makedirs: True

gift-repo:
  pkgrepo.managed:
    - name: deb [arch=amd64 signed-by=/usr/share/keyrings/GIFT-GPG-KEY.asc] http://ppa.launchpad.net/gift/stable/ubuntu {{ grains['lsb_distrib_codename'] }} main
    - dist: {{ grains['lsb_distrib_codename'] }}
    - file: /etc/apt/sources.list.d/gift-ubunt-stable-{{ grains['lsb_distrib_codename'] }}.list
    - refresh: true
    - clean_file: True
    - require:
      - file: mat-gift-key
