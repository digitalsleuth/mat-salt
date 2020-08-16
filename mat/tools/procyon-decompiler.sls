include:
  - mat.apt-packages.default-jre

mat-tools-procyon-download:
  file.managed:
    - name: /usr/local/procyon/procyon-decompiler-0.5.36.jar
    - makedirs: True
    - source: https://bitbucket.org/mstrobel/procyon/downloads/procyon-decompiler-0.5.36.jar
    - source_hash: sha256=74f9f1537113207521a075fafe64bd8265c47a9c73574bbf9fa8854bbf7126bc
    - mode: 755

mat-tools-procyon-wrapper:
  file.managed:
    - name: /usr/local/bin/procyon
    - mode: 755
    - replace: False
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/procyon/procyon-decompiler-0.5.36.jar ${*}
