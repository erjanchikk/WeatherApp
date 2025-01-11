import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/helpers/api_requester.dart';
import 'package:weatherapp/models/weather_models.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    ApiRequester apiRequester = ApiRequester();
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());

      try {
        final response = await apiRequester.getResponse(event.city);
        WeatherModel weather = weatherModelFromJson(response.body);
        

        emit(WeatherLoadedState(weather: weather));
      } catch (e) {
        print(e.toString());
        emit(WeatherErrorState(error: e.toString()));
      }
    });
  }
}
