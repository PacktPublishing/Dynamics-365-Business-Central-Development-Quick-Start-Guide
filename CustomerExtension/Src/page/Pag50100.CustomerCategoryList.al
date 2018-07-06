
page 50100 "Customer Category List"
{
    PageType = List;
    SourceTable = "Customer Category";
    UsageCategory = Lists; //To be inserted in D365BC Search
    //CaptionML = ENU = 'Customer Category List', ITA = 'Lista Categorie Cliente';
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
                    ToolTip='Total Customers for Category';
                }

                //Campo con SourceExpression una funzione definita in una codeunit
                //field(TEST;cu.TEST)
                //{
                //    Editable = false;
                //}                

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
                Caption='Create default category';

                trigger OnAction();
                begin
                    Rec.No := 'DEFAULT';
                    Rec.Description := 'Default Customer Category';
                    Rec.Default := true;
                    if Rec.Insert then;
                    //!Integration event raised
                    DefaultCategoryAssigned(Rec);
                end;
            }
        }
    }

    var
        //cu: Codeunit "Customer Management";



    [IntegrationEvent(true, true)]
    local procedure DefaultCategoryAssigned(var CustomerCategory: Record "Customer Category")
    begin
    end;
}