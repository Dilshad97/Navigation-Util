

import 'package:navigation/screens/covid/ds/covid_ds.dart';
import 'package:navigation/screens/covid/mapper/covid_mapper.dart';
import 'package:navigation/screens/covid/model/covid_model.dart';
import 'package:rxdart/rxdart.dart';

class CovidRepo {
  final artDs = CovidDs();
  final artMapper = CovidMapper();

  Observable<Global> getCovidDetail() {
    return artDs
        .getCovid()
        .map((gridResponce) => artMapper.map(gridResponce));
  }
}
