page 52306 "ERF Stop Operation"
{
    ApplicationArea = All;
    Caption = 'Stop Operation (Manual - Admin Controlled)';
    PageType = StandardDialog;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(OutputQuantity; OutputQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'Output Quantity';
                    BlankZero = true;
                    ShowCaption = true;
                    ShowMandatory = true;
                }
                field(SerialNo; SerialNo)
                {
                    ApplicationArea = All;
                    Caption = 'Serial No.';
                    ShowCaption = true;
                    ShowMandatory = true;
                }
            }
        }
    }
    var
        OutputQuantity: Decimal;
        SerialNo: Code[50];

    procedure GetOutputQuantity(): Decimal
    begin
        exit(OutputQuantity);
    end;

    procedure GetSerialNo(): Code[50]
    begin
        exit(SerialNo);
    end;
}
