pageextension 52302 "Work Center Card Ext" extends "Work Center Card"
{
    layout
    {
        addafter(Blocked)
        {
            field("Blocked for Scan"; Rec."Blocked for Scan")
            {
                ApplicationArea = All;
            }
        }
    }
}
