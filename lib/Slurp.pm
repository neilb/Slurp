package Slurp;

use Exporter;
use vars qw/ @EXPORT @EXPORT_OK @ISA $VERSION /;

@ISA = qw/ Exporter /;
@EXPORT = qw/ slurp /;
@EXPORT_OK = qw/ to_array to_scalar /;


$VERSION = '0.2';


sub slurp { 
    shift @_ if defined( $_[0] ) and ( ( !ref( $_[0] ) ) and ( $_[0] eq __PACKAGE__ ) );
    local( $/, @ARGV ) = ( wantarray ? $/ : undef, @_ ); 
    return <ARGV>;
}

sub to_array {
    my @array = slurp( @_ );
    return wantarray ? @array : \@array;
}

sub to_scalar {
    my $scalar = slurp( @_ );
    return $scalar;
}


1;


__END__

=pod

=head1 NAME

Slurp - Slurp entire files into variables

=head1 SYNOPSIS

 use Slurp;

 my $file = slurp($filename);

 my @array = Slurp->to_array($filename);
 my $scalar = Slurp->to_scalar($filename);

=head1 DESCRIPTION

This simple module provides one purpose - to provide a simple means 
to read (or slurp) an entire file into memory for processing.  This 
module allows the replacement of the prototypical while-loops used 
for opening and reading of files with single-line constructs.

Of note with this module is that the magic of the @ARGV variable and 
the input record separator, $/, are used to facilitate the reading of 
entire files into either an array or scalar using minimal code.

=head1 METHODS

The following methods are available through this module for use in 
other applications.  By default, the C<slurp> method is exported 
into the calling namespace - The other methods of this module, 
C<to_array> and C<to_scalar>, may also be exported into the calling 
namespace.

=over 4

=item B<slurp>

 my @array = slurp($filename, ...);
 my $scalar = slurp($filename, ...);

This method slurps one or more files, specified by filenames passed 
to this method as arguments, into memory.  The assignment can be 
made either either an array or scalar depending upon the context in 
which this method was called.

=item B<to_array>

 my @array = Slurp::to_array($filename, ...);
 my $array_ref = Slurp->to_array($filename, ...);

This method, which can be called in either a functional or object- 
orientated style, slurps one or more files, specified by filenames 
passed to this method as arguments, into memory.  If called in a 
scalar context, this method returns an array reference - This is 
particularly useful if dealing with large files.

=item B<to_scalar>

 my $scalar = Slurp::to_scalar($filename, ...);
 my $scalar = Slurp->to_scalar($filename, ...);

This method, which can be called in either a functional or object- 
orientated style, slurps one or more files, specified by filenames 
passed to this method as arguments, into a scalar variable.

=back

=head1 VERSION

0.2

=head1 AUTHOR

Rob Casey

=cut
