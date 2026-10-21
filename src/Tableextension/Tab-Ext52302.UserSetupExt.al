tableextension 52302 "ERF User Setup Ext" extends "User Setup"
{
    fields
    {
        field(52101; "ERF Allow Delete SFTT Entries"; Boolean)
        {
            Caption = 'Allow Deletion of SFTT Entries';
            DataClassification = CustomerContent;
        }
        field(52102; "ERF Allow Update SFTT Entries"; Boolean)
        {
            Caption = 'Allow Modification of SFTT Entries';
            DataClassification = CustomerContent;
        }
        field(52103; "ERF Allow Manual Stop"; Boolean)
        {
            Caption = 'Allow Manual Stop Operation';
            DataClassification = CustomerContent;
        }
    }
}