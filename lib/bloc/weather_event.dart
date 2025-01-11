part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class GetWeatherEvent extends WeatherEvent{
  final String city;

  GetWeatherEvent({required this.city});
}
