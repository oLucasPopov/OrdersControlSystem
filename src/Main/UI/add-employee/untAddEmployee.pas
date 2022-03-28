unit untAddEmployee;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  untAddTemplate, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox,
  FMX.ComboEdit;

type
  TfrmAddEmployee = class(TfrmTemplate)
    Edit1: TEdit;
    lblEmployeeName: TLabel;
    gbContatos: TGroupBox;
    lblCelular: TLabel;
    edtCellphone: TEdit;
    edtTelephone: TEdit;
    lblTelefone: TLabel;
    edtEmail: TEdit;
    lblEmail: TLabel;
    gbEndereco: TGroupBox;
    lblRua: TLabel;
    edtStreetName: TEdit;
    edtStreetNumber: TEdit;
    lblNumero: TLabel;
    edtNeighbourhood: TComboEdit;
    lblBairro: TLabel;
    lblCidade: TLabel;
    edtReference: TEdit;
    lblEstado: TLabel;
    lblReferencia: TLabel;
    cmbState: TComboBox;
    cmbCity: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEmployee: TfrmAddEmployee;

implementation

{$R *.fmx}

end.
