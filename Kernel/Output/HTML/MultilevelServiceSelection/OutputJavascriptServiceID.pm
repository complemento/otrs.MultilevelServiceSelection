# --
# --
package Kernel::Output::HTML::MultilevelServiceSelection::OutputJavascriptServiceID;

use strict;
use warnings;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get needed objects
#    for my $Object (
#        qw(MainObject ConfigObject LogObject LayoutObject ParamObject)
#        )
#    {
#        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
#    }
    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;
	my %Data = ();
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    
    my $SetField             = $Kernel::OM->Get('Kernel::Config')->Get( 'Complemento::MultilevelServiceSelect::SetField' );
    my $SearchBoxInAgent     = $Kernel::OM->Get('Kernel::Config')->Get( 'Complemento::MultilevelServiceSelect::SearchBoxInAgent' );
    my $SearchBoxInCustomer  = $Kernel::OM->Get('Kernel::Config')->Get( 'Complemento::MultilevelServiceSelect::SearchBoxInCustomer' );

    if ($SetField ne '') {
        $LayoutObject->Block(
                Name => 'SetField',
                Data => {
                    Field => $SetField,
                },
            );
       $LayoutObject->Block(
                 Name => 'SetFieldAjax',
                 Data => {
                     Field => $SetField,
                 },
             );
    };

    if ($SearchBoxInAgent eq '1') {
        $LayoutObject->Block(
                Name => 'SearchBoxInAgent',
                Data => {},
            );
    };

    if ($SearchBoxInCustomer eq '1') {
        $LayoutObject->Block(
                Name => 'SearchBoxInCustomer',
                Data => {},
            );
    };

    my $Templatename = $Param{TemplateFile} || '';
    return 1 if !$Templatename;
		my $iFrame = $LayoutObject->Output(
    	    TemplateFile => 'JsServiceID',
    	);
	   ${ $Param{Data} } .= $iFrame ;
 
}
1;
