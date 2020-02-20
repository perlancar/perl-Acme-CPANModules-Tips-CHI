package Acme::CPANModules::Tips::CHI;

# AUTHORITY
# DATE
# DIST
# VERSION

our $LIST = {
    summary => "CHI's tips and tricks",
    description => <<'_',

This list contains tips and tricks when using <pm:CHI>, a unified interface for
handling caching.

** About CHI **

I'd like to call CHI as the <pm:DBI> of caching. It's created by Jonathan
Swartz, a long-time Perl programmer who also created, among others,
<pm:Log::Any> and <pm:Mason> back in the late 1990's.

** Tip: Some gotchas when using CHI **

CHI's `get()` or `set()` currently does not check for valid keys in option, so
watch out for typos like:

    # the code below does not generate warning or error, but the correct
    # spelling is 'expires_at'!
    $cache->set($key, $data, {expire_at => $time});

** Tip: Setting: keeping the original expiry time **

    $cache->set($key, $data,
                {expires_at => $cache->get_expires_at($key) });


_
    tags => ['tips'],
};

$LIST->{entries} = [
    map { +{module=>$_} }
        do { my %seen; grep { !$seen{$_}++ }
             ($LIST->{description} =~ /<pm:(\w+(?:::\w+)+)>/g)
         }
    ];


1;
# ABSTRACT:
