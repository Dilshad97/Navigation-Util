
import 'package:navigation/screens/Articles/model/model.dart';
import 'package:navigation/screens/covid/model/covid_model.dart';

class CovidRes {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;
  List<Country> country = [];
  List<Articles> articles = [];

  CovidRes.fromJson(Map<String, dynamic> map) {
    this.newConfirmed = map['Global']['NewConfirmed'];
    this.totalConfirmed = map['Global']['TotalConfirmed'];
    this.newDeaths = map['Global']['NewDeaths'];
    this.totalDeaths = map['Global']['TotalDeaths'];
    this.newRecovered = map['NewRecovered'];
    this.totalRecovered = map['Global']['TotalRecovered'];
    this.date = map['Global']['Date'];
    if(map['Countries']!=null){
    for (var cou in map['Countries']) {
      country.add(Country.fromJson(cou));
    }}
    if(map['articles']!=null){
    for (var art in map['articles']) {
      articles.add(Articles.fromJson(art));
    }
  }}
}
