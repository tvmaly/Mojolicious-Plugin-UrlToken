#!/usr/bin/env perl
BEGIN { 
    $ENV{MOJO_LOG_LEVEL}='debug';
    $ENV{HARNESS_IS_VERBOSE}=1;
};
BEGIN { $ENV{MOJO_NO_IPV6} = $ENV{MOJO_POLL} = 1 }
use lib '../lib';
use Mojo::Base -strict;

use Test::More;

use Mojolicious::Lite;

use Test::Mojo;


plugin 'UrlToken' => {};

get '/' => sub {

    my $self = shift;

    my $token = $self->app->generate_url_token();

    $self->app->log->debug("token:$token");
    $self->stash(token => $token);

    $self->render(text => 'token test');

} => 'index';

my $t = Test::Mojo->new;
$t->get_ok('/')->status_is(200)->content_like(qr/token/);

done_testing();

__DATA__
@@index.html.ep
<html>
    <head><title></title></head>
    <body><%= $text =></body>
</html>

@@ exception.html.ep
%= stash('exception')
