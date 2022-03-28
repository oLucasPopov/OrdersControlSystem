unit untAddUser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  untAddTemplate, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox;

type
  TfrmAddUser = class(TfrmTemplate)
    edtUserName: TEdit;
    edtPassword: TEdit;
    edtRepeatPassword: TEdit;
    lblUserName: TLabel;
    lblPassword: TLabel;
    lblRepeatPassword: TLabel;
    cmbEmployee: TComboBox;
    lblFuncionario: TLabel;
    lblUserGroup: TLabel;
    cmbUserGroup: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddUser: TfrmAddUser;

implementation

{$R *.fmx}

end.
