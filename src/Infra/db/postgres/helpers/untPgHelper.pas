unit untPgHelper;

interface
uses untPostgresDataModule, FireDAC.Phys.PgDef, FireDAC.Comp.Client;

type
  TPgHelper = class
    class procedure Connect;
    class procedure TransactionON;
    class procedure Commit;
    class procedure Rollback;
    class function CreateNewQueryRO: TFDQuery;
    class function CreateNewQuery: TFDQuery;
    class function Connection: TFDConnection;
  end;

implementation

{ TPgHelper }

class procedure TPgHelper.Connect;
begin
  with dmPostgres.fdPgConnection do
  begin
    DriverName := 'PG';
    params.Database := 'my_erp';
    params.Password := 'senha123';
    params.DriverID := 'PG';
    params.UserName := 'postgres';
  end;

  (dmPostgres.fdPgConnection.Params as TFDPhysPGConnectionDefParams).Server := '127.0.0.1';
  (dmPostgres.fdPgConnection.Params as TFDPhysPGConnectionDefParams).Port   := 5432;
  dmPostgres.fdPgConnection.Connected := True;
end;

class function TPgHelper.Connection: TFDConnection;
begin
  result := dmPostgres.fdPgConnection;
end;

class function TPgHelper.CreateNewQuery: TFDQuery;
begin
  Result := TFDQuery.Create(dmPostgres);
  try
     Result.Connection  := Self.Connection;
     Result.Transaction := dmPostgres.fdPgTransaction;
  except
    Result.Free;
    raise;
  end;
end;

class function TPgHelper.CreateNewQueryRO: TFDQuery;
begin
  Result := TFDQuery.Create(dmPostgres);
  try
     Result.Connection  := Self.Connection;
     Result.Transaction := dmPostgres.fdPgTransaction;
  except
    Result.Free;
    raise;
  end;
end;

class procedure TPgHelper.Commit;
begin
  dmPostgres.fdPgTransaction.Commit;
end;

class procedure TPgHelper.Rollback;
begin
  dmPostgres.fdPgTransaction.Rollback;
end;

class procedure TPgHelper.TransactionON;
begin
  dmPostgres.fdPgTransaction.StartTransaction;
end;

end.
