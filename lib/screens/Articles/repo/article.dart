

import 'package:navigation/screens/Articles/ds/atricles.dart';
import 'package:navigation/screens/Articles/mapper/article_mappper.dart';
import 'package:navigation/screens/Articles/model/model.dart';
import 'package:rxdart/rxdart.dart';

class ArticleRepo {
  final artDs = ArticlesDs();
  final artMapper = ArticlesMapper();

  Observable<List<Articles>> getCovidDetail() {
    return artDs
        .getArticles()
        .map((gridResponce) => artMapper.map(gridResponce));
  }
}
