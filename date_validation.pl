#!/usr/bin/perl

use Date::Calc qw(check_date Delta_YMD Delta_Days Today);

my $days_in_year = 365.2425;
my @dob_ymd = ( 1990,
              12,
              15);

my @age_ymd = Delta_Days(@dob_ymd, Today());
my $real_age = $age_ymd[0]/$days_in_year;

print "$real_age\n";
print int($real_age), "\n";
print int(2.9), "\n";
        

