package URI::Active::Delegator;

use strict;
use warnings;

use Object::New;
use accessors::rw::explicit qw(delegee);

sub init {
    my $self = shift;
    $self->set_delegee(shift) or die "No delegee";
}

sub AUTOLOAD {
    my $self = shift;
    my $method = our $AUTOLOAD;
    $method =~ s/.*:://;
    return if ($method eq 'DESTROY');
    if (my $code = $self->delegee->can($method)) {
        return $self->delegee->$code(@_);
    }
    die "No method $method on object of class " . ref($self);
}

sub can {
    my $self = shift;
    my $method = shift;
    if (my $code = UNIVERSAL::can($self, $method)) {
        return $code;
    } else {
        return $self->delegee->can($method);
    }
}

1;
