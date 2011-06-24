use 5.010;
use strict;
use warnings;

package DB::Pluggable::Role::AfterInit;

# ABSTRACT: Do something in the debugger's afterinit() function
use Role::Basic;
with qw(Brickyard::Role::Plugin);
requires qw(afterinit);
1;

=begin :prelude

=for stopwords afterinit

=end :prelude

=head1 IMPLEMENTING

The C<AfterInit> role indicates that a plugin wants to do something
during the debugger's C<afterinit()> function. The plugin must provide
the C<afterinit()> method.
