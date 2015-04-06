#!/usr/bin/perl

# NAME
#
# duext - analyze and report disk usage by file name extension
#
# SYNOPSIS
#
# duext [-h] [-n] [DIRECTORY]...
#
# USAGE
#
# Give directory(ies) to search as arguments
#   Defaults to current directory if no arguments
# Currently just reports count and size; customize to taste
# Written for *nix but may work on other platforms
#
# OPTIONS
#
# -h  reports using human-friendly scale and suffix
# -n  considers all-numeric extensions as one extension type
#
# HISTORY
#
# 2010MAR10: Initial release
# 2010MAR11: Cleaned up code/docs; more summary stats; default to CWD; -h and -n options
#
# LEGAL
#
# Written by Ben Scott <mailvortex@gmail.com>
# Free to use/change/distribute in any way for any purpose
# No warranty of any kind -- use at your own risk

use strict;
use warnings;
use File::Find;
use File::stat;
use Getopt::Long;

# ----------------------------------------
# constants

# maximum length of a file extension (characters after last dot)
# extensions longer than this are considered to be something weird and ignored
use constant MAX_EXT_LEN => 5;

# binary multiples
use constant {
  TiB => 1099511627776,
  GiB => 1073741824,
  MiB => 1048576,
  KiB => 1024,
}; # binary multiples

# regex to extract file extension
my $re = qr{
  [^.]+ # one-or-more non-dot characters before extension
  \.    # dot before extension
  (     # group the extension to save it as back-ref
    [^.]                  # non-dot characters
    {1,${\(MAX_EXT_LEN)}} # one-to-X of the above
  )     # end grouping
  $     # end-of-string
}xo; # $re

# ----------------------------------------
# function prototypes

sub human_size ($);

# ----------------------------------------
# variables

# options
my $opt_human;   # output human-friendly size numbers and prefixes (K/M/G)
my $opt_numeric; # consider all-numeric extensions as one

# keys to these hashes are the file extension, without leading dot
# values are whatever it is the hash is tracking
my %count;  # count of files with the given extension
my %size; # total size of files with the given extension

# master counters for all files
my $total_size;
my $total_count;

# ----------------------------------------
# initialize

# get options, if any
die ("Command line parse error") if not GetOptions(
        'h' => \$opt_human,
  'n' => \$opt_numeric,
        );

# if @ARGV is now non-empty, directory list is @ARGV, else directory list is current directory
my @dirs; # list of directories to scan
if ($#ARGV >= 0) {
  @dirs = @ARGV;
}
else {
  @dirs = '.';
}

# ----------------------------------------
# input -- scan files

# look for files in directories given on command line
find ( \&wanted, @dirs );
sub wanted { # for each thing found...
  return if not -f; # skip non-files
  # try to get file extension; if we do...
  if (m/$re/) {
    my $ext = $1;
    my $stat = stat($_);
    # manipulate extension
    $ext =~ tr/A-Z/a-z/; # fold case
    $ext =~ s/~$//; # pretend backups are the "real" extension
    $ext = '/numeric/' if ($opt_numeric and ($ext =~ m/^\d+$/)); # numeric extension option
    # increment counts
    $count{$ext}++;
    $total_count++;
    # accumulate sizes
    $size{$ext} += $stat->size();
    $total_size += $stat->size();
  };
}; # &wanted

# ----------------------------------------
# output -- report what we found

# for each extension...
foreach my $ext (keys %count) {
  print "$ext: $count{$ext} files, ${\(human_size($size{$ext}))} bytes\n";
} # foreach

# totals
# slash prefix to stand out (slash should not be in file names, thus not a valid extension)
print "/////// ${\(scalar keys %count)} unique file extensions\n";
print "/////// total $total_count files, ${\(human_size($total_size))} bytes\n";

# ----------------------------------------
# utility subroutines

sub human_size ($) {
# takes size number
# returns same if $opt_human not enabled
# returns size with human-friendly suffix and scale (usually a string)
my $size = shift;
return $size unless $opt_human;
return sprintf("%.2fT", ($size / TiB)) if ($size > TiB);
return sprintf("%.2fG", ($size / GiB)) if ($size > GiB);
return sprintf("%.2fM", ($size / MiB)) if ($size > MiB);
return sprintf("%.2fK", ($size / KiB)) if ($size > KiB);
} # human_size

# ----------------------------------------
# EOF duext