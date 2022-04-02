unit untGetCityListByStateFactory;

interface
uses untGetCityListFromStateController, untDbGetCityListFromState, untCityPostgresRepository;

type
 TGetCityListByState = class
   class function make: TGetCityListFromStateController;
 end;

implementation

{ TGetCityListByState }

class function TGetCityListByState.make: TGetCityListFromStateController;
var
  cityListFromStatePostgresRepository: TCityPostgresRepository;
  cityListFromStateRepository: TDbGetCityListFromState;
begin
  cityListFromStatePostgresRepository := TCityPostgresRepository.Create;
  cityListFromStateRepository := TDbGetCityListFromState.Create(cityListFromStatePostgresRepository);
  Result := TGetCityListFromStateController.Create(cityListFromStateRepository);
end;

end.
