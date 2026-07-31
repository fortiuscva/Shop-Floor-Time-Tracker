table 52301 "ERF SFTT Entry"
{
    Caption = 'Shop Floor Time Tracking Entry';
    LookupPageId = "ERF SFTT Entries";
    DrillDownPageId = "ERF SFTT Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Prod Order No."; Code[20])
        {
            Caption = 'Production Order No.';
            TableRelation = "Production Order"."No." where(Status = const(Released));
            DataClassification = CustomerContent;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(4; "Operation No."; Code[10])
        {
            Caption = 'Operation No.';
            DataClassification = CustomerContent;
        }
        field(5; "Start Time"; DateTime)
        {
            Caption = 'Start Time';
            DataClassification = CustomerContent;
        }
        field(6; "End Time"; DateTime)
        {
            Caption = 'End Time';
            DataClassification = CustomerContent;
        }
        field(7; "Duration in Minutes"; Integer)
        {
            Caption = 'Duration in Minutes';
            DataClassification = CustomerContent;
        }
        field(8; Status; Text[30])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(9; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if ((Rec."Employee No." <> xRec."Employee No.") and (Rec."Employee No." <> '')) then begin
                    Employee.Reset();
                    if Employee.Get("Employee No.") then
                        Rec.Validate("Employee Name", Employee."Search Name");
                end else
                    Rec.Validate("Employee Name", '');
            end;
        }
        field(10; "Employee Name"; Code[250])
        {
            Caption = 'Employee Name';
            DataClassification = CustomerContent;
        }
        field(11; "Output Quantity"; Decimal)
        {
            Caption = 'Output Quantity';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(12; "Serial No."; Code[250])
        {
            Caption = 'Serial No.';
            DataClassification = CustomerContent;
        }
        field(13; "Item Description"; Text[100])
        {
            Caption = 'RPO Header Item Description';
            DataClassification = CustomerContent;
        }
        field(14; "Operation Description"; Text[100])
        {
            Caption = 'Routing Line Operation Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        ProdOrder: Record "Production Order";
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        SFTTValidation: Codeunit "ERF SFTT Validations";
        Functions: Codeunit "ERF Functions";
        RoutingNo: Code[20];
    begin
        SFTTValidation.ValidateStartOperation(Rec);

        ProdOrder.Reset();
        if ProdOrder.Get(ProdOrder.Status::Released, "Prod Order No.") then
            "Item Description" := ProdOrder.Description;

        RoutingNo := Functions.GetRoutingNo("Prod Order No.", "Line No.", "Operation No.");

        ProdOrderRoutingLine.Reset();
        if ProdOrderRoutingLine.Get(ProdOrderRoutingLine.Status::Released, "Prod Order No.", "Line No.", RoutingNo, "Operation No.") then
            "Operation Description" := ProdOrderRoutingLine.Description;
    end;
}
