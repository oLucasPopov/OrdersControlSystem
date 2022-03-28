unit untDbGetStateList;

interface
uses System.Generics.Collections, untStateModel, untGetStateListUC,
     untGetStateListRepository;

type
  TDbGetStateList = class(TInterfacedObject, GetStateList)
  private
    stateRepository: GetStateListRepository;
  public
    constructor Create(stateRepository: GetStateListRepository);
    function get: TList<TStateModel>;
  end;

implementation

{ TDbGetStateList }

constructor TDbGetStateList.Create(stateRepository: GetStateListRepository);
begin
  Self.stateRepository := stateRepository;
end;

function TDbGetStateList.get: TList<TStateModel>;
begin
  Result := Self.stateRepository.get;
end;

end.
