page 52301 "ERF SFTT Entry API"
{
    PageType = API;
    DelayedInsert = true;
    SourceTable = "ERF SFTT Entry";
    APIGroup = 'EliteRF';
    APIPublisher = 'EliteRF';
    APIVersion = 'v2.0';
    EntityName = 'SFTTEntry';
    EntitySetName = 'SFTTEntries';


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                }
                field(employeeNo; Rec."Employee No.")
                {
                    Caption = 'Employee No.';
                }
                field(employeeName; Rec."Employee Name")
                {
                    Caption = 'Employee Name';
                }
                field(prodOrderNo; Rec."Prod Order No.")
                {
                    Caption = 'Production Order No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(operationNo; Rec."Operation No.")
                {
                    Caption = 'Operation No.';
                }
                field(startTime; Rec."Start Time")
                {
                    Caption = 'Start Time';
                }
                field(outputQuantity; Rec."Output Quantity")
                {
                    Caption = 'Output Quantity';
                }
                field(serialNo; Rec."Serial No.")
                {
                    Caption = 'Serial No.';
                }
                field(endTime; Rec."End Time")
                {
                    Caption = 'End Time';
                }
                field(durationInMinutes; Rec."Duration in Minutes")
                {
                    Caption = 'Duration in Minutes';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
            }
        }
    }
}
