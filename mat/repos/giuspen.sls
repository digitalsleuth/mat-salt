mat-giuspen-key:
  file.managed:
    - name: /usr/share/keyrings/GIUSPEN-GPG-KEY.asc
    - source: https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xb8668b055fe1efe4
    - skip_verify: True
    - makedirs: True

mat-repos-giuspen:
  pkgrepo.managed:
    - humanname: giuspen
    - name: deb [arch=amd64 signed-by=/usr/share/keyrings/GIUSPEN-GPG-KEY.asc] https://ppa.launchpadcontent.net/giuspen/ppa/ubuntu {{ grains['lsb_distrib_codename'] }} main
    - dist: {{ grains['lsb_distrib_codename'] }}
    - file: /etc/apt/sources.list.d/giuspen.list
    - refresh: True
    - clean_file: True
    - require:
      - file: mat-giuspen-key
