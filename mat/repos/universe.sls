ubuntu-universe-repo:
  pkgrepo.managed:
    - name: deb http://archive.ubuntu.com/ubuntu {{ grains['lsb_distrib_codename'] }} universe
    - refresh: true
