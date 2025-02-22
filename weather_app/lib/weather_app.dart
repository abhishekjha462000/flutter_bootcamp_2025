import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/additional_item_info.dart';
import 'package:weatherapp/hourly_forecast_item.dart';
import 'package:weatherapp/secrets.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});
  @override
  State<WeatherApp> createState() => WeatherAppState();
}

class WeatherAppState extends State<WeatherApp> {
  // WeatherAppState({super.key});
  bool isLoading = true;
  late Future<Map<String, dynamic>> data;

  @override
  void initState() {
    super.initState();
    // Initialize data or perform startup tasks here
    data = fetchWeatherData();
  }

  Future<Map<String, dynamic>> fetchWeatherData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=Gwalior,India&APPID=$API_KEY');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw 'status code is not 200';
      }
    } catch (e) {
      throw 'An Unexpected error occured';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print('refresh');
              }
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (kDebugMode) {
              // print(snapshot.data);
            }

            final currentList = snapshot.data!['list'];
            final Map<String, dynamic> currentWeather =
                snapshot.data!['list'][0];

            final double currentTemp = currentWeather['main']['temp'];
            final String currentSky = currentWeather['weather'][0]['main'];
            final int currentPressure = currentWeather['main']['pressure'];
            final int currentHumidity = currentWeather['main']['humidity'];
            final double currentWindSpeed = currentWeather['wind']['speed'];

            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Card(
                        elevation: 30,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              '$currentTemp K',
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 32),
                            const SizedBox(height: 10),
                            Text(currentSky,
                                style: const TextStyle(fontSize: 25)),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Weather Forecast cards
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Weather Forecast',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       for (int i = 0; i < 5; i++)
                  //       // Do not put {} here
                  //         HourlyForecastItem(
                  //             time: currentList[i + 1]['dt_txt']
                  //                 .split(' ')[1]
                  //                 .substring(0, 5),
                  //             icon: currentList[i + 1]['weather'][0]['main'] ==
                  //                         'Clouds' ||
                  //                     currentList[i + 1]['weather'][0]
                  //                             ['main'] ==
                  //                         'Rain'
                  //                 ? Icons.cloud
                  //                 : Icons.sunny,
                  //             temperature:
                  //                 currentList[i + 1]['main']['temp'].toString())
                  //     ],
                  //   ),
                  // ),

                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                        // ListView takes the entire height of the screen.
                        // due to this reason, we need to wrap it inside the SizedBox container
                        // and give the container a fixed height.
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final time = currentList[index + 1]['dt_txt']
                              .split(' ')[1]
                              .substring(0, 5);

                          final icon = currentList[index + 1]['weather'][0]
                                          ['main'] ==
                                      'Clouds' ||
                                  currentList[index + 1]['weather'][0]
                                          ['main'] ==
                                      'Rain'
                              ? Icons.cloud
                              : Icons.sunny;

                          final temperature =
                              currentList[index + 1]['main']['temp'].toString();

                          return HourlyForecastItem(
                              time: time, icon: icon, temperature: temperature);
                        }),
                  ),

                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Additional Information',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AdditionalInfoItem(
                          icon: const Icon(Icons.water_drop),
                          text: 'Humidity',
                          value: currentHumidity as double),
                      AdditionalInfoItem(
                          icon: const Icon(Icons.air),
                          text: 'Wind',
                          value: currentWindSpeed),
                      AdditionalInfoItem(
                          icon: const Icon(Icons.beach_access),
                          text: 'Pressure',
                          value: currentPressure as double),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
