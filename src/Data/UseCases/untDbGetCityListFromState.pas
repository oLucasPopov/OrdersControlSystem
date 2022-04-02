unit untDbGetCityListFromState;

interface
uses untGetCityListFromStateRepository, untCityModel, system.Generics.Collections, untGetCityListFromStateUC;

type
  TDbGetCityListFromState = class(TInterfacedObject, GetCityListFromState)
  private
    cityListFromStateRepository: GetCityListFromStateRepository;
  public
    constructor Create(cityListFromStateRepository: GetCityListFromStateRepository);
    function get(stateID: Integer): TList<TCityModel>;
  end;

implementation

{ TDbGetCityListFromState }

constructor TDbGetCityListFromState.Create(cityListFromStateRepository: GetCityListFromStateRepository);
begin
  Self.cityListFromStateRepository := cityListFromStateRepository;
end;

function TDbGetCityListFromState.get(stateID: Integer): TList<TCityModel>;
begin
  Result := Self.cityListFromStateRepository.listFromStateID(stateID);
end;

end.
