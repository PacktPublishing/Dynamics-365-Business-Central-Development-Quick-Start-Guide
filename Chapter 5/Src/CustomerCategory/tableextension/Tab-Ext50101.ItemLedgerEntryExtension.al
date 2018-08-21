tableextension 50101 "ItemLedgerEntryExtension" extends "Item Ledger Entry"
{
       fields
    {
        // Add changes to table fields here

        
        //Campo valorizzato al posting di un movimento Vendita (Registrazione Spedizione)
        field(50100;"Customer Category SDM";Code[20])
        {
            TableRelation = "Customer Category".No;
            Description = 'Customer Category';
            Caption = 'Customer Category';

        }

       
    }

    keys
    {
        //key(FK; "Customer Category", "Item No.") //Not permitted
        key(FK; "Customer Category SDM")
        {

        }
    }
    
    var
        myInt: Integer;

        
}