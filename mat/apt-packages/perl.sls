# Name: perl
# Website: https://www.perl.org/
# Description: Perl programming language
# Category: Programming
# Author: Larry Wall
# License: GNU General Public License v1.0 (https://dev.perl.org/licenses/gpl1.html)
# Version: 5.30.0 (focal) / 5.34.0 (jammy)
# Notes:

perl:
  pkg.installed

mat-apt-packages-perl-cpan-configure:
  cmd.wait:
    - name: perl -MCPAN -e 'my $c = "CPAN::HandleConfig"; $c->load(doit => 1, autoconfig => 1); $c->edit(prerequisites_policy => "follow"); $c->edit(build_requires_install_policy => "yes"); $c->commit'
    - watch:
      - pkg: perl

cpanminus:
  pkg.installed:
    - require:
      - pkg: perl
