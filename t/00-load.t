#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'URI::Active' ) || print "Bail out!
";
}

diag( "Testing URI::Active $URI::Active::VERSION, Perl $], $^X" );
