
page 50100 "Customer Category List"
{
    PageType = List;
    SourceTable = "Customer Category";
    UsageCategory = Lists; //To be inserted in D365BC Search
    ApplicationArea = All;

    Caption = 'Customer Category List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Default; Default)
                {
                    ApplicationArea = All;
                }

                field(TotalCustomersForCategory; TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total Customers for Category';
                }


            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Default Category")
            {
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Create default category';
                Caption = 'Create default category';

                trigger OnAction();
                var
                    CustManagement: Codeunit "Customer Management";
                begin
                    //!Integration event raised
                    OnBeforeCreateDefaultCategoryAction(Rec);
                    CustManagement.CreateDefaultCategory();
                    //!Integration event raised
                    OnAfterCreateDefaultCategoryAction(Rec);
                end;
            }
        }
    }

    var
    //cu: Codeunit "Customer Management";


    [IntegrationEvent(true, true)]
    local procedure OnBeforeCreateDefaultCategoryAction(var CustomerCategory: Record "Customer Category")
    begin
    end;


    [IntegrationEvent(true, true)]
    local procedure OnAfterCreateDefaultCategoryAction(var CustomerCategory: Record "Customer Category")
    begin
    end;
}