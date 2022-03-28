unit untAddTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.ImageList, FMX.ImgList;

type
  TfrmTemplate = class(TForm)
    pnlButtonsContainer: TPanel;
    btnGravar: TButton;
    pnlFormContainer: TPanel;
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fid: Integer;
    procedure insert; virtual;
    procedure update; virtual;
  public
    property id: Integer read Fid write Fid;
  end;

var
  frmTemplate: TfrmTemplate;

implementation

{$R *.fmx}

procedure TfrmTemplate.btnGravarClick(Sender: TObject);
begin
  if(id = 0)then insert else update;
end;

procedure TfrmTemplate.FormCreate(Sender: TObject);
begin
  id := 0;
end;

procedure TfrmTemplate.insert;
begin
  // must be implemented on the child forms
end;

procedure TfrmTemplate.update;
begin
  // must be implemented on the child forms
end;

end.
