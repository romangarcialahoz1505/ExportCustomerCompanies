page 54351 "RMN Get Companies ECC"
{
    Caption = 'Empresas Grupo';
    PageType = List;
    SourceTable = Company;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
                field("Display Name"; "Display Name")
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
        SetCurrentKey(Name) //ordena la page por el nombre
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction in [Action::OK, Action::LookupOK] then
            ExportCustomerToCompanies();

    end;

    procedure ExportCustomerToCompanies()
    begin
        CurrPage.SetSelectionFilter(Rec);//filtra las empresas selecionadas a exportar el cliente por el usuario
        ExportCustomer.DataExport(Rec, CustomerPE);

    end;

    procedure CustomerFromCU(Customer: Record Customer)
    begin
        CustomerPE := Customer;
    end;




}