unit untGetCityListFromStateUC;

interface
uses System.Generics.Collections,  untCityModel;

type
GetCityListFromState = interface
  function get(stateID: Integer): TList<TCityModel>;
end;
implementation

end.
