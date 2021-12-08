
import 'package:navigation/Base_Mapper/base_mapper.dart';
import 'package:navigation/screens/covid/model/covid_model.dart';
import 'package:navigation/screens/covid/res/cov_res.dart';

class CovidMapper extends BaseMapper<CovidRes, Global> {
  @override
  Global map(CovidRes t) {
    return Global(
        newConfirmed: t.newConfirmed,
        totalConfirmed: t.totalConfirmed,
        newDeaths: t.newDeaths,
        totalDeaths: t.totalDeaths,
        newRecovered: t.newRecovered,
        totalRecovered: t.totalRecovered,
        date: t.date,
        articles: t.articles,
        country: t.country);
  }
}
