unit untGetStateListRepository;

interface
uses System.Generics.Collections, untStateModel;

type
GetStateListRepository = interface
  ['{ADBA0026-0196-43B5-AB2C-B90BE1E340DB}']
  function get: TList<TStateModel>;
end;

implementation

end.
