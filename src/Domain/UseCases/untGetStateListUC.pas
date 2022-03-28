unit untGetStateListUC;

interface
uses System.Generics.Collections, untStateModel;

type
GetStateList = interface
  function get: TList<TStateModel>;
end;


implementation

end.
