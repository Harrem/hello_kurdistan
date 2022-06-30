import 'dart:collection';

import 'package:flutter/material.dart';

class Countries {
  @required
  List<dynamic> list;
  List<Country> countrylist = [];

  Countries.fromJson(this.list) {
    getMap();
  }

  void getMap() {
    for (var map in list) {
      Country cont = Country(map['name']['common'], map['flags']['png']);
      // cont.name = map['name']['commmon'];
      cont.official = map['name']['official'];
      cont.independent = map['independent'];
      cont.population = map['population'];
      cont.capital = map['capital'].toString();
      cont.region = map['region'];
      cont.subregion = map['subregion'];
      cont.continent = map['continent'];
      // cont.languages = map['languages'];
      cont.time = map['time'];
      // cont.flag = map['flags']['png'];
      countrylist.add(cont);
      // for (var el in map['languages']) {

      // }

      // for (var currency in map['currencies']) {
      //   currency.forEach((key, value) {
      //     // if(key == "name")
      //     cont.currencies!.add(value['name']);
      //   });
      // }
      // countrylist.add(Country(map["name"]["common"], map["name"]['official'],
      //     map['capital'].toString(), map['flags']['png']));
      print(map['name']['common']);
      // print(countrylist[0]);
    }
  }
}

class Country {
  @required
  String name;
  String? official;
  bool? independent;
  int? population;
  String? capital;
  String? region;
  String? subregion;
  String? continent;
  List<String>? languages;
  String? time;
  List<String>? currencies;
  String flag;
// this.name, this.official, this.capital, this.flag
  Country(this.name, this.flag);
}
