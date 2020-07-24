import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const  apiKey='c1b158bd916e5d7eead81b837d2d429a';
const openWeatherMapURL='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather (String cityName) async{
    var url='$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper nethelpAnother= NetworkHelper(url);

    var weatherData = await nethelpAnother.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    //latitude=location.latitude;
    //longitude=location.longitude;

    NetworkHelper nethelp = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    dynamic weatherData = await nethelp.getData();

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
    if (temp > 28) {
      return 'It\'s 🍦 time';
    } else if (temp > 22) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
