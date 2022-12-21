import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

// create class
class CountryClass{
  final String name;
  final String flag;

  CountryClass({required this.name,required this.flag});
  
  //  factory constructor that creates an CountryClass from JSON.
  factory CountryClass.fromJson(Map<String, dynamic> json) {
    return CountryClass(
      name: json['name'],
      flag: json['flag'],
    );
  }

}

// request data
// https://countriesnow.space/api/v0.1/countries/flag/images
Future<List<CountryClass>> getAllCountries() async {
  var response = await http.get(Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images'));
  var jsonData = jsonDecode(response.body);
  var jsonArray = jsonData['data'];

// new list
List<CountryClass> countryList=[];
for(var jsonCountry in jsonArray){

// add to list
  CountryClass country = CountryClass(name: jsonCountry['name'], flag: jsonCountry['flag']);
  countryList.add(country);
}

// return list
return countryList;

}




