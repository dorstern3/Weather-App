import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/screens/weather.dart';
import '../data api/countryData.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  // full list country
  List<CountryClass> countryList = [];
  // filter list
  List<CountryClass> searchResult = [];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Country List')),
      ),
      // Search Country
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: TextField(
              // if a character was typed
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'search country'),
              onChanged: searchCountry,
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
                  countryList = snapshot.data!;

//ListView
                  return ListView.builder(
                      itemCount: controller.text.isEmpty
                          ? countryList.length
                          : searchResult.length,
                      itemBuilder: (context, index) {
                        CountryClass country = controller.text.isEmpty
                            ? countryList[index]
                            : searchResult[index];
//Card
                        return Card(
                          // on tap navigate to weather data
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => weather(
                                            result: country.name,
                                          )));
                            },
//Row
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 25),
                                  child: Text(
                                    // name of country
                                    country.name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),

                                // SvgPicture Doesn't work in emulator, only on an Android device
                                SvgPicture.network(
                                country.flag, width:100 , height: 60,
                                placeholderBuilder: (context) => Icon(Icons.error),
                                ),
                                // Speace between row
                                    const SizedBox(width: 20,)
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
  void searchCountry(String text) async {
    // clean list
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {
        // full list country
        searchResult = countryList;
      });
      return;
    }

    for (var country in countryList) {
      if (country.name.toLowerCase().contains(text)) {
        searchResult.add(country);
      }
    }
// refresh list/screen
    setState(() {});
  }
}
