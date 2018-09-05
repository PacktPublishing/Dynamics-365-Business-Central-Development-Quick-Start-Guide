tableextension 50100 "CustomerTableExtensions" extends Customer //18 
{
    fields
    {
        // Add changes to table fields here


        field(50100; "Customer Category SDM"; Code[20])
        {
            TableRelation = "Customer Category".No;
            Caption='Customer Category Code';
            Description = 'Customer Category (CUSTOM)';
            DataClassification = CustomerContent;

        }

        // modify(Amount)
        // {
        //     //BlankZero = true;
        //     Caption = 'Importo';            
        // }
    }

    var
        myInt: Integer;

        //!Override of a standard function in Customer table
    local procedure CreateAndShowNewInvoice(Category: Code[20])
    var
        CustomerCategory: Record "Customer Category";
    begin
        //Call standard NAV function
        rec.CreateAndShowNewInvoice();
        //Do other actions
        if CustomerCategory.Get(Category) and (CustomerCategory.Default) then begin
            //...
        end;
    end;
}