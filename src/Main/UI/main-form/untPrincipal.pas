unit untPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.Menus, untAddCustomer,
  untAddUser, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmPrincipal = class(TForm)
    pnlShortcuts: TPanel;
    flShortcuts: TFlowLayout;
    pnlContent: TPanel;
    menu: TMainMenu;
    miCadastros: TMenuItem;
    miUsuarios: TMenuItem;
    miMassas: TMenuItem;
    miCoberturas: TMenuItem;
    miRecheios: TMenuItem;
    miClientes: TMenuItem;
    miFuncionario: TMenuItem;
    MenuItem5: TMenuItem;
    miFornecedores: TMenuItem;
    procedure miClientesClick(Sender: TObject);
    procedure miUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untPgHelper;

{$R *.fmx}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TPgHelper.Connect;
end;

procedure TfrmPrincipal.miClientesClick(Sender: TObject);
var
  addCustomer: TfrmAddCustomer;
begin
  addCustomer := TfrmAddCustomer.Create(Self);
  try
    addCustomer.ShowModal;
  finally
    addCustomer.Free;
  end;
end;

procedure TfrmPrincipal.miUsuariosClick(Sender: TObject);
var
  addUser: TfrmAddUser;
begin
  addUser := TfrmAddUser.Create(Self);
  try
    addUser.ShowModal;
  finally
    addUser.Free;
  end;
end;

end.
