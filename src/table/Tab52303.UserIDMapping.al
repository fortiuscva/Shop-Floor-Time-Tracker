table 52303 "ERF User ID Mapping"
{
    Caption = 'User ID Mapping';
    LookupPageId = "ERF User ID Mappings";
    DrillDownPageId = "ERF User ID Mappings";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "User ID"; Text[80])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            DataClassification = CustomerContent;
            TableRelation = Employee;
            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                Employee.Reset();
                Employee.Get("Employee No.");
                "Employee Name" := Employee.FullName();
            end;
        }
        field(3; "Employee Name"; Text[250])
        {
            Caption = 'Employee Name';
            DataClassification = CustomerContent;
        }
        field(4; "Used In"; Enum "ERF Used In")
        {
            Caption = 'Used In';
            DataClassification = CustomerContent;
        }
        field(5; "Useful For"; Enum "ERF Useful For")
        {
            Caption = 'Useful For';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "User ID", "Employee No.", "Employee Name")
        {
        }
        fieldgroup(Brick; "User ID", "Employee No.", "Employee Name")
        {
        }
    }
}