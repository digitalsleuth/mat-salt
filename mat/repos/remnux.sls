mat-remnux-repo-key:
  file.managed:
    - name: /usr/share/keyrings/REMNUX-GPG-KEY.asc
    - source: https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xbff45016788de115
    - skip_verify: True
    - makedirs: True

mat-remnux-repo:
  pkgrepo.managed:
    - name: deb [signed-by=/usr/share/keyrings/REMNUX-GPG-KEY.asc] https://ppa.launchpadcontent.net/remnux/stable/ubuntu/ {{ grains['lsb_distrib_codename'] }} main
    - file: /etc/apt/sources.list.d/remnux-stable-{{ grains['lsb_distrib_codename'] }}.list
    - refresh: True
    - clean_file: True
    - require:
      - file: mat-remnux-repo-key
