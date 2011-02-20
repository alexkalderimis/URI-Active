use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'URI::Active',
    license             => 'perl',
    dist_author         => q{Alex Kalderimis <alex dot kalderimis at gmail dot com>},
    dist_version_from   => 'lib/URI/Active.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'URI-Active-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
