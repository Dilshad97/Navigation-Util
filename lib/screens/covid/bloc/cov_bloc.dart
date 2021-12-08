import 'package:navigation/Base_bloc/base%20bloc.dart';
import 'package:navigation/screens/covid/model/covid_model.dart';
import 'package:navigation/screens/covid/repo/covid_repo.dart';
import 'package:navigation/screens/covid/state/covidSate.dart';

import 'package:rxdart/rxdart.dart';

class CovidBloc extends BaseBloc {
  final covidState = PublishSubject<CovidState>();
  final covRepo = CovidRepo();
  final covItem = BehaviorSubject<Global>();

  void getCovidData() {
    covidState.add(CovidState.loading());
    subscription.add(covRepo
        .getCovidDetail()
        .map((data) => CovidState.completed(data))
        .onErrorReturnWith((error) => CovidState.error(error))
        .startWith(CovidState.loading())
        .listen((state) {
      covidState.add(state);
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
    covidState.close();
    covItem.close();
  }
}
