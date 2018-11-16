package RT::Search::Simple;
use strict;
use warnings;
no warnings 'redefine';

sub HandleCoffee {
           # Prefix      # TicketSQL snippet
    return 'coffee' => "'CF.{Favorite Coffee}' LIKE '$_[1]'";
}

1;
