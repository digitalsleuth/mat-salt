{% set py_pkg = salt['grains.filter_by']({ 'bionic': 'python','focal': 'python2'}, grain='oscodename') %}
mat.apt-packages.python2:
  pkg.installed:
    - name: {{ py_pkg }}
