import 'package:get_it/get_it.dart';
import 'package:navigation/Utils/Navigation.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<NavigationUtil>(NavigationUtil());
}
