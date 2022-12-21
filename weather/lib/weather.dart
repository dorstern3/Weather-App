import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather/weatherData.dart';

class weather extends StatefulWidget {
  const weather({super.key});

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {

 // data weather Variable
  WeatherClass? response;

// active function
 void initState() {
    // TODO: implement initState
    super.initState();
    search();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather List'),
         centerTitle: true,
      ),
      body: FractionallySizedBox(
        widthFactor: 1.0, //width
        heightFactor: 0.6, // height
      
      child: Container(
        color: Colors.lightBlue,
        child: Column(
          children: [
            // if have data
            if (response != null)
              Column(
                children: [
                  // country
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Text(
                      'Country: ${response!.country}',
                      style: TextStyle(fontSize: 40),
                      
                    ),
                    // temperature
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Text(
                      'Temperature: ${response!.temperature}°C',
                      style: TextStyle(fontSize: 35),
                    ),
                    // description
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Text(
                      'Description: ${response!.description}',
                      style: TextStyle(fontSize: 30),
                    ),
                    // localtime
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Text(
                      'Localtime: ${response!.localtime}',
                      style: TextStyle(fontSize: 25),
                    ),
                    // wind_speed
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Text(
                      'Wind Speed: ${response!.wind_speed} km/h',
                      style: TextStyle(fontSize: 20),
                    ),
                ],
              ),
              // if no have data
            if (response == null)
            Text('error = data is null'),
          ],
           
        ),
      ),
      ),
    );
  }

  // search Weather
  void search() async {
   // all data variable
    final weather = await WeatherService().getWeather('New York');
    setState(() => response = weather);
  }
}


