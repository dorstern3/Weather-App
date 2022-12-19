import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/weather.dart';
import 'countryData.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}


class _homeState extends State<home> {
  List<CountryClass> countryList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Country List')),
      ),
      // Search Country
      body: Column(
        children: <Widget>[ Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: TextField(
            decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'search'
          ),
          onChanged:searchCountry,
          ),
        ),

      // List Country
      Expanded(
     child: FutureBuilder<List<CountryClass>>(
        future: getAllCountries(),
        builder: (context, snapshot) {
// if data is null
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          }
          // if data have data
          else {
            List<CountryClass> countryList = snapshot.data!;

//ListView
            return ListView.builder(
                itemCount: countryList.length,
                itemBuilder: (context, index) {
                  CountryClass country = countryList[index];
//Card
                  return Card(
                     // on tap navigate to weather data
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => weather()));
                      },
//Row
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 25),
                            child: Text(
                              country.name,
                              style: TextStyle(fontSize: 20),
                            ),   
                          ),
      
                        // SvgPicture.network(
                        // country.flag, width:100 , height: 60,
                        // placeholderBuilder: (context) => Icon(Icons.error),
                        // ),
                      // // Speace between row
                      //     const SizedBox(width: 20,)
                                     
                        ],   
                      ),
                      
                    ),
                  );
                });
          }
        },
      ),
      ),
        ],
      ),
    );
  }

// Search function
void searchCountry(String query){
 final suggestions = countryList.where((country){
  final countryName = country.name.toLowerCase();
  final input = query.toLowerCase();

return country.name.contains(input);
 }).toList();

 setState(() => countryList =  suggestions);
}
}