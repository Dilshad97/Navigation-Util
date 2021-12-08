import 'package:flutter/material.dart';
import 'package:navigation/screens/Articles/bloc/article_bloc.dart';

import 'package:navigation/screens/Articles/state/article_state.dart';
import 'package:navigation/screens/covid/model/covid_model.dart';

class News2 extends StatefulWidget {
  final Country global;

  News2({this.global});

  @override
  _News2State createState() => _News2State();
}

class _News2State extends State<News2> {
  final artbloc = ArticleBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    artbloc.getArticleData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Api Call'),
            ),
            backgroundColor: Colors.blueGrey,
            body: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<ArticleState>(
                      stream: artbloc?.articleState ?? 0,
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemCount: 1 ?? '',
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      // Text(widget.global?.articles[index]
                                      //         ?.description ??
                                      //     'disposelshad'),
                                      Card(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                                '${widget?.global?.country ?? ''}'),
                                            Text(
                                                '${widget?.global?.newDeaths ?? ''}'),
                                            Text(
                                                '${widget?.global?.date ?? ''}'),
                                          ],
                                        ),
                                      ),
                                      Text(snapshot?.data?.data[index]
                                              ?.description ??
                                          '')
                                    ],
                                  ),
                                ),
                                separatorBuilder: (context, index) => Divider(
                                  height: 2,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )),
            )));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    artbloc.dispose();
  }
}
