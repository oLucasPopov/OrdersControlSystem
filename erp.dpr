program erp;

uses
  System.StartUpCopy,
  FMX.Forms,
  untPrincipal in 'src\Main\UI\main-form\untPrincipal.pas' {frmPrincipal},
  untAddTemplate in 'src\Main\UI\add-template\untAddTemplate.pas' {frmTemplate},
  untAddUser in 'src\Main\UI\add-user\untAddUser.pas' {frmAddUser},
  untAddEmployee in 'src\Main\UI\add-employee\untAddEmployee.pas' {frmAddEmployee},
  untAddCustomerController in 'src\Presentation\Controllers\untAddCustomerController.pas',
  untAddCustomerUC in 'src\Domain\UseCases\untAddCustomerUC.pas',
  untCustomerModel in 'src\Domain\Models\untCustomerModel.pas',
  untDbAddCustomer in 'src\Data\UseCases\untDbAddCustomer.pas',
  untAddCustomerRepository in 'src\Data\Protocols\db\Customer\untAddCustomerRepository.pas',
  untCustomerPostgresRepository in 'src\Infra\db\postgres\customer\untCustomerPostgresRepository.pas',
  untPostgresDataModule in 'src\Infra\db\postgres\untPostgresDataModule.pas' {dmPostgres: TDataModule},
  untPgHelper in 'src\Infra\db\postgres\helpers\untPgHelper.pas',
  untAddCustomerFactory in 'src\Main\Factories\add-customer\untAddCustomerFactory.pas',
  untAddCustomer in 'src\Main\UI\add-customer\untAddCustomer.pas' {frmAddCustomer},
  untAddressFrame in 'src\Main\UI\Frames\untAddressFrame.pas' {AddressFrame: TFrame},
  untGetStateListController in 'src\Presentation\Controllers\untGetStateListController.pas',
  untStateModel in 'src\Domain\Models\untStateModel.pas',
  untGetStateListUC in 'src\Domain\UseCases\untGetStateListUC.pas',
  untDbGetStateList in 'src\Data\UseCases\untDbGetStateList.pas',
  untGetStateListRepository in 'src\Data\Protocols\db\State\untGetStateListRepository.pas',
  untStatePostgresRepository in 'src\Infra\db\postgres\state\untStatePostgresRepository.pas',
  untGetStateListFactory in 'src\Main\Factories\get-state-list\untGetStateListFactory.pas',
  untAddressHelpers in 'src\Main\Helpers\untAddressHelpers.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmPostgres, dmPostgres);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
