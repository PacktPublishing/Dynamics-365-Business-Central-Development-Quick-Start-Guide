page 50103 "Free Gift List"
{
    PageType = List;
    SourceTable = FreeGifts;
    UsageCategory = Lists; //To be inserted in D365BC Seearch
    //CaptionML=ENU='Free Gift Setup',ITA='Free Gift Setup';
    Caption='Free Gift Setup';
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CustomerCategoryCode; CustomerCategoryCode)
                {
                    ApplicationArea = All;
                }
                field(ItemNo; ItemNo)
                {
                    ApplicationArea = All;
                }
                field(MinimumOrderQuantity; MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
                field(GiftQuantity;GiftQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
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
            action(ActionName)
            {
                trigger OnAction();
                begin
                    
                end;
            }
        }
    }
}