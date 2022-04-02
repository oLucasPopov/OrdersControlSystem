unit untCityPostgresRepository;

interface
uses untGetCityListFromStateRepository, untCityModel, system.Generics.Collections,
     FireDAC.Comp.Client, untPgHelper;

type
  TCityPostgresRepository = class(TInterfacedObject, GetCityListFromStateRepository)
    function listFromStateID(stateID: Integer): TList<TCityModel>;
  end;

implementation

{ TCityListFromStatePostgresRepository }

function TCityPostgresRepository.listFromStateID(stateID: Integer): TList<TCityModel>;
var
  qryGetState: TFDQuery;
  cityList: TList<TCityModel>;
begin
  cityList   := TList<TCityModel>.Create;
  qryGetState := TPgHelper.CreateNewQuery;
  try
    qryGetState.Open('SELECT * FROM CIDADES WHERE ID_ESTADO = :ID', [stateID]);

    qryGetState.First;
    while not qryGetState.EoF do
    begin
      var cityModel: TCityModel := TCityModel.Create;
      cityModel.id      := qryGetState.FieldByName('id').AsInteger;
      cityModel.city    := qryGetState.FieldByName('cidade').AsString;
      cityModel.stateID := stateID;
      cityModel.idIBGE  := qryGetState.FieldByName('id_ibge').AsInteger;

      cityList.Add(cityModel);
      qryGetState.Next;
    end;

    Result := cityList;
  finally
    qryGetState.Free;
  end;
end;

end.
