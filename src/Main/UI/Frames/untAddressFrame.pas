unit untAddressFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.ListBox, FMX.ComboEdit, FMX.Controls.Presentation, System.Generics.Collections,
  Data.DB, Datasnap.DBClient, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope;

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
    procedure cmbStateEnter(Sender: TObject);
  private
    FCEP: String;
    FStreetName: String;
    FStreetNumber: String;
    FNeighbourhood: String;
    FStateID: Integer;
    FCityID: Integer;
    FReference: String;
    procedure LoadCitiesFromState(StateID: Integer);
  public
    function AddressIsFilled: Boolean;
    property CEP: String read FCEP write FCEP;
    property StreetName: String read FStreetName write FStreetName;
    property StreetNumber: String read FStreetNumber write FStreetNumber;
    property Neighbourhood: String read FNeighbourhood write FNeighbourhood;
    property StateID: Integer read FStateID write FStateID;
    property CityID: Integer read FCityID write FCityID;
    property Reference: String read FReference write FReference;
  end;

implementation

uses untAddressHelpers;

{$R *.fmx}

procedure TAddressFrame.cmbStateChange(Sender: TObject);
begin
  if(cmbState.ItemIndex <> -1)then
    StateID := Integer(cmbState.Items.Objects[cmbState.ItemIndex])
  else
    StateID := 0;

  LoadCitiesFromState(StateID);
end;

procedure TAddressFrame.LoadCitiesFromState(StateID: Integer);
begin
  if(StateID = 0)then
    cmbCity.Items.Clear
  else
  begin
    cmbCity.Enabled := False;
    try
      TAddressHelpers.FeedComboBoxWithCityListById(cmbCity, StateID);
    finally
      cmbCity.Enabled := True;
    end;
  end;
end;

procedure TAddressFrame.cmbStateEnter(Sender: TObject);
begin
  if(cmbState.Items.Count = 0)then
    TAddressHelpers.FeedComboBoxWithStateList(cmbState);
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

function TAddressFrame.AddressIsFilled: Boolean;
begin
  Result := edtCEP.Text.IsEmpty
        and edtStreetName.Text.IsEmpty
        and edtStreetNumber.Text.IsEmpty
        and edtNeighbourhood.Text.IsEmpty
        and (cmbState.ItemIndex <> -1)
        and (cmbCity.ItemIndex <> -1)
        and edtReference.Text.IsEmpty;
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


end.
