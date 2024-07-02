import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helper/api_helper.dart';
import '../home_page/home_page.dart';

List townList = [];

class DetailPage extends StatefulWidget {
  final String city;
  final String temperature;

  DetailPage({required this.city, required this.temperature});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/category/purple.jpg', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'Weather Details',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onSubmitted: (val) {
                            townList.add(val);
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            labelText: "Town",
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                            hintText: "Search for Town...",
                            enabledBorder: const OutlineInputBorder(),
                            fillColor: Colors.black,
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                getWeather = ApiHelper.apiHelper
                                    .fetchSingleWeather(townList[index]);
                                setState(() {});
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: h * 0.22,
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(30),
                                    topEnd: Radius.circular(0),
                                    bottomEnd: Radius.circular(200),
                                    bottomStart: Radius.circular(30),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff5735b1),
                                      Color(0xff372a86),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    stops: [0.3, 0.9],
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 30),
                                      child: Row(
                                        children: [
                                          Text(
                                            townList[index],
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: h * 0.035,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 65),
                                      child: Divider(
                                        color: Colors.purpleAccent,
                                        thickness: 2,
                                        indent: w * 0.05,
                                        endIndent: w * 0.63,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 200),
                                      child: Image.asset(
                                        "lib/assets/images/category/sky.png",
                                        height: h * 0.2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 140),
                                      child: IconButton(
                                        onPressed: () {
                                          townList.removeAt(index);
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.clear,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: townList.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
