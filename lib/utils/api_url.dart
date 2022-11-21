import 'package:weathersec/api/api_key.dart';

String apiUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apiKey&units=metric";
  return url;
}
