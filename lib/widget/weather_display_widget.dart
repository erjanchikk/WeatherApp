import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/weather_models.dart';

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({
    super.key,
    this.weather,
    required this.loaded,
  });
  final WeatherModel? weather;
  final bool loaded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.70,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 30,
            child: loaded
                ? Image.network(
                    'http://openweathermap.org/img/w/${weather!.weather![0].icon}.png',
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  )
                : CupertinoActivityIndicator(),
          ),
          Expanded(
            flex: 70,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Color(0x40FFFFFF),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white70,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('dd MMMM ').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    loaded
                        ? Column(
                            children: [
                              Text(
                                "${weather!.main!.temp!.round()}°",
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                weather!.weather![0].main.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.air_sharp, color: Colors.white),
                                  SizedBox(width: 12),
                                  Text(
                                    '${weather!.wind!.speed!.ceil()} km/h',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black.withOpacity(0.5),
                                          offset: Offset(2.0, 2.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.water_drop_outlined,
                                      color: Colors.white),
                                  const SizedBox(width: 12),
                                  Text(
                                    '${weather!.main!.humidity} %',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black.withOpacity(0.5),
                                          offset: const Offset(2.0, 2.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : const Expanded(child: CupertinoActivityIndicator()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// weatherMainShow(String value) {
//   switch (value) {
//     case "Snow":
//       return Icons.cloudy_snowing;
//     case "Cloudy":
//       return Icons.wb_cloudy_sharp;
//     case "Sunny":
//       return Icons.wb_sunny_rounded;
  
//   }
// }
