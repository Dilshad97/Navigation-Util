
import 'package:navigation/Base_bloc/base%20bloc.dart';
import 'package:navigation/screens/Articles/model/model.dart';
import 'package:navigation/screens/Articles/repo/article.dart';
import 'package:navigation/screens/Articles/state/article_state.dart';
import 'package:rxdart/rxdart.dart';

class ArticleBloc extends BaseBloc {
  final articleState = PublishSubject<ArticleState>();
  final artRepo = ArticleRepo();
  final artItem = BehaviorSubject<Articles>();

  void getArticleData() {
    articleState.add(ArticleState.loading());
    subscription.add(artRepo
        .getCovidDetail()
        .map((data) => ArticleState.completed(data))
        .onErrorReturnWith((error) => ArticleState.error(error))
        .startWith(ArticleState.loading())
        .listen((state) {
      articleState.add(state);
      print('////// State: ${state.error}');
    }, onError: (error) {
      print('// $error');
      return;
    }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    articleState.close();
    artItem.close();
  }
}
