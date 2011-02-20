package URI::Active;

use warnings;
use strict;

require URI::Active::file;
require URI::Active::http; 
require URI::Active::ftp; 

=head1 NAME

URI::Active - The great new URI::Active!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

use base "URI";

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use URI::Active;

    my $foo = URI::Active->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

my $ua;

sub new {
    my $class = shift;
    my $uri = $class->SUPER::new(@_);
    my $new_class = $class . '::' . $uri->scheme;
    return $new_class->new($uri);
}

sub import {
    my $class = shift;
    my %opts = (@_ == 1) ? %{$_[0]} : @_;
}    

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Alex Kalderimis, C<< <alex dot kalderimis at gmail dot com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-uri-active at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=URI-Active>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc URI::Active


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=URI-Active>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/URI-Active>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/URI-Active>

=item * Search CPAN

L<http://search.cpan.org/dist/URI-Active/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Alex Kalderimis.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of URI::Active
