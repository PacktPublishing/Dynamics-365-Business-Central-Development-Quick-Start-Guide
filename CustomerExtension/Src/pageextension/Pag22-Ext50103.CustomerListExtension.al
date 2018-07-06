pageextension 50103 CustomerListExtension extends "Customer List" //22
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        addlast(Processing)
        {
            action("Assign Default Category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All; //Always add this!
                Caption = 'Assign Default Category to all Customers';
                ToolTip = 'Assign Default Category to all Customers';

                trigger OnAction();
                var
                    cuCustomer: Codeunit "Customer Management";
                begin                    
                    cuCustomer.AssignDefaultCategory();
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}