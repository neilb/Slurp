package Slurp;

use 5.006;
use strict;
use warnings;
use Exporter;

our @ISA       = qw/ Exporter /;
our @EXPORT    = qw/ slurp /;
our @EXPORT_OK = qw/ slurp to_array to_scalar /;


sub slurp { 
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

 my $file = slurp($file1, $file2, ...);

 my @array = Slurp::to_array($filename);
 my $scalar = Slurp::to_scalar($filename);

=head1 DESCRIPTION

Before using this module you should first look at L<File::Slurper>,
which is a modern implementation of this idea.

This simple module serves one purpose - to provide a simple means to 
read (or slurp) an entire file into memory for processing.  This 
module allows the replacement of the prototypical foreach- or while-
loops used for opening and reading of files with single-line 
constructs.

Of note with this module is that the magic of the C<@ARGV> variable 
and the input record separator, C<$/>, are used to facilitate the 
reading of entire files into either an array or scalar using minimal 
code.

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
 my $array_ref = Slurp::to_array($filename, ...);

This method slurps one or more files, specified by filenames passed 
to this method as arguments, into memory.  If called in a scalar 
context, this method returns an array reference - This is 
particularly useful if dealing with large files.

=item B<to_scalar>

 my $scalar = Slurp::to_scalar($filename, ...);

This method slurps one or more files, specified by filenames passed 
to this method as arguments, into a scalar variable.

=back

=head1 SEE ALSO

L<File::Slurper> - modern implementation of slurping functions
and the inverse function for writing a scalar to a file.

L<File::Slurp> - widely used, but has a number of known issues.


=head1 AUTHOR

Rob Casey

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2004 by Rob Casey.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

