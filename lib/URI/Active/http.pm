package URI::Active::http;

use parent "URI::Active::Delegator";

use LWP::UserAgent;
use URI::Active::HTTPError;

sub read {
    my $self = shift;
    my $ua = LWP::UserAgent->new;
    my $response = $ua->get($self->as_string);
    if ($response->is_success) {
        return $response->decoded_content;
    } else {
        die URI::Active::HTTPError->new($response);
    }
}

1;


