codeunit 52302 "ERF SFTT Validations"
{
    procedure ValidateStartOperation(var SFTTRec: Record "ERF SFTT Entry")
    var
        SFTTEntry: Record "ERF SFTT Entry";
    begin
        SFTTEntry.Reset();
        SFTTEntry.SetRange("Employee No.", SFTTRec."Employee No.");
        SFTTEntry.SetRange(Status, 'In Progress');
        if SFTTEntry.FindFirst() then begin
            if ((SFTTEntry."Prod Order No." = SFTTRec."Prod Order No.") and (SFTTEntry."Line No." = SFTTRec."Line No.") and (SFTTEntry."Operation No." = SFTTRec."Operation No.")) then
                Error('This operation is already in progress');
            Error('Another operation is already in progress for this employee');
        end;
    end;
}
