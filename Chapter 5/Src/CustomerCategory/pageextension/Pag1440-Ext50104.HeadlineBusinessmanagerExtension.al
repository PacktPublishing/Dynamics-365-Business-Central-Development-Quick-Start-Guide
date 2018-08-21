pageextension 50104 MyNewBCHeadline extends "Headline RC Business Manager" //1440
{
    layout
    {
        // Add changes to page layout here
        addafter(Control4)
        {
            field(newHeadlineText;newHeadlineText)
            {
                ApplicationArea = all;
                trigger OnDrillDown()
                var
                    Customer: Record Customer;
                    pgCustomerList: Page "Customer List";
                begin
                    //Here we can handle a custom drilldown for details regarding the Headline
                    Customer.SetRange("Customer Category SDM",'');
                    pgCustomerList.SetTableView(Customer);
                    pgCustomerList.Run();
                end;
            }
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    //Global variables
    var
        newHeadlineText: Text;

        trigger OnOpenPage()
        var
            HeadlineMgt : Codeunit "Headline Management";
            cuCustomerManagement: Codeunit "Customer Management";
        begin
            //Set Headline text            
            newHeadlineText := 'Number of Customers without assigned Category: ' + HeadlineMgt.Emphasize(Format(cuCustomerManagement.GetTotalCustomersWithoutCategory()));
        end;
        
}