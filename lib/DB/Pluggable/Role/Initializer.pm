use 5.010;
use strict;
use warnings;

package DB::Pluggable::Role::Initializer;

# ABSTRACT: Something that initializes the plugin system
use Role::Basic;
with qw(Brickyard::Role::Plugin);
requires qw(initialize);
1;

=head1 IMPLEMENTING

The C<Initializer> role indicates that a plugin wants to do something
when the plugin handler starts to run. The plugin must provide the
C<initialize()> method.
