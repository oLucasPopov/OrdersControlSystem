unit untDbAddCustomer;

interface
uses untAddCustomerUC, untCustomerModel, untAddCustomerRepository;
type

  TDbAddCustomer = class(TInterfacedObject, AddCustomer)
  private
    customerRepository: AddCustomerRepository;
  public
    constructor Create(customerRepository: AddCustomerRepository);
    function add(account: TAddCustomerModel): TCustomerModel;
  end;

implementation

{ TDbAddCustomer }

constructor TDbAddCustomer.Create(customerRepository: AddCustomerRepository);
begin
  Self.customerRepository := customerRepository;
end;

function TDbAddCustomer.add(account: TAddCustomerModel): TCustomerModel;
begin
  Result := Self.customerRepository.add(account);
end;


end.
