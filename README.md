# NAME

DB::Pluggable

# VERSION

version 1.12

# SYNOPSIS

    $ cat ~/.perldb
    use DB::Pluggable;
    DB::Pluggable->run_with_config(\<<EOINI)
    [BreakOnTestNumber]

    [TypeAhead]
    type = {l
    type = c
    ifenv = DBTYPEAHEAD

    [StackTraceAsHTML]
    [DataPrinter]
    EOINI

    Then:

    $ perl -d foo.pl

# DESCRIPTION

This class adds plugin support to the Perl debugger. It is based on
[Brickyard](https://metacpan.org/pod/Brickyard), so see its documentation for details.

You need to have a `~/.perldb` file (see [perldebug](https://metacpan.org/pod/perldebug) for details)
that invokes the plugin mechanism.

Plugins should live in the `DB::Pluggable::Plugin::` namespace, like
[DB::Pluggable::Plugin::BreakOnTestNumber](https://metacpan.org/pod/DB%3A%3APluggable%3A%3APlugin%3A%3ABreakOnTestNumber) does.

# NAME

DB::Pluggable - Add plugin support for the Perl debugger

# METHODS

## run\_with\_config

Convenience class method to create, initialize and run the plugin
system with the given configuration file or scalar reference.

## plugins\_with

Like the method with the same name in [Brickyard](https://metacpan.org/pod/Brickyard).

## init\_from\_config

Like the method with the same name in [Brickyard](https://metacpan.org/pod/Brickyard).

## enable\_watchfunction

Tells the debugger to call `DB::watchfunction()`, which in turn
calls the `watchfunction()` method of all plugins that consume the
`-WatchFunction` role.

## run

This method just calls the `initialize()` method of all plugins that
consume the `-Initializer` role.

# Plugin Phases

This class is very much in beta, so it's more like a proof of concept.
Therefore, not all roles - which more or less correspond to plugin
phases - imaginable have been added, only the ones to make this demo
work. If you want more roles or if the current roles don't work for
you, let me know.

The following roles exist:

- `-Initializer`

    See [DB::Pluggable::Role::Initializer](https://metacpan.org/pod/DB%3A%3APluggable%3A%3ARole%3A%3AInitializer).

- `-WatchFunction`

    See [DB::Pluggable::Role::WatchFunction](https://metacpan.org/pod/DB%3A%3APluggable%3A%3ARole%3A%3AWatchFunction).

- `-AfterInit`

    See [DB::Pluggable::Role::AfterInit](https://metacpan.org/pod/DB%3A%3APluggable%3A%3ARole%3A%3AAfterInit).

- `-Eval`

    See [DB::Pluggable::Role::Eval](https://metacpan.org/pod/DB%3A%3APluggable%3A%3ARole%3A%3AEval). The debugger's `eval()` function is
    overridden so we can make it pluggable. Each plugin will get a chance
    to inspect the command line, which is the last line in `$DB::evalarg`
    and act on it. The plugin can return a code reference which will be
    executed after the original `DB::eval()` function has finished. Using
    the code reference you can undo any temporary changes you might have
    introduced to make your command work.

# AUTHOR

Marcel Gruenauer <marcel@cpan.org>

Currently maintained by Keith Carangelo <mail@kcaran.com>

# COPYRIGHT AND LICENSE

The following copyright notice applies to all the files provided in
this distribution, including binary files, unless explicitly noted
otherwise.

This software is copyright (c) 2008-2011 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

# AUTHORS

- Keith Carangelo <mail@kcaran.com>
- Marcel Gruenauer <marcel@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Marcel Gruenauer <marcel@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
