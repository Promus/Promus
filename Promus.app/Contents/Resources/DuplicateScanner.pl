#!/usr/bin/perl

#  DuplicateScanner.pl
#  iControl
#  Copyright © 2011 by Johannes Frotscher (Date: 23 Mar 2011).

use strict;
use warnings;
use File::Find;
use File::stat;
use Digest::MD5;
use Fcntl;

my $checkRsrc = 1;

my $matchSomeSuffix;
if (defined($ARGV[0]))
{
    
    my @suffixes = split(/\|/, $ARGV[0]);
    if (scalar(@suffixes) > 0)
    {
        my $matchExpr = join('||', map {"m/\$suffixes[$_]\$/io"} 0..$#suffixes);

        $matchSomeSuffix = eval "sub {$matchExpr}";
    }
    shift @ARGV;
}

my @searchDirs = @ARGV ? @ARGV : ".";

foreach my $dir (@searchDirs)
{
    die "\"$dir\" is not a directory\n" unless -d "$dir";
}

my %filesByDataLength;

sub calcMd5($)
{
    my ($filename) = @_;

    if (-d $filename)
    {
        return "unsupported";
    }

    sysopen(FILE, $filename, O_RDONLY)
         or die "Unable to open file \"$filename\": $!\n";
    binmode(FILE);
    my $md5 = Digest::MD5->new->addfile(*FILE)->hexdigest;
    close(FILE);
    return $md5;
}

sub hashByMd5($)
{
    my ($fileInfoListRef) = @_;

    my %filesByMd5;
    foreach my $fileInfo (@{$fileInfoListRef})
    {
        my $dirname = $fileInfo->{dirname};
        my $filename = $fileInfo->{filename};

        my $md5 = calcMd5("$dirname/$filename");
        push(@{$filesByMd5{$md5}}, $fileInfo);
    }
    
    return \%filesByMd5;
}

sub checkFile()
{
    return unless -f $_;

    my $filename = $_;
    my $dirname = $File::Find::dir;

    return if $filename =~ /^\._/;

    if (defined($matchSomeSuffix))
    {
        return unless &$matchSomeSuffix;
    }

    my $statInfo = stat($filename)
              or warn "Can't stat file \"$dirname/$filename\": $!\n" and return;
    my $size = $statInfo->size;

    my $fileInfo = {
        'dirname'  => $dirname,
        'filename' => $filename,
        };

    push(@{$filesByDataLength{$size}}, $fileInfo);
}

MAIN:
{

    find(\&checkFile, @searchDirs);
    
    my $numDupes = 0;
    my $numDupeBytes = 0;
    foreach my $size (sort {$b<=>$a} keys %filesByDataLength)
    {
        my $numSameSize = scalar(@{$filesByDataLength{$size}});
        next unless $numSameSize > 1;
    
        my $filesByMd5Ref = hashByMd5($filesByDataLength{$size});
        my %filesByMd5 = %{$filesByMd5Ref};
        foreach my $md5 (keys %filesByMd5)
        {
            my @sameMd5List = @{$filesByMd5{$md5}};
            my $numSameMd5 = scalar(@sameMd5List);
            next unless $numSameMd5 > 1;
            
            my $rsrcMd5;
            foreach my $fileInfo (@sameMd5List)
            {
                my $dirname = $fileInfo->{dirname};
                my $filename = $fileInfo->{filename};
                my $filepath = "$dirname/$filename";
                print "$filepath\n";
                
                if ($checkRsrc)
                {
                    my $rsrcFilepath = "$filepath/..namedfork/rsrc";
                    if (!defined($rsrcMd5))
                    {
                        $rsrcMd5 = calcMd5($rsrcFilepath);
                    }
                    elsif ($rsrcMd5 ne calcMd5($rsrcFilepath))
                    {
                        print "Resource fork differs\n";
                    }
                }
            }
            print "----------\n";
            
            $numDupes += ($numSameMd5 - 1);
            $numDupeBytes += ($size * ($numSameMd5 - 1));
        }
    }
    
    my $numDupeMegabytes = sprintf("%.1f", $numDupeBytes / (1024 * 1024));
    print "Duplicates number: $numDupes\n";
    print "Megabytes occupied: $numDupeMegabytes\n";
}