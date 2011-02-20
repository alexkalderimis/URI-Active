use Test::More tests => 1;

use URI::Active;

my $uri = URI::Active->new("http://www.google.com");

is("FOO", $uri->read);

$uri = URI::Active->new("file:t/data/testdata");

is($uri->read, "FOO");

$uri = URI::Active->new("file:/home/alex/Projects/Perl/URI-Active/t/data/testdata");

is($uri->read, "FOO");

$uri = URI::Active->new('ftp://ftp.unit.no/pub/rfc/rfc-index.txt');

is($uri->read, "FOO");


