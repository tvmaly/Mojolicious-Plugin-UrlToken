package Mojolicious::Plugin::UrlToken;
use strict;
use Data::UUID;
use MIME::Base64::URLSafe;

use version; 

our $VERSION = qv('1.0.0');

use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ($self, $app, $args) = @_;
    $args ||= {};

  $app->helper(
    generate_url_token => sub {

        my $ug = Data::UUID->new();

        return urlsafe_b64encode($ug->to_string($ug->create()));

    });
}
1; # Magic true value required at end of module
__END__

=head1 NAME

Mojolicious::Plugin::UrlToken - generate url tokens for use in email registration or other email verification steps


=head1 VERSION

This document describes Mojolicious::Plugin::UrlToken version 1.0.0


=head1 SYNOPSIS

    use Mojolicious::Plugin::UrlToken;

    in your mojolicious app

    $self->plugin('UrlToken');

    or your mojolicious lite app

    plugin UrlToken;

    then just call 

    my $token = app->generate_url_token();

  
=head1 DESCRIPTION

    this module is a plugin that provides a helper generate_url_token
    for use in email validation

=head1 INTERFACE 

=over
 
=item generate_url_token
    return a url safe token that you can include in a url and email etc

=back

=head1 CONFIGURATION AND ENVIRONMENT

Mojolicious::Plugin::UrlToken requires no configuration files or environment variables.


=head1 DEPENDENCIES

Mojolicious
Data::UUID
MIME::Base64::URLSafe

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-mojolicious-plugin-urltoken@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 AUTHOR

Tyson Maly  C<< <tvmaly@cpan.org> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2014, Tyson Maly C<< <tvmaly@cpan.org> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
