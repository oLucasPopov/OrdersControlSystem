unit untGetCityListFromStateRepository;

interface
uses System.Generics.Collections, untCityModel;

type
  GetCityListFromStateRepository = Interface
  ['{A65FDA69-7A25-417D-803F-28E009FC0D27}']
    function listFromStateID(stateID: Integer): TList<TCityModel>;
  End;

implementation

end.
