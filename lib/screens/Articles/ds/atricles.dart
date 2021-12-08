import 'package:dio/dio.dart';

import 'package:navigation/Rset_Const/const.dart';
import 'package:navigation/Rset_Const/rest_clients.dart';
import 'package:navigation/screens/Articles/res/res_articles.dart';
import 'package:rxdart/rxdart.dart';

class ArticlesDs{
  Observable<ResArticles> getArticles(){
    return Observable.fromFuture(RestClient().dio().get(RestConsts.ARTICLE,
      options:Options(extra: {
        'header':true,
      })

    )).map((event) => ResArticles.fromJson(event.data));

  }

}
