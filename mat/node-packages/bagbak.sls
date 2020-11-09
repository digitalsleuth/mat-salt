include:
  - mat.apt-packages.nodejs
  - mat.python3-packages.frida

mat-node-packages-bagbak:
  cmd.run:
    - name: npm install -g bagbak --user root
    - require:
      - sls: mat.apt-packages.nodejs
      - sls: mat.python3-packages.frida
