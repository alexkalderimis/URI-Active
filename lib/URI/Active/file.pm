package URI::Active::file;

use parent "URI::Active::Delegator";

use URI::Active::FileError;

sub read {
    my $self = shift;
    open(my $fh, '<', $self->file)
        or die URI::Active::FileError->new($self, $!);
    if (wantarray) {
        return (<$fh>);
    } else {
        return join('', <$fh>);
    }
}

1;


