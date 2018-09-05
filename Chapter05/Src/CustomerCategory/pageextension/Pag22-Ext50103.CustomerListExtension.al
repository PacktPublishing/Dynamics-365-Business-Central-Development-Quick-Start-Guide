pageextension 50103 CustomerListExtension extends "Customer List" //22
{

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
                ApplicationArea = All;
                Caption = 'Assign Default Category to all Customers';
                ToolTip = 'Assigns the Default Category to all Customers';

                trigger OnAction();
                var
                    CustManagement: Codeunit "Customer Management";
                begin
                    CustManagement.AssignDefaultCategory();
                end;
            }
        }
    }


}