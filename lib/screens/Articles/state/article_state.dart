
import 'package:navigation/Base_UI_State/base_ui_state.dart';
import 'package:navigation/screens/Articles/model/model.dart';


class ArticleState extends BaseUiState<List<Articles>> {
  ArticleState.loading() : super.loading();

  ArticleState.completed(List<Articles> data) : super.completed(data: data);

  ArticleState.error(dynamic error) : super.error(error);
}
