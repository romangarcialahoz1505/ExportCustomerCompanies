table 54350 "RMN Select Company ECC"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Name ECC"; Text[30])
        {
            Caption = 'Nombre ECC';
            DataClassification = ToBeClassified;
            TableRelation = Company;

            trigger OnValidate()
            var
                Company: Record Company;

            begin
                Company.Get("Name ECC");
                "Display Name ECC" := Company."Display Name";

            end;

        }
        field(20; "Display Name ECC"; Text[250])
        {
            Caption = 'Mostrar Nombre ECC';
            DataClassification = ToBeClassified;
        }

        field(30; "Select Company"; Boolean)
        {
            Caption = 'Mostrar Nombre ECC';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Name ECC")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}