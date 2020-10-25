linuxgndu:
  pkgrepo.managed:
    - humanname: linuxgndu
    - ppa: linuxgndu/sqlitebrowser
    - refresh: True
    - key_url: salt://mat/repos/keys/LINUXGNDU-GPG-KEY.asc
    - gpgcheck: 1
