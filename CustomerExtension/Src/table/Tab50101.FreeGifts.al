table 50101 "FreeGifts"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Free Gift List";
    LookupPageId = "Free Gift List";
    Caption='Free Gifts';

    fields
    {
        field(1; CustomerCategoryCode; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer Category";
            Caption = 'Customer Category Code';
        }
        field(2; ItemNo; Code[20])
        {

            DataClassification = CustomerContent;
            TableRelation = Item;
            Caption = 'Item No.';
        }
        field(3; MinimumOrderQuantity; Decimal)
        {

            DataClassification = CustomerContent;
            Caption = 'Minimum Order Quantity';
        }
        field(4; GiftQuantity; Decimal)
        {

            DataClassification = CustomerContent;
            Caption = 'Free Gift Quantity';
        }
    }

    keys
    {
        key(PK; CustomerCategoryCode, ItemNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}