page 52303 "ERF SFTT Setup"
{
    ApplicationArea = All;
    Caption = 'SFTT Setup';
    PageType = Card;
    SourceTable = "ERF SFTT Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ToolTip = 'Specifies the value of the Journal Template Name field.', Comment = '%';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ToolTip = 'Specifies the value of the Journal Batch Name field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(EmployeeUserIDMapping)
            {
                ApplicationArea = All;
                Caption = 'Employee User ID Mapping';
                Ellipsis = true;
                Image = Route;
                trigger OnAction()
                var
                    EmployeeUserIDMapping: Record "ERF User ID Mapping";
                begin
                    EmployeeUserIDMapping.Reset();
                    EmployeeUserIDMapping.SetRange("Used In", EmployeeUserIDMapping."Used In"::"Microsoft Power Apps");
                    EmployeeUserIDMapping.SetRange("Useful For", EmployeeUserIDMapping."Useful For"::"Shop Floor Time Tracking Entries");
                    if EmployeeUserIDMapping.FindLast() then
                        Page.RunModal(Page::"ERF User ID Mappings", EmployeeUserIDMapping);
                end;
            }
        }
    }
}
