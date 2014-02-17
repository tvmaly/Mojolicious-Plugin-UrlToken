use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Mojolicious::Plugin::UrlToken',
    AUTHOR              => 'Tyson Maly <tvmaly@cpan.org>',
    VERSION_FROM        => 'lib/Mojolicious/Plugin/UrlToken.pm',
    ABSTRACT_FROM       => 'lib/Mojolicious/Plugin/UrlToken.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'version'    => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Mojolicious-Plugin-UrlToken-*' },
);
