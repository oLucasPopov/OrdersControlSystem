unit untPostgresDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TdmPostgres = class(TDataModule)
    fdPgConnection: TFDConnection;
    fdPgTransaction: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPostgres: TdmPostgres;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
