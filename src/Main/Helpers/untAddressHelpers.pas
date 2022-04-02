unit untAddressHelpers;

interface
uses FMX.ListBox, System.Generics.Collections, untGetStateListFactory,
     untStateModel, untGetStateListController;

type
  TAddressHelpers = class
    class procedure FeedComboBoxWithStateList(comboBox: TComboBox);
  end;

implementation

{ TAddressHelpers }

class procedure TAddressHelpers.FeedComboBoxWithStateList(comboBox: TComboBox);
var
  getStateListController: TGetStateListController;
  states: TList<TStateModel>;
  state: TStateModel;
begin
  getStateListController := TGetStateListFactory.make;
  try
    states := getStateListController.list;
    for state in states do
      comboBox.Items.AddObject(state.state, TObject(state.id));
  finally
    getStateListController.Free;
  end;
end;

end.
