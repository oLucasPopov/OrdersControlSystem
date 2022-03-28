unit untCustomerModel;

interface
type
  TCustomerModel = class
  public
    id: Integer;
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

implementation

end.
