import 'package:flutter/material.dart';

import 'package:navigation/screens/covid/ui/page3.dart';

import 'Utils/Navigation.dart';
import 'Utils/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: NavigationUtil().generateRoute,
      home: Page3(),
    );
  }
}
