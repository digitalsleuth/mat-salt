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
