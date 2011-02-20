package URI::Active::HTTPError;

use base URI::Active::Error;
use accessors::rw::explicit qw/response/;

sub init {
    my $self = shift;
    $self->set_response(shift);
    $self->set_message($self->response->status_line);
}

1;
