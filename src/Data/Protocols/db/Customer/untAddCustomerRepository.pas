unit untAddCustomerRepository;

interface
uses untAddCustomerUC, untCustomerModel;

type
  AddCustomerRepository = interface
    ['{E4DF10C7-6FA5-44EB-A510-E0B7B0B79421}']
    function add(customerData: TAddCustomerModel): TCustomerModel;
  end;

implementation

end.
