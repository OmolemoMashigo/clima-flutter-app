import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'location.dart';

const apiKey = "92df0209ec281fd77fd2554b9a727b8e";

class WeatherModel {
  double lat = 0;
  double long = 0;

  Future<dynamic> getCityWeather(String city) async {
    NetworkHelper networkObj = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric");

    var weatherData = await networkObj.getData();
    print("this is the city weather data:");
    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location locationObj = Location();
    await locationObj
        .getCurrentLocation(); // wait for this to complete therefore getCurrentLocation must be a Future
    lat = locationObj.latitude;
    long = locationObj.latitude;

    NetworkHelper networkObj = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric");

    var weatherData = await networkObj.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
