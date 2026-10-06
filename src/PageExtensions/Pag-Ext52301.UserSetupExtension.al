pageextension 52301 "ERF User Setup Extension" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("ERF Allow Deletion of SFTT Entries"; Rec."Allow Deletion of SFTT Entries")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow Deletion of SFTT Entries field.', Comment = '%';
            }
        }
    }
}
