codeunit 52301 "ERF Functions"
{
    trigger OnRun()
    var
        SFTTEntry: Record "ERF SFTT Entry";
        ItemJnlLine2: Record "Item Journal Line";
    begin
        SFTTEntry.Reset;
        SFTTEntry.SetRange(Status, 'Completed');
        IF SFTTEntry.FindSet() then begin
            repeat
                CreateOutputJournal(SFTTEntry);
            until SFTTEntry.Next() = 0;
            ItemJnlLine2.RESET();
            ItemJnlLine2.SetRange("Journal Template Name", 'OUTPUT');
            ItemJnlLine2.SetRange("Journal Batch Name", 'SHOPFLOOR');
            Codeunit.Run(Codeunit::"Item Jnl.-Post Batch", ItemJnlLine2);
        end;
    end;

    procedure CreateOutputJournal(var SFTTEntry: Record "ERF SFTT Entry")
    begin
        SFTTSetup.Get();
        ItemJnlLine.Init();
        ItemJnlLine."Journal Template Name" := SFTTSetup."Journal Template Name";
        ItemJnlLine."Journal Batch Name" := SFTTSetup."Journal Batch Name";
        ItemJnlLine."Line No." := GetLineNo();
        ItemJnlLine.Insert(true);
        ItemJnlLine.Validate("Posting Date", Today);
        ItemJnlLine.Validate("Entry Type", ItemJnlLine."Entry Type"::Output);
        ItemJnlLine.Validate("Order Type", ItemJnlLine."Order Type"::Production);
        ItemJnlLine.Validate("Order No.", SFTTEntry."Prod Order No.");
        ItemJnlLine.Validate("Item No.", GetRPOItemNo(SFTTEntry));
        ItemJnlLine.Validate("Order Line No.", SFTTEntry."Line No.");
        ItemJnlLine.Validate("Operation No.", SFTTEntry."Operation No.");
        ItemJnlLine.Validate("Document No.", 'SFTT' + format(SFTTEntry."Entry No."));
        ItemJnlLine.Validate("Routing No.", GetRoutingNo(SFTTEntry."Prod Order No.", SFTTEntry."Line No.", SFTTEntry."Operation No."));
        ItemJnlLine.Validate("Routing Reference No.", SFTTEntry."Line No.");
        ItemJnlLine.Validate("Run Time", SFTTEntry."Duration in Minutes");
        ItemJnlLine.Validate("Output Quantity", SFTTEntry."Output Quantity");
        ItemJnlLine.Validate("Item No.", GetRPOItemNo(SFTTEntry));
        ItemJnlLine.Validate("Cap. Unit of Measure Code", 'MINUTES');
        ItemJnlLine.Modify(true);
        SFTTEntry.Validate(Status, 'Processed');
        SFTTEntry.Modify(true);
    end;

    procedure GetLineNo(): Integer
    var
        ItemJnlLineLcl: Record "Item Journal Line";
    begin
        ItemJnlLineLcl.Reset;
        ItemJnlLineLcl.SetRange("Journal Template Name", SFTTSetup."Journal Template Name");
        ItemJnlLineLcl.SetRange("Journal Batch Name", SFTTSetup."Journal Batch Name");
        if ItemJnlLineLcl.FindLast() then
            exit(ItemJnlLineLcl."Line No." + 10000)
        else
            exit(10000);
    end;

    procedure GetRPOItemNo(var SFTTEntry: Record "ERF SFTT Entry"): Code[20]
    var
        ProductionOrder: Record "Production Order";
    begin
        ProductionOrder.Reset();
        IF ProductionOrder.GET(ProductionOrder.Status::Released, SFTTEntry."Prod Order No.") then
            IF ProductionOrder."Source Type" = ProductionOrder."Source Type"::Item then
                exit(ProductionOrder."Source No.");
    end;

    procedure GetRoutingNo(ProdOrderNo: Code[20]; RoutingRefNo: Integer; OperationNo: Code[10]): Code[20]
    var
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
    begin
        ProdOrderRoutingLine.Reset();
        ProdOrderRoutingLine.SetRange("Prod. Order No.", ProdOrderNo);
        ProdOrderRoutingLine.SetRange("Routing Reference No.", RoutingRefNo);
        ProdOrderRoutingLine.SetRange("Operation No.", OperationNo);
        If ProdOrderRoutingLine.FindFirst() then
            exit(ProdOrderRoutingLine."Routing No.");
    end;

    var
        SFTTSetup: Record "ERF SFTT Setup";
        ItemJnlLine: Record "Item Journal Line";
}
