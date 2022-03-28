unit untAddressFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.ListBox, FMX.ComboEdit, FMX.Controls.Presentation;

type
  TAddressFrame = class(TFrame)
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
    edtCEP: TEdit;
    btnClearCEP: TClearEditButton;
    lblCEP: TLabel;
    procedure edtCEPTyping(Sender: TObject);
    procedure edtStreetNameTyping(Sender: TObject);
    procedure edtStreetNumberTyping(Sender: TObject);
    procedure edtNeighbourhoodChange(Sender: TObject);
    procedure cmbStateChange(Sender: TObject);
    procedure cmbCityChange(Sender: TObject);
    procedure edtReferenceTyping(Sender: TObject);
  private
    FCEP: String;
    FStreetName: String;
    FStreetNumber: String;
    FNeighbourhood: String;
    FStateID: Integer;
    FCityID: Integer;
    FReference: String;
    procedure LoadCitiesList;
  public
    property CEP: String read FCEP write FCEP;
    property StreetName: String read FStreetName write FStreetName;
    property StreetNumber: String read FStreetNumber write FStreetNumber;
    property Neighbourhood: String read FNeighbourhood write FNeighbourhood;
    property StateID: Integer read FStateID write FStateID;
    property CityID: Integer read FCityID write FCityID;
    property Reference: String read FReference write FReference;
  end;

implementation

{$R *.fmx}

procedure TAddressFrame.cmbStateChange(Sender: TObject);
begin
  if(cmbState.ItemIndex <> -1)then
    StateID := Integer(cmbState.Items.Objects[cmbState.ItemIndex])
  else
    StateID := 0;

  LoadCitiesList;
end;

procedure TAddressFrame.cmbCityChange(Sender: TObject);
begin
  if(cmbCity.ItemIndex <> -1)then
    CityID := Integer(cmbCity.Items.Objects[cmbCity.ItemIndex])
  else
    CityID := 0;
end;

procedure TAddressFrame.edtCEPTyping(Sender: TObject);
begin
  if(edtCEP.Text.Length = 2)then
  begin
    edtCEP.Text := edtCEP.Text + '.';
    edtCEP.CaretPosition := 3;
  end;

  if(edtCEP.Text.Length = 6)then
  begin
    edtCEP.Text := edtCEP.Text + '-';
    edtCEP.CaretPosition := 7;
  end;

  CEP := edtCEP.Text;
end;

procedure TAddressFrame.edtNeighbourhoodChange(Sender: TObject);
begin
  Neighbourhood := edtNeighbourhood.Text;
end;

procedure TAddressFrame.edtReferenceTyping(Sender: TObject);
begin
  Reference := edtReference.Text;
end;

procedure TAddressFrame.edtStreetNameTyping(Sender: TObject);
begin
  StreetName := edtStreetName.Text;
end;

procedure TAddressFrame.edtStreetNumberTyping(Sender: TObject);
begin
  StreetNumber := edtStreetNumber.Text;
end;

procedure TAddressFrame.LoadCitiesList;
begin
  //load cities

//  if(CityID <> 0)then
//    select city
end;

end.
