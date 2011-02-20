package URI::Active::Error;

use strict;
use warnings;

use Object::New;
use accessors::rw::explicit qw/message loc/;

use overload
    '""' => \&stringify,
    fallback => 1;

sub init {
    my $self = shift;
    $self->set_loc($self->find_caller());
    $self->set_message(shift());
}

sub find_caller {
    my $self = shift;
    my ($p, $f, $l, $s);
    my $level = 0;

    while (($p, $f, $l, $s) = caller($level++)) {
        last if ($s && $s =~ /::new$/);
    }
    ($p, $f, $l, $s) = caller($level);

    return [$p, $f, $l, $s];
}

sub get_call {
    my $self = shift;
    return sprintf('%2$s line %3$s (%4$s)', @{$self->loc});
}

sub stringify {
    my $self = shift;
    return $self->message . " at " . $self->get_call;
}

1;
