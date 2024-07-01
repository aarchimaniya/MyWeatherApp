import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Views/Screens/home_page/home_page.dart';
import '../Views/Screens/login_screen/login_screen.dart';
import '../Views/Screens/search_page/search_page.dart';
import '../Views/Screens/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/detail', page: () => DetailPage(city: '', temperature: 'temperature')),
      ],
    );
  }
}
