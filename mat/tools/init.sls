include:
  - mat.tools.aleapp
  - mat.tools.androbugs
  - mat.tools.android-studio
  - mat.tools.apktool
  - mat.tools.apollo
  - mat.tools.apple-cloud-notes-parser
  - mat.tools.axmlprinter
  - mat.tools.axmlprinter2
  - mat.tools.baksmali
  - mat.tools.burpsuite-community
  - mat.tools.bytecode-viewer
  - mat.tools.cfr
  - mat.tools.classyshark
  - mat.tools.csvview
  - mat.tools.cutter
  - mat.tools.cyberchef
  - mat.tools.datcon
  - mat.tools.dex2jar
  - mat.tools.eclipse
  - mat.tools.enjarify
  - mat.tools.flexdecrypt
  - mat.tools.ghidra
  - mat.tools.ileapp
  - mat.tools.impactor
  - mat.tools.jad
  - mat.tools.jadx
  - mat.tools.java-adb-remote-screen
  - mat.tools.jd-gui
  - mat.tools.libimobile
  - mat.tools.openmf
#  - mat.tools.pvrtextools
  - mat.tools.simplify
  - mat.tools.smali
  - mat.tools.teleparser
  - mat.tools.yara

mat-tools:
  test.nop:
    - require:
      - sls: mat.tools.aleapp
      - sls: mat.tools.androbugs
      - sls: mat.tools.android-studio
      - sls: mat.tools.apktool
      - sls: mat.tools.apollo
      - sls: mat.tools.apple-cloud-notes-parser
      - sls: mat.tools.axmlprinter
      - sls: mat.tools.axmlprinter2
      - sls: mat.tools.baksmali
      - sls: mat.tools.burpsuite-community
      - sls: mat.tools.bytecode-viewer
      - sls: mat.tools.cfr
      - sls: mat.tools.classyshark
      - sls: mat.tools.csvview
      - sls: mat.tools.cutter
      - sls: mat.tools.cyberchef
      - sls: mat.tools.datcon
      - sls: mat.tools.dex2jar
      - sls: mat.tools.eclipse
      - sls: mat.tools.enjarify
      - sls: mat.tools.flexdecrypt
      - sls: mat.tools.ghidra
      - sls: mat.tools.ileapp
      - sls: mat.tools.impactor
      - sls: mat.tools.jad
      - sls: mat.tools.jadx
      - sls: mat.tools.java-adb-remote-screen
      - sls: mat.tools.jd-gui
      - sls: mat.tools.libimobile
      - sls: mat.tools.openmf
#      - sls: mat.tools.pvrtextools
      - sls: mat.tools.simplify
      - sls: mat.tools.smali
      - sls: mat.tools.teleparser
      - sls: mat.tools.yara
