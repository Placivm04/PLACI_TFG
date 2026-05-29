$do_cd = 1;

add_cus_dep('nlo', 'nls', 0, 'makenomenclature');

sub makenomenclature {
  my ($base) = @_;
  my $nlo = "$base.nlo";
  $nlo = "$out_dir/$base.nlo" if defined $out_dir && $out_dir ne '' && -e "$out_dir/$base.nlo";
  return system('makeindex', $nlo, '-s', 'nomencl.ist', '-o', "$base.nls");
}

$clean_ext .= ' nlo nls ilg';
