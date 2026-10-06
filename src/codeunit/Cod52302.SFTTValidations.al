codeunit 52302 "ERF SFTT Validations"
{
    procedure ValidateStartOperation(var SFTTRec: Record "ERF SFTT Entry")
    var
        SFTTEntry: Record "ERF SFTT Entry";
        LogoutErrLbl: Label 'PLEASE LOG OUT OF CURRENT ACTIVE PRODUCTION ORDER [NUMBER %1 AND ROUTING STEP %2] BEFORE SCANNING INTO NEW PRODUCTION ORDER. ENTRY NO. %3';
    begin
        SFTTEntry.Reset();
        SFTTEntry.SetRange("User ID", SFTTRec."User ID");
        SFTTEntry.SetRange(Status, 'In Progress');
        if SFTTEntry.FindFirst() then begin
            // if ((SFTTEntry."Prod Order No." = SFTTRec."Prod Order No.") and (SFTTEntry."Line No." = SFTTRec."Line No.") and (SFTTEntry."Operation No." = SFTTRec."Operation No.")) then
            //     Error('This operation is already in progress');
            Error(StrSubstNo(LogoutErrLbl, SFTTEntry."Prod Order No.", UpperCase(SFTTEntry."Operation Description"), SFTTEntry."Entry No."));
        end;
    end;
}
