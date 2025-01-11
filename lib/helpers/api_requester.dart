import 'package:http/http.dart' as http;

class ApiRequester {
  static String api = 'https://api.openweathermap.org/data/2.5/weather';
  static String apiKey = '4e9bd258205e0dac061bf02bc17a61bf';

  Future<http.Response> getResponse(String city) async {
    Uri url = Uri.parse('$api?q=$city&appid=$apiKey&units=metric');
    return await http.get(url);
  }
}