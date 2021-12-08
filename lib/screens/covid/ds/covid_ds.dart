
import 'package:dio/dio.dart';
import 'package:navigation/Rset_Const/const.dart';
import 'package:navigation/Rset_Const/rest_clients.dart';
import 'package:navigation/screens/covid/res/cov_res.dart';

import 'package:rxdart/rxdart.dart';

class CovidDs{
  Observable<CovidRes> getCovid(){
    return Observable.fromFuture(RestClient().dio().get(RestConsts.COVID,
        options:Options(extra: {
          'header':true,
        })

    )).map((event) => CovidRes.fromJson(event.data));

  }

}
