unit untCustomerPostgresRepository;

interface
uses untAddCustomerRepository, untAddCustomerUC, untCustomerModel, untPgHelper,
     FireDAC.Comp.Client, SysUtils, FireDAC.Stan.Param;

type
  TCustomerPostgresRepository = class(TInterfacedObject, AddCustomerRepository)
    function add(customerData: TAddCustomerModel): TCustomerModel;
  end;

const LB = #13#10;

implementation

{ TCustomerPostgresRepository }

function TCustomerPostgresRepository.add(customerData: TAddCustomerModel): TCustomerModel;
var
  qryAddCustomer: TFDQuery;
begin
  qryAddCustomer := TPgHelper.CreateNewQuery;
  try
    try
      qryAddCustomer.SQL.Text := 'INSERT INTO CLIENTES('
                             +LB+'  NOME_FANTASIA      '
                             +LB+' ,RAZAO_SOCIAL       '
                             +LB+' ,CPF_CNPJ           '
                             +LB+' ,TELEFONE           '
                             +LB+' ,CELULAR            '
                             +LB+' ,EMAIL              '
                             +LB+' ,OBSERVACOES        '
                             +LB+')                    '
                             +LB+'VALUES(              '
                             +LB+'  :NOME_FANTASIA     '
                             +LB+' ,:RAZAO_SOCIAL      '
                             +LB+' ,:CPF_CNPJ          '
                             +LB+' ,:TELEFONE          '
                             +LB+' ,:CELULAR           '
                             +LB+' ,:EMAIL             '
                             +LB+' ,:OBSERVACOES       '
                             +LB+') RETURNING *        ';

      qryAddCustomer.ParamByName('NOME_FANTASIA').AsString := customerData.companyName;
      qryAddCustomer.ParamByName('RAZAO_SOCIAL' ).AsString := customerData.tradingName;
      qryAddCustomer.ParamByName('CPF_CNPJ'     ).AsString := customerData.cpf_cnpj;
      qryAddCustomer.ParamByName('TELEFONE'     ).AsString := customerData.phone;
      qryAddCustomer.ParamByName('CELULAR'      ).AsString := customerData.cellphone;
      qryAddCustomer.ParamByName('EMAIL'        ).AsString := customerData.email;
      qryAddCustomer.ParamByName('OBSERVACOES'  ).AsString := customerData.obs;
      qryAddCustomer.Open;

      Result             := TCustomerModel.Create;
      Result.id          := qryAddCustomer.FieldByName('id').AsInteger;
      Result.companyName := qryAddCustomer.ParamByName('NOME_FANTASIA').AsString;
      Result.tradingName := qryAddCustomer.ParamByName('RAZAO_SOCIAL' ).AsString;
      Result.cpf_cnpj    := qryAddCustomer.ParamByName('CPF_CNPJ'     ).AsString;
      Result.phone       := qryAddCustomer.ParamByName('TELEFONE'     ).AsString;
      Result.cellphone   := qryAddCustomer.ParamByName('CELULAR'      ).AsString;
      Result.email       := qryAddCustomer.ParamByName('EMAIL'        ).AsString;
      Result.obs         := qryAddCustomer.ParamByName('OBSERVACOES'  ).AsString;
    except
      on E: Exception do
      begin
        TPgHelper.Rollback;
        Raise;
      end;
    end;
  finally
    qryAddCustomer.Free;
  end;
end;

end.
