import 'package:flutter/material.dart';
import 'package:weatherapp/Views/Screens/home_page/home_page.dart';
import 'package:weatherapp/Views/Screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 10), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'lib/assets/images/category/SPLASH.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
