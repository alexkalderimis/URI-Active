package URI::Active::FileError;

use strict;
use warnings;

use base "URI::Active::Error";
use accessors::rw::explicit qw/file_error/;

sub init {
    my $self = shift;
    my $uri = shift;
    $self->set_file_error(shift);
    $self->SUPER::init("Could not open $uri: " . $self->file_error);
}

1;
