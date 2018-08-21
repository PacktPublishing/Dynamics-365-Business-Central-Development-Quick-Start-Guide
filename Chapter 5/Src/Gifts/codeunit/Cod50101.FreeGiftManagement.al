codeunit 50101 "FreeGiftManagement"
{
    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure AddFreeGift(var Rec: Record "Sales Line")
    var
        FreeGift: Record FreeGifts;
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
    begin
        //if (Rec.Type = Rec.Type::Item) and (IsCustomerGOLD(Rec."Sell-to Customer No.")) then begin
            if (Rec.Type = Rec.Type::Item) and (Customer.Get(Rec."Sell-to Customer No.")) then begin
            if FreeGift.Get(Customer."Customer Category SDM", Rec."No.") and (rec.Quantity > FreeGift.MinimumOrderQuantity) then begin
                //Integration event raised
                OnBeforeFreeGiftSalesLineAdded(Rec);
                //Creates a new Sales Line with the free gift
                SalesLine.init;
                SalesLine.TransferFields(Rec);
                SalesLine."Line No." := Rec."Line No." + 10000;
                SalesLine.Validate(Quantity, FreeGift.GiftQuantity);
                SalesLine.Validate("Line Discount %", 100);
                if SalesLine.Insert() then;
                //Integration Event raised
                OnAfterFreeGiftSalesLineAdded(Rec, SalesLine);
            end;

        end;
    end;


    [IntegrationEvent(true, true)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var Rec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure OnAfterFreeGiftSalesLineAdded(var Rec: Record "Sales Line"; var SalesLineGift: Record "Sales Line")
    begin
    end;

    [EventSubscriber(ObjectType::Table, 32, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterItemLedgerEntryInsert(var Rec: Record "Item Ledger Entry")
    var
        Customer: Record Customer;
    begin
        if rec."Entry Type" = rec."Entry Type"::Sale then begin
            if Customer.Get(Rec."Source No.") then begin
                rec."Customer Category SDM" := Customer."Customer Category SDM";
                rec.Modify();
            end;
        end;
    end;


     local procedure IsCustomerGOLD(CustomerNo: Code[20]): Boolean
    var
        Customer: Record Customer;
    begin
        if Customer.Get(CustomerNo) and (Customer."Customer Category SDM" = 'GOLD') then
            exit(true)
        else
            exit(false);
    end;

}