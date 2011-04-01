#!/usr/lib/perl

use Modern::Perl;
use Date::Calc qw(check_date Delta_YMD Delta_Days);


my $dob_days = 23;
my $dob_month = 12;
my $dob_year = 2005;

my $days_in_year = 365.2425;
my @dob_ymd = ( $dob_year, $dob_month, $dob_days );


my @temp_date = ( 2011, 12, 23 );


if ( check_date(@dob_ymd) ) {
   
   # If age is 6 based on subtracting years, and months/days are the same
   # pass. (Date::Calc fails at this, yay?) 

   my @tmp_ymd = Delta_Days(@dob_ymd, @temp_date);
   my $real_age = $tmp_ymd[0] / $days_in_year;
   my $age_based_on_year = 2011-$dob_year;

   if ($real_age >= 6) {
       print "Older then 6 ($real_age)\n";
   } elsif ($real_age < 6) {
       print "Younger then 6 ($real_age)\n";
   }

}

else {
   die E->new("Not a valid date");
}


