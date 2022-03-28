unit untAddCustomerUC;

interface
uses untCustomerModel;

type
  TAddCustomerModel = class
    companyName: String;
    tradingName: String;
    cpf_cnpj: String;
    phone: String;
    cellphone: String;
    email: String;
    cep: String;
    address: String;
    streetName: String;
    streetNumber: String;
    neighbourhood: String;
    state: Integer;
    city: Integer;
    reference: String;
    obs: String;
  end;

  AddCustomer = interface
    ['{9FA80242-7B53-4C18-A88D-D0D66C4077D9}']
    function add(account: TAddCustomerModel): TCustomerModel;
  end;

implementation

end.
