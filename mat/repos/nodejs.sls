mat-nodejs-key:
  file.managed:
    - name: /usr/share/keyrings/NODESOURCE-GPG.KEY
    - source: http://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - skip_verify: True
    - makedirs: True

mat-nodejs-repo-cleanup:
  pkgrepo.absent:
    - name: deb https://deb.nodesource.com/node_14.x {{ grains['lsb_distrib_codename'] }} main
    - refresh: true

nodejs-repo:
  pkgrepo.managed:
    - humanname: nodejs
    - name: deb [signed-by=/usr/share/keyrings/NODESOURCE-GPG.KEY] https://deb.nodesource.com/node_14.x {{ grains['lsb_distrib_codename'] }} main
    - file: /etc/apt/sources.list.d/nodesource.list
    - refresh: true
    - clean_file: True
    - require:
      - file: mat-nodejs-key
      - pkgrepo: mat-nodejs-repo-cleanup
