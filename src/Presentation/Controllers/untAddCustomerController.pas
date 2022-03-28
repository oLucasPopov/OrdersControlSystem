unit untAddCustomerController;

interface
uses untAddCustomerUC, untCustomerModel;

type
  TAddCustomerController = class
  private
    addCustomer: AddCustomer;
  public
    constructor Create(addCustomer: AddCustomer);
    function handle(customer: TAddCustomerModel): TCustomerModel;
  end;
implementation

{ TAddCustomerController }

constructor TAddCustomerController.Create(addCustomer: AddCustomer);
begin
  Self.addCustomer := addCustomer;
end;

function TAddCustomerController.handle(customer: TAddCustomerModel): TCustomerModel;
begin
    //validador de nome social -> Campo obrigatório (requiredFieldValidation)
    //validador de cpf         -> InvalidFieldValidation
    //validador de cnpj        -> InvalidFieldValidation
    //validador de celular     -> InvalidFieldValidation
    //validador de telefone    -> InvalidFieldValidation
   Result := Self.addCustomer.add(customer);
//    Self.AddCustomerAddress(customerAddress)

end;

end.
