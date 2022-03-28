unit untGetStateListController;

interface
uses System.Generics.Collections, untStateModel, untGetStateListUC;

type
TGetStateListController = class
  private
    getStateList: GetStateList;
  public
    constructor Create(getStateList: GetStateList);
    function handle: TList<TStateModel>;
end;

implementation

{ TGetStateList }

constructor TGetStateListController.Create(getStateList: GetStateList);
begin
  Self.getStateList := getStateList;
end;

function TGetStateListController.handle: TList<TStateModel>;
begin
  Result := Self.getStateList.get;
end;

end.
