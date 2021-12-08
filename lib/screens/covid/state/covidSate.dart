
import 'package:navigation/Base_UI_State/base_ui_state.dart';
import 'package:navigation/screens/covid/model/covid_model.dart';


class CovidState extends BaseUiState<Global> {
  CovidState.loading() : super.loading();
  CovidState.completed(Global data) : super.completed(data: data);
  CovidState.error(dynamic error) : super.error(error);
}
