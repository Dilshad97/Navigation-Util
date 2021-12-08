// import 'package:flutter/material.dart';
//
// import 'package:navigation/Utils/Navigation.dart';
// import 'package:navigation/Utils/locator.dart';
//
// import 'package:navigation/screens/Articles/bloc/article_bloc.dart';
// import 'package:navigation/screens/Articles/state/article_state.dart';
//
// class News1 extends StatefulWidget {
//   const News1({Key key}) : super(key: key);
//
//   @override
//   _News1State createState() => _News1State();
// }
//
// class _News1State extends State<News1> {
//   final artbloc = ArticleBloc();
//
//   void initState() {
//     super.initState();
//     artbloc.getArticleData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text('News Api Nevigating Index to next Screen'),
//             ),
//             body: Column(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height / 1.2,
//                   child: StreamBuilder<ArticleState>(
//                     stream: artbloc.articleState,
//                     builder: (context, snapshot) {
//                       return Card(
//                         elevation: 5,
//                         color: Colors.transparent,
//                         child: ListView.separated(
//                           itemCount: snapshot?.data?.data?.length ?? 0,
//                           itemBuilder: (context, index) {
//                             return InkWell(
//                               onTap: () {
//                                 locator<NavigationUtil>()
//                                     .push(context, covidpage);
//                                 // locator<NavigationUtil>().push(
//                                 //     context, covidpage, arguments: {
//                                 //   'datalist': snapshot.data.data[index]
//                                 // });
//                               },
//                               child: Column(
//                                 children: [
//                                   Text(snapshot?.data?.data[index]?.name ??
//                                       'null')
//                                 ],
//                               ),
//                             );
//                           },
//                           separatorBuilder: (context, index) {
//                             return Divider(
//                               color: Colors.teal,
//                               thickness: 2,
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             )));
//   }
// }
