
table 50100 "Customer Category"
{
    DrillDownPageId = "Customer Category List";
    LookupPageId = "Customer Category List";
    Caption='Customer Category';

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';            
            trigger OnValidate();
            begin

            end;
        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            //CaptionML = ENU = 'Description', ITA = 'Descrizione';
            Caption = 'Description';
        }
        field(3; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }
        field(4; TotalCustomersForCategory; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count (Customer where ("Customer Category SDM" = field (No)));
            //CaptionML = ENU = 'Total customers for category', ITA = 'Nr. clienti nella categoria';
            Caption = 'Total customers for category';
        }

        field(5; EnableNewsletter; Option)
        {
            OptionMembers = " ","Full","Limited";
            OptionCaption = ' ,Full,Limited';
            Caption = 'Enable Newsletter';
            DataClassification = CustomerContent;
        }

        field(6; FreeGiftsAvailable; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gifts Available';
        }

    }

    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        //MyOption: Option " ","Option1","Option2";

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}