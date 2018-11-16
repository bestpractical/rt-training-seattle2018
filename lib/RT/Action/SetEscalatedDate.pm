package RT::Action::SetEscalatedDate;
use base 'RT::Action';

use strict;
use warnings;

sub Prepare { return 1 }

sub Commit  {
    my $self = shift;

    my $now = RT::Date->new( $self->CurrentUser );
    $now->SetToNow();

    my ($ok, $msg) = $self->TicketObj->AddCustomFieldValue( Field => 'Escalated' , Value => $now->ISO );

    if ( not $ok ){
        RT::Logger->debug("Unable to set Escalated date CF: $msg");
        return 0;
    }

    return 1;
    
}

1;
