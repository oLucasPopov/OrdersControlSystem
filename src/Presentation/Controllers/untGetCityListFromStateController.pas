unit untGetCityListFromStateController;

interface
uses System.Generics.Collections, untCityModel, untGetCityListFromStateUC;

type

TGetCityListFromStateController = class
  private
    getCityListFromState: GetCityListFromState;
  public
    constructor Create(getCityListFromState: GetCityListFromState);
    function list(stateID: Integer): TList<TCityModel>;
end;

implementation

{ TGetCityListFromStateController }

constructor TGetCityListFromStateController.Create(getCityListFromState: GetCityListFromState);
begin
  Self.getCityListFromState := getCityListFromState;
end;

function TGetCityListFromStateController.list(stateID: Integer): TList<TCityModel>;
begin
  Result := Self.getCityListFromState.get(stateID);
end;

end.
