import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../helper/api_helper.dart';
import '../modal/weather_modal.dart';

class WeatherController extends GetxController {
  // Rx<Weather> currentWeather = Weather(city: 'city', temperature: double.minPositive, weatherCondition: 'weatherCondition').obs;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchWeatherByLocation(); // Fetch weather on controller initialization
  // }

  // Future<void> fetchWeatherByLocation() async {
  //   if (await _checkLocationPermission()) {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //     await fetchWeather(position.latitude, position.longitude);
  //   } else {
  //     // Handle no location permission
  //     print('Location permission not granted');
  //   }
  // }

  // Future<void> fetchWeather(double lat, double lon) async {
  //   var weatherData = await ApiHelper.fetchWeather(lat, lon);
  //   if (weatherData != null) {
  //     currentWeather.value = Weather.fromJson(weatherData);
  //   }
  // }

  Future<bool> _checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isRestricted) {
      var result = await Permission.location.request();
      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
