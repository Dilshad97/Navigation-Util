import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/screens/Articles/ui/page2.dart';
import 'package:navigation/screens/covid/ui/page3.dart';

class NavigationUtil {
  Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> arg = settings.arguments;
    switch (settings.name) {
      case article:
        return CupertinoPageRoute(
            builder: (context) => News2(global:arg['data'],),);
      case covidpage:
        return CupertinoPageRoute(builder: (context) => Page3(),);
      default:
        return _errorRoute("Coming soon");
    }
  }

  Future<dynamic> push(BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(child: Text(message)));
    });
  }
}

const String article = "article";
const String covidpage = "covidpage";
