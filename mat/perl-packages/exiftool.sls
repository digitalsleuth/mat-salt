# Name: ExifTool
# Website: https://exiftool.org
# Description: Tool for reading and writing EXIF metadata
# Category:
# Author: Phil Harvey
# License: "This is free software; you can redistribute it and/or modify it under the same terms as Perl itself" (https://exiftool.org/#license)
# Notes: exiftool

include:
  - mat.apt-packages.perl

libimage-exiftool-perl:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.perl
