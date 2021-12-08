
import 'package:navigation/Base_Mapper/base_mapper.dart';
import 'package:navigation/screens/Articles/model/model.dart';
import 'package:navigation/screens/Articles/res/res_articles.dart';


class ArticlesMapper extends BaseMapper<ResArticles, List<Articles>> {
  @override
  List<Articles> map(ResArticles t) {
    return t.articles.map((e) =>
        Articles(
            e.id,
            e.name,
            e.author,
            e.title,
            e.description,
            e.url
        )).toList();
  }
}
