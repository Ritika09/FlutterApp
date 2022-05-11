import 'package:global_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Key -- 95e0b2216e2ec188f8a2a857fa2874c2

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/
  //weather?q=London&appid=95e0b2216e2ec188f8a2a857fa2874c2
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '95e0b2216e2ec188f8a2a857fa2874c2';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}



