#!/usr/bin/perl -w
use Array::Utils qw(:all);
use List::MoreUtils qw(uniq);

#this script takes in two files containing lists, finds identical terms and prints out only unique intersections

open (FILE1, $ARGV[0]);
open (FILE2, $ARGV[1]);

@file1 = <FILE1>;
@file2 = <FILE2>;

@isect = intersect(@file1, @file2);

print uniq @isect;

