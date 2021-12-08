

import 'package:navigation/screens/Articles/model/model.dart';

class ResArticles {
  List<Articles> articles = [];

  ResArticles.fromJson(Map<String, dynamic> map) {
    for (var art in map['articles']) {
      articles.add(Articles.fromJson(art));
    }
  }
}
