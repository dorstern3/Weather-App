import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather/data%20api/weatherData.dart';

class weather extends StatefulWidget {
  // result for search function
  final String? result;
  const weather({Key? key, required this.result}) : super(key: key);

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
    search(widget.result);
    // function to check if api weather work
    //search();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Country: ',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${response!.country}',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),

                    // temperature
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Temperature: ',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${response!.temperature}°C',
                          style: TextStyle(fontSize: 35),
                        ),
                      ],
                    ),

                    // description
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Description: ',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${response!.description}',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),

                    // localtime
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Localtime: ',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${response!.localtime}',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),

                    // wind_speed
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Wind Speed: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${response!.wind_speed} km/h',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              // if data is null
              if (response == null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // search Weather
  void search(value) async {
    final WeatherClass weather = await WeatherService().getWeather('$value');
    setState(() => response = weather);
  }

// check if api weather work
//  void search() async  {
//     final weather = await WeatherService().getWeather('New York');
//     setState(() => response = weather);
//     }

}
