unit untAddressHelpers;

interface
uses FMX.ListBox, System.Generics.Collections, untGetStateListFactory,
     untStateModel, untGetStateListController, untCityModel,
     untGetCityListByStateFactory, untGetCityListFromStateController;

type
  TAddressHelpers = class
  public
    class procedure FeedComboBoxWithStateList(comboBox: TComboBox); static;
    class procedure FeedComboBoxWithCityListById(comboBox: TComboBox; stateID: Integer); static;
  private
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

class procedure TAddressHelpers.FeedComboBoxWithCityListById(comboBox: TComboBox; stateID: Integer);
var
  getCityListFromStateController: TGetCityListFromStateController;
  cities: TList<TCityModel>;
  city: TCityModel;
begin
  getCityListFromStateController := TGetCityListByState.make;
  try
    cities := getCityListFromStateController.list(stateID);
    comboBox.Items.Clear;
    for city in cities do
      comboBox.Items.AddObject(city.city, TObject(city.id));
  finally
    getCityListFromStateController.Free;
  end;
end;


end.
