unit untStatePostgresRepository;

interface
uses system.Generics.Collections, FireDAC.Comp.Client, untPgHelper,
     untStateModel, untGetStateListRepository;

type
TStatePostgresRepository = class(TInterfacedObject, GetStateListRepository)
  function get: TList<TStateModel>;
end;

implementation

{ TStatePostgresRepository }

function TStatePostgresRepository.get: TList<TStateModel>;
var
  qryGetState: TFDQuery;
  stateList: TList<TStateModel>;
begin
  stateList   := TList<TStateModel>.Create;
  qryGetState := TPgHelper.CreateNewQuery;
  try
    qryGetState.Open('SELECT * FROM ESTADOS');

    qryGetState.First;
    while not qryGetState.EoF do
    begin
      var stateModel: TStateModel := TStateModel.Create;
      stateModel.id    := qryGetState.FieldByName('id').AsInteger;
      stateModel.state := qryGetState.FieldByName('estado').AsString;

      stateList.Add(stateModel);
      qryGetState.Next;
    end;

    Result := stateList;
  finally
    qryGetState.Free;
  end;
end;

end.
