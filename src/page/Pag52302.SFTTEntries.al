page 52302 "ERF SFTT Entries"
{
    ApplicationArea = All;
    Caption = 'Shop Floor Time Tracking Entries';
    PageType = List;
    SourceTable = "ERF SFTT Entry";
    SourceTableView = sorting("Entry No.")
                      order(descending);

    UsageCategory = History;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                    Visible = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No. field.', Comment = '%';
                    Visible = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }

                field("Prod Order No."; Rec."Prod Order No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Production Order No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Operation No."; Rec."Operation No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Operation No. field.', Comment = '%';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Routing Header Item Description field.', Comment = '%';
                }
                field("Operation Description"; Rec."Operation Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Routing Line Operation Description field.', Comment = '%';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Time field.', Comment = '%';
                }
                field("Output Quantity"; Rec."Output Quantity")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Output Quantity field.', Comment = '%';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Serial No. field.', Comment = '%';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Time field.', Comment = '%';
                }
                field("Duration in Minutes"; Rec."Duration in Minutes")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Duration in Minutes field.', Comment = '%';
                }
                field("Time Duration"; Rec."Time Duration")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Duration field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
            }
        }
    }
}
