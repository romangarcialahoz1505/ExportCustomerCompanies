page 54350 "RMN Select Companies ECC"
{

    ApplicationArea = All;
    Caption = 'RMN Select Companies ECC';
    PageType = List;
    SourceTable = "RMN Select Company ECC";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Name ECC"; Rec."Name ECC")
                {
                    ApplicationArea = All;
                }
                field("Display Name ECC"; Rec."Display Name ECC")
                {
                    ApplicationArea = All;
                }
                field("Select Company"; Rec."Select Company")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        ExportCustomer: Codeunit "RMN Export Customer FCC";
        CustomerPE: Record Customer; //almacenar el valor del customer en la Page Extension PE

    trigger OnOpenPage()
    begin
        SetCurrentKey("Name ECC") //ordena la page por el nombre
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction in [Action::OK, Action::LookupOK] then
            ExportCustomerToCompanies();

    end;

    procedure ExportCustomerToCompanies()
    begin
        CurrPage.SetSelectionFilter(Rec);//filtra las empresas selecionadas a exportar el cliente por el usuario
        //ExportCustomer.DataExport(Rec, CustomerPE);

    end;

    procedure CustomerFromCU(Customer: Record Customer)
    begin
        CustomerPE := Customer;
    end;

}
