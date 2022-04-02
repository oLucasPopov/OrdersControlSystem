unit untAddCustomer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  untAddTemplate, FMX.Controls.Presentation, FMX.Edit, FMX.ComboEdit,
  FMX.ListBox, FMX.Styles.Objects, FMX.Objects, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, untAddCustomerController, untAddCustomerFactory,
  untAddCustomerUC, untAddressFrame, untGetStateListController,
  System.Generics.Collections, untAddressHelpers;

type
  TfrmAddCustomer = class(TfrmTemplate)
    edtCompanyName: TEdit;
    edtTelephone: TEdit;
    lblTelefone: TLabel;
    lblCelular: TLabel;
    edtCellphone: TEdit;
    gbContatos: TGroupBox;
    edtEmail: TEdit;
    lblEmail: TLabel;
    lblCompanyName: TLabel;
    lblTradingName: TLabel;
    edtTradingName: TEdit;
    edtCPF_CNPJ: TEdit;
    lblCPF_CNPJ: TLabel;
    gbObs: TGroupBox;
    edtObs: TMemo;
    AddressFrame: TAddressFrame;
    procedure FormCreate(Sender: TObject);
  private
    procedure insert; overload;
    procedure update; overload;
    function FillCustomerModel: TAddCustomerModel;
  public
  end;

var
  frmAddCustomer: TfrmAddCustomer;

implementation

uses untStateModel, untGetStateListFactory;

{$R *.fmx}

function TfrmAddCustomer.FillCustomerModel: TAddCustomerModel;
begin
  Result             := TAddCustomerModel.Create;
  Result.companyName := edtCompanyName.Text;
  Result.tradingName := edtTradingName.Text;
  Result.cpf_cnpj    := edtCPF_CNPJ.Text;

  Result.phone       := edtTelephone.Text;
  Result.cellphone   := edtCellphone.Text;
  Result.email       := edtEmail.Text;

  Result.cep           := AddressFrame.CEP;
  Result.streetName    := AddressFrame.StreetName;
  Result.neighbourhood := AddressFrame.Neighbourhood;
  Result.state         := AddressFrame.StateID;
  Result.city          := AddressFrame.CityID;
  Result.Reference     := AddressFrame.Reference;

  Result.obs         := edtObs.Text;
end;

procedure TfrmAddCustomer.FormCreate(Sender: TObject);
begin
  inherited;
  TAddressHelpers.FeedComboBoxWithStateList(AddressFrame.cmbState);
end;

procedure TfrmAddCustomer.insert;
var
  customerModel: TAddCustomerModel;
  addCustomer: TAddCustomerController;
begin
  customerModel := FillCustomerModel;
  addCustomer   := TAddCustomerFactory.make;
  try
    addCustomer.handle(customerModel);
  finally
    customerModel.Free;
    addCustomer.Free;
  end;
end;

procedure TfrmAddCustomer.update;
begin

end;

end.
