import 'package:flutter/material.dart';
import 'package:navigation/Utils/Navigation.dart';
import 'package:navigation/Utils/locator.dart';
import 'package:navigation/screens/covid/bloc/cov_bloc.dart';
import 'package:navigation/screens/covid/state/covidSate.dart';

class Page3 extends StatefulWidget {
  const Page3({Key key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final covBloc = CovidBloc();

  @override
  void initState() {
    covBloc.getCovidData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: StreamBuilder<CovidState>(
        stream: covBloc.covidState,
        builder: (context, snapshot) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    locator<NavigationUtil>().push(context, article,
                        arguments: {
                          'data': snapshot?.data?.data.country[index]
                        });
                  },
                  child: Card(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        _Data(snapshot, index),
                        _Details(snapshot, index),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    height: 2,
                  ),
              itemCount: snapshot?.data?.data?.country?.length ?? 0);
        },
      ),
    ));
  }

  Widget _Details(AsyncSnapshot<CovidState> snapshot, int index) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(': ' +
                  '${snapshot?.data?.data?.country[index]?.country ?? ''}'),
              Text(': ' +
                  '${snapshot?.data?.data?.country[index]?.newConfirmed ?? ''}'),
              Text(': ' +
                  '${snapshot?.data?.data?.country[index]?.totalConfirmed ?? ''}'),
              Text(': ' +
                  '${snapshot?.data?.data?.country[index]?.newDeaths ?? ''}'),
              Text(': ' +
                  '${snapshot?.data?.data?.country[index]?.totalDeaths ?? ''}'),
              Text(': ' +
                  '${snapshot?.data?.data?.country[index]?.newRecovered ?? ''}'),
              Text(': ' +
                  '${snapshot?.data?.data?.country[index]?.totalRecovered ?? ''}'),
              Text(
                  ': ' + '${snapshot?.data?.data?.country[index]?.date ?? ''}'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _Data(AsyncSnapshot<CovidState> snapshot, int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Country  '),
          Text('New Confirmer Case  '),
          Text('Total Conffirmed '),
          Text('New Death  '),
          Text('Total Death '),
          Text('New Recovered  '),
          Text('Total Recovered  '),
          Text('Date '),
        ],
      ),
    );
  }
}
