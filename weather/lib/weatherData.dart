import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Json Data list

// {
//     "location": {
//         "country": "United States of America",
//         "localtime": "2019-09-07 08:14",
//     },
//     "current": {
//         "temperature": 13,
//         "weather_descriptions": [
//             "Sunny"
//         ],
//         "wind_speed": 0,
//     }
// }

class WeatherClass {
  final String country;
  final String localtime;
  final int temperature;
  final String description;
  final int wind_speed;

  WeatherClass({
    required this.country,
    required this.localtime,
    required this.temperature,
    required this.description,
    required this.wind_speed,
  });

  factory WeatherClass.fromJson(Map<String, dynamic> json) {
    final country = json["location"]["country"];
    final localtime = json["location"]["localtime"];
    final temperature = json["current"]["temperature"];
    final description = json["current"]["weather_descriptions"][0];
    final wind_speed = json["current"]["wind_speed"];

    return WeatherClass(
        country: country,
        localtime: localtime,
        temperature: temperature,
        description: description,
        wind_speed: wind_speed);
  }
}

class WeatherService {
  Future<WeatherClass> getWeather(String country) async {
    // http://api.weatherstack.com/current?access_key=083b75149012f874c9701d594d8ed854&query=New%20Yorkt

    final parameters = {
      'access_key': 'eb905d3cd226c817c79c570256df4a0f',
      'query': country
    };

    final uri = Uri.http('api.weatherstack.com', '/current', parameters);

    final response = await http.get(uri);

    print(response.body);
    // decode json
    final json = jsonDecode(response.body);
    // insert data to WeatherClass
    return WeatherClass.fromJson(json);
  }
}