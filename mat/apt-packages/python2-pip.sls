include:
  - mat.apt-packages.python2
  - mat.apt-packages.curl

{%- if grains['oscodename'] == "bionic" %}
mat-apt-package-python2-pip:
  pkg.installed:
    - name: python-pip
    - require:
      - sls: mat.apt-packages.python2

{%- elif grains['oscodename'] == "focal" %}
mat-apt-package-python2-pip-install-script:
  cmd.run:
    - name: curl -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py 
    - unless: which pip2
    - require:
      - sls: mat.apt-packages.python2
      - sls: mat.apt-packages.curl

mat-apt-packages-python2-pip-install:
  cmd.run:
    - name: python2 /tmp/get-pip.py
    - unless: which pip2
    - require:
      - cmd: mat-apt-packages-python2-pip-install-script
{%- endif %}
