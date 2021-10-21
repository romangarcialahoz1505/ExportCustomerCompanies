codeunit 54350 "RMN Export Customer FCC"
{
    var
        WinMakeCustomer: Label 'Generando actualizando cliente\';
        WinInsertCustomer: Label 'Creando cliente          #1######';

    trigger OnRun()
    begin


    end;

    procedure GetCustomer(Custom: Record Customer)
    var
        Getcompanies: Page "RMN Get Companies ECC";

    begin
        Getcompanies.CustomerFromCU(Custom);

        Getcompanies.LookupMode := true;
        if Getcompanies.RunModal() <> Action::Cancel then;

    end;

    procedure DataExport(VAR Company2: Record Company; CustomerPE: Record Customer) //VAR Company2 era el error porque no filtraba por las seleccinadas
    var
        CustomerImport: Record Customer;
        Window: Dialog;
        LineCount: Integer;
        ConfirmUpdateCustomer: Label 'El cliente %1 ya existe en la empresa %2, ¿desae actualizar sus datos?';

    begin

        if Company2.FindFirst() then begin
            Window.Open(WinMakeCustomer + WinInsertCustomer);
            repeat
                LineCount := LineCount + 1;
                Window.Update(1, LineCount);
                CustomerImport.ChangeCompany(Company2.Name);
                if CustomerImport.Get(CustomerPE."No.") then begin
                    if (Confirm(ConfirmUpdateCustomer, false, CustomerPE."No.", Company2.Name)) then begin
                        CustomerImport.Reset();
                        CustomerImport.LockTable();
                        CustomerImport.SetRange("No.", CustomerPE."No.");
                        if CustomerImport.FindFirst() then begin
                            CustomerImport := CustomerPE;
                            CustomerImport.Modify();
                        end;
                    end else
                        exit;
                end else begin
                    CustomerImport.Init();
                    CustomerImport.TransferFields(CustomerPE);
                    CustomerImport.Insert();//falta insert(true)
                end;
            until Company2.Next() = 0;
        end;

    end;

}