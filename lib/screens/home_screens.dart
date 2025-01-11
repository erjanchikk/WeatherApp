import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/screens/search_screens.dart';
import 'package:weatherapp/widget/weather_display_widget.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  late final WeatherBloc weatherBloc;
  String city = "Bishkek";

  @override
  void initState() {
    weatherBloc = WeatherBloc();
    weatherBloc.add(GetWeatherEvent(city: city));
    super.initState();
  }

  @override
  void dispose() {
    weatherBloc.close;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF47BFDF),
                Color(0xFF4A91FF),
              ],
            ),
          ),
          child: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () {
              weatherBloc.add(GetWeatherEvent(city: city));
              return Future.delayed(Duration.zero);
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchScreens()));
                            if (result != null) {
                              setState(
                                () {
                                  city = result.toString().toUpperCase();
                                  weatherBloc.add(GetWeatherEvent(city: city));
                                },
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          city,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
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
                    BlocBuilder<WeatherBloc, WeatherState>(
                      bloc: weatherBloc,
                      builder: (context, state) {
                        if (state is WeatherLoadingState) {
                          return const WeatherDisplay(
                            loaded: false,
                          );
                          ;
                        } else if (state is WeatherLoadedState) {
                          return WeatherDisplay(
                            weather: state.weather,
                            loaded: true,
                          );
                        } else if (state is WeatherErrorState) {
                          return Container(
                            child: Text('Error: ${state.error}'),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
