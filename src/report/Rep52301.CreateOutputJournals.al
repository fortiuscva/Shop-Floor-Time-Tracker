report 52301 "ERF Create Output Journals"
{
    ApplicationArea = All;
    Caption = 'Create Output Journals';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(SFTTEntry; "ERF SFTT Entry")
        {
            DataItemTableView = sorting("Entry No.") where(Status = const(Finished));
            trigger OnAfterGetRecord()
            var
                Functions: Codeunit "ERF SFTT Functions";
            begin
                SFTTSetup.Get();
                Functions.CreateOutputJournal(SFTTEntry, SFTTSetup);
            end;
        }
    }
    trigger OnPreReport()
    begin
        Window.Open('Creating Output Journals for SFTT Entries..');
        Sleep(1000);
    end;

    trigger OnPostReport()
    begin
        Sleep(1000);
        Window.Close();
        Message('Output Journals were successfully created');
    end;

    var
        Window: Dialog;
        SFTTSetup: Record "ERF SFTT Setup";
}
