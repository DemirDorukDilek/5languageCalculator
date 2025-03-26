#!/usr/bin/env perl
use strict;
use warnings;

my %memory;

print "q to exit\n";

while (1) {
    print "> ";
    my $input = <STDIN>;
    last unless defined $input;

    chomp($input);
    $input =~ s/^\s+|\s+$//g;

    if ($input eq 'q') {
        last;
    }

    next if $input eq '';

    if ($input =~ /^goster\s+(.+)$/) {
        my $hesap = calculate($1);
        print "$hesap\n";
    }
    elsif ($input =~ /^(\w+)\s*=\s*(.+)$/) {
        my ($degisken, $ifade) = ($1, $2);
        my $sonuc = calculate($ifade);
        $memory{$degisken} = $sonuc;
    }
    else {
        my $sonuc = calculate($input);
        print "$sonuc\n";
    }
}

sub calculate {
    my $ifade = shift;
    $ifade =~ s/\s+//g;

    $ifade =~ s/([a-zA-Z]\w*)/defined $memory{$1} ? "($memory{$1})" : 0/ge;

    my $sonuc = eval $ifade;
    if ($@) {
        warn "Calculation error: $@";
        return 0;
    }
    return int($sonuc);
}
