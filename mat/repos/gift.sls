gift-repo:
  pkgrepo.managed:
    - humanname: gift
    - ppa: gift/stable
    - refresh: true
    - key_url: salt://mat.repos.keys/GIFT-GPG-KEY.asc
    - gpgcheck: 1
