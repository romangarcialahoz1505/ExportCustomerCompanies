pageextension 54350 "RMN Customer List ECC" extends "Customer List"
{

    actions
    {
        addbefore(PaymentRegistration)
        {
            action(ExportCustomer)
            {
                ApplicationArea = All;
                Caption = 'Exportar cliente';
                ToolTip = 'Exporta el cliente a otra empresa';
                Image = ExportContact;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExportCustomer: Codeunit "RMN Export Customer FCC";
                    Countrep: Integer;

                begin
                    ExportCustomer.GetCustomer(Rec);

                end;
            }
        }
    }

    var
        myInt: Integer;
}