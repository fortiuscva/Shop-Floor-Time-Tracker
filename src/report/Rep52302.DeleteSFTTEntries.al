report 52302 "ERF Delete SFTT Entries"
{
    ApplicationArea = All;
    Caption = 'Delete SFTT Entries';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(SFTTEntry; "ERF SFTT Entry")
        {
            RequestFilterFields = "Entry No.";
            trigger OnAfterGetRecord()
            begin
                SFTTEntry.Delete(true);
            end;
        }
    }
}
