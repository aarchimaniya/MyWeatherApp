import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:weatherapp/components/detail_weather.dart';
import 'package:weatherapp/helper/api_helper.dart';
import 'package:weatherapp/modal/weather_modal.dart';

import '../search_page/search_page.dart';

Future<Weather?>? getWeather;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSun = true; // Track if sun or moon image should be displayed

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getWeather = ApiHelper.apiHelper.fetchSingleWeather("Surat");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            isSun
                ? 'lib/assets/images/category/hhh.png'
                : 'lib/assets/images/category/hhd.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.cloud,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(city: '', temperature: 'temperature'),
                    ),
                  ).then((value) => setState(() {}));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Color(0xFFf5f5f5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(60),
                      ),
                    ),
                    builder: (context) => DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.4,
                      maxChildSize: 0.9,
                      minChildSize: 0.32,
                      builder: (context, scrollController) => Container(
                        height: double.infinity,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Your Current Location:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Latitude: 12.3456\nLongitude: 78.9101',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  isSun ? Icons.wb_sunny : Icons.nightlight_round,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isSun = !isSun; // Toggle between sun and moon images
                  });
                },
              ),
            ],
          ),
          body: FutureBuilder(
            future: getWeather,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("ERROR: ${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                Weather? data = snapshot.data as Weather?;
                String conditionImage =
                    'lib/assets/images/'; // Path to your condition images

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: screenHeight * 0.44,
                        width: screenWidth,
                        child: _buildWeatherImage(
                            data?.ConditionText, conditionImage),
                      ),
                      SizedBox(height: 1),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFF759fa1),
                              Color(0xFFcdb3ab)
                            ],
                            stops: [0.0, 1.0],
                          ).createShader(bounds);
                        },
                        child: Text(
                          " ${data?.temp_c}°C",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 55,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 1),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFF759fa1),
                              Color(0xFFcdb3ab)
                            ],
                            stops: [0.0, 1.0],
                          ).createShader(bounds);
                        },
                        child: Text(
                          " ${data?.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 1),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFF759fa1),
                              Color(0xFFcdb3ab)
                            ],
                            stops: [0.0, 1.0],
                          ).createShader(bounds);
                        },
                        child: Text(
                          " ${data?.country}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Color(0xFFf5f5f5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(60),
                  ),
                ),
                builder: (context) => DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.4,
                  maxChildSize: 0.9,
                  minChildSize: 0.32,
                  builder: (context, scrollController) => SingleChildScrollView(
                    controller: scrollController,
                    child: Details_Weather(),
                  ),
                ),
              );
            },
            backgroundColor: Color(0xffbfc3d0),
            child: Text(
              "➕",
              style: TextStyle(fontSize: screenHeight * 0.02),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: [
              Icons.swipe_up_alt_outlined,
              Icons.list,
            ],
            iconSize: screenHeight * 0.04,
            activeIndex: 0,
            gapWidth: screenHeight * 0.1,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: screenHeight * 0.05,
            rightCornerRadius: screenHeight * 0.05,
            height: screenHeight * 0.1,
            inactiveColor: Colors.white,
            activeColor: Colors.white,
            backgroundGradient: LinearGradient(
              colors: [
                Color(0xffbfc3d0),
                Color(0xffbfc3d0).withOpacity(0.9),
              ],
            ),
            onTap: (int) {},
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherImage(String? conditionText, String conditionImage) {
    switch (conditionText) {
      case "Sunny":
        return Transform.scale(
          scale: 1.2,
          child: Image.asset(
            "lib/assets/images/category/sunny.jpg",
            fit: BoxFit.cover,
          ),
        );
      case "Clear":
        return Transform.scale(
          scale: 1,
          child: Image.asset(
            "lib/assets/images/sky.png",
            fit: BoxFit.cover,
          ),
        );
      case "Partly cloudy":
        return Container(
          height: 10,
          width: 10,
          child: Image.asset(
            "lib/assets/images/category/partcloud1.jpg",
            fit: BoxFit.cover,
          ),
        );
      case "Thundery outbreaks possible":
        return Transform.scale(
          scale: 1,
          child: Image.asset(
            "lib/assets/images/category/thuderstorm.jpg",
            fit: BoxFit.cover,
          ),
        );
      case "Overcast":
        return Transform.scale(
          scale: 1,
          child: Image.asset(
            "lib/assets/images/category/overcast1.jpg",
            fit: BoxFit.cover,
          ),
        );
      case "Moderate or heavy snow showers":
        return Transform.scale(
          scale: 1,
          child: Image.asset(
            "lib/assets/images/category/snowshowers.jpg",
            fit: BoxFit.cover,
          ),
        );
      case "Light rain":
        return Container(
          child: Transform.scale(
            scale: 1.2,
            child: Image.asset(
              "lib/assets/images/category/cloudrain.jpg",
              fit: BoxFit.cover,
            ),
          ),
        );
      default:
        return Container(); // Placeholder for other conditions or no image
    }
  }
}
