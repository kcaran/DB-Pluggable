use 5.010;
use strict;
use warnings;

package DB::Pluggable::Role::WatchFunction;

# ABSTRACT: Do something during the debugger's watchfunction()
use Role::Basic;
with qw(Brickyard::Role::Plugin);
requires qw(watchfunction);
1;

=begin :prelude

=for stopwords watchfunction

=end :prelude

=head1 IMPLEMENTING

The C<WatchFunction> role indicates that a plugin wants to do
something during the debugger's C<watchfunction()> function. The
plugin must provide the C<watchfunction()> method.
