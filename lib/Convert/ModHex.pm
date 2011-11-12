package Convert::ModHex;

# ABSTRACT: Conversion utilities between Yubico ModHex and hexa/decimal

use strict;
use warnings;
use parent 'Exporter';

# VERSION
# AUTHORITY

our @EXPORT_OK = qw( modhex2hex modhex2dec hex2modhex dec2modhex );

sub modhex2hex {
  my $m = $_[0];

  $m =~ tr/cbdefghijklnrtuv/0123456789abcdef/;

  return $m;
}

sub modhex2dec {
  return hex(modhex2hex(@_));
}

sub hex2modhex {
  my $m = $_[0];

  $m =~ tr/0123456789abcdef/cbdefghijklnrtuv/;
  $m = "c$m" if length($m) % 2;

  return $m;
}

sub dec2modhex {
  return hex2modhex(sprintf('%x', shift));
}

1;

__END__

=encoding utf8

=head1 SYNOPSIS

    use Convert::ModHex qw( modhex2hex modhex2dec hex2modhex dec2modhex );
    
    my $modhex = 'ccbc';
    my $hex = modhex2hex($modhex);
    my $dec = modhex2dec($modhex);
    
    $modhex = hex2modhex($hex);
    $modhex = dec2modhex($dec);


=head1 DESCRIPTION

This module provides utility functions that you can use to convert between
L<ModHex encoding|http://www.yubico.com/modhex-calculator> (as used by the
L<Yubikey tokens|http://www.yubico.com/yubikey>).


=head1 FUNCTIONS

=head2 modhex2hex

Accepts a ModHex-encoded scalar, returns a hexadecimal-encoded scalar.


=head2 modhex2dec

Accepts a ModHex-encoded scalar, returns a numeric scalar.


=head2 hex2modhex

Accepts a hexadecimal scalar and returns the ModHex-encoded scalar.


=head2 dec2modhex

Accepts a numeric scalar and returns the ModHex-encoded scalar.


=cut
