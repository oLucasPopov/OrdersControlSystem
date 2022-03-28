unit untAddCustomerFactory;

interface
uses untAddCustomerController, untDbAddCustomer, untCustomerPostgresRepository;

type
  TAddCustomerFactory = class
    class function make: TAddCustomerController;
  end;


implementation

{ TAddCustomerFactory }

class function TAddCustomerFactory.make: TAddCustomerController;
var
  addCustomerRepository: TDbAddCustomer;
  customerPostgresRepository: TCustomerPostgresRepository;
begin
  customerPostgresRepository := TCustomerPostgresRepository.Create;
  addCustomerRepository      := TDbAddCustomer.Create(CustomerPostgresRepository);
  Result                     := TAddCustomerController.Create(addCustomerRepository);
end;

end.
