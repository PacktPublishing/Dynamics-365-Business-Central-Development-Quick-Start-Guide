pageextension 50102 "CustomerCardExtension" extends "Customer Card" //21
{
    layout
    {
        // Add changes to page layout here
        /* modify("E-Mail")
        {
            ApplicationArea = "NotExist";
            Enabled = false;
            Visible = false;
        } */

        addlast(General)
        {
            field("Customer Category SDM"; "Customer Category SDM")
            {
                ToolTip = 'Customer Category';
                ApplicationArea = All; //Always add this!
            }
        }

        //Custom Fast Tab
        addlast(Content)
        {
            group(MyCustomFastTab)
            {
                Caption = 'My Custom Fast Tab';
            }
        }

    }

    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action("Assign default category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All; //Always add this!
                Caption = 'Assign Default Category';
                ToolTip = 'Assign Default Category';

                trigger OnAction();
                var
                    //CustomerCategory : Record "Customer Category";
                    cuCustomer: Codeunit "Customer Management";
                begin
                    //Assegno la categoria settata come default

                    //CustomerCategory.SetRange(Default,true);
                    //if CustomerCategory.FindFirst then
                    //begin
                    //    Rec."Customer Category" := CustomerCategory.No;
                    //    Rec.Modify;
                    //end;
                    cuCustomer.AssignDefaultCategory(Rec."No.");
                end;
            }
        }
    }

    var
        myInt: Integer;
}