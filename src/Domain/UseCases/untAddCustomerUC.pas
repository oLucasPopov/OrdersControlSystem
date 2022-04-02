unit untAddCustomerUC;

interface
uses untCustomerModel, System.Generics.Collections;

type
  TAddCustomerAddressModel = class
    cep: String;
    address: String;
    streetName: String;
    streetNumber: String;
    neighbourhood: String;
    state: Integer;
    city: Integer;
    reference: String;
  end;

  TAddCustomerModel = class
    companyName: String;
    tradingName: String;
    cpf_cnpj: String;
    phone: String;
    cellphone: String;
    email: String;
    address: TList<TAddCustomerAddressModel>;
    obs: String;
  end;

  AddCustomer = interface
    ['{9FA80242-7B53-4C18-A88D-D0D66C4077D9}']
    function add(account: TAddCustomerModel): TCustomerModel;
  end;

implementation

end.
