unit untGetStateListFactory;

interface
uses untGetStateListController, untDbGetStateList,
     untStatePostgresRepository;

type
  TGetStateListFactory = class
    class function make: TGetStateListController;
  end;


implementation

{ TGetStateListFactory }

class function TGetStateListFactory.make: TGetStateListController;
var
  getStateListRepository: TDbGetStateList;
  stateListPostgresRepository: TStatePostgresRepository;
begin
  stateListPostgresRepository := TStatePostgresRepository.Create;
  getStateListRepository      := TDbGetStateList.Create(stateListPostgresRepository);
  Result                      := TGetStateListController.Create(getStateListRepository);
end;

end.
