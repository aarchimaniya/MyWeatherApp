import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/Views/Screens/home_page/home_page.dart';
import 'package:weatherapp/modal/weather_modal.dart';

class Details_Weather extends StatelessWidget {
  const Details_Weather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: getWeather,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          Weather? data = snapshot.data as Weather?;
          return Padding(
            padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Hourly Forecast",
                      style: GoogleFonts.kanit(
                        textStyle:
                            TextStyle(fontSize: h * 0.02, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xffb08ddd).withOpacity(0.7),
                  thickness: 2,
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      data!.hour.length,
                      (index) {
                        return Container(
                          height: h * 0.25,
                          width: w * 0.2,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFF9abdf1),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 5,
                                offset: Offset(-2, -2),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                data.hour[index]['time']
                                    .toString()
                                    .split("${DateTime.now().day}")[0],
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: h * 0.02,
                                  ),
                                ),
                              ),
                              Image.network(
                                "http:${data.hour[index]['condition']['icon']}",
                                height: h * 0.08,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.hour[index]['temp_c'].toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.022,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  const Text(
                                    "o",
                                    style: TextStyle(color: Colors.white54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: h * 0.22,
                    width: w,
                    decoration: BoxDecoration(
                      color: Color(0xFF9abdf1),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Color(0xFF9abdf1),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Icon(
                                Icons.snowing,
                                color: Colors.grey,
                              ),
                              Text(
                                "AIR QUALITY",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Text(
                                "3-Low Health Risk",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: h * 0.022,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            height: h * 0.005,
                            width: w,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff3a59b3),
                                  Color(0xff8f59d7),
                                  Color(0xffcc52d2),
                                  Color(0xffe54499),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Transform.translate(
                              offset: Offset(-h * 0.13, 0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "See more",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: h * 0.02,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey.shade700,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 14, right: 14, bottom: 14),
                  child: Row(
                    children: [
                      Container(
                        height: h * 0.23,
                        width: w * 0.39,
                        decoration: BoxDecoration(
                          color: Color(0xFF9abdf1),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0xFF9abdf1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.sunny,
                                    color: Colors.grey.shade500,
                                  ),
                                  Text(
                                    " UV INDEX",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Text(
                                    "${data.uv}",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.04,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Text(
                                    "Temp",
                                    style: TextStyle(
                                      fontSize: h * 0.03,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                height: h * 0.005,
                                width: w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff3a59b3),
                                      Color(0xff8f59d7),
                                      Color(0xffcc52d2),
                                      Color(0xffe54499),
                                    ],
                                  ),
                                ),
                                child: Transform.translate(
                                  offset: Offset(-h * 0.08, 0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: w * 0.04,
                      ),
                      Container(
                        height: h * 0.23,
                        width: w * 0.35,
                        decoration: BoxDecoration(
                          color: Color(0xFF9abdf1),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0xFF9abdf1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.sunny_snowing,
                                    color: Colors.grey.shade500,
                                  ),
                                  Text(
                                    " Sun",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "${data.temp_c}",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: h * 0.03,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h * 0.05,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Text(
                                    "sunset : ${data.is_day}",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.015,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Container(
                        height: h * 0.25,
                        width: w * 0.45,
                        decoration: BoxDecoration(
                          color: Color(0xFF9abdf1),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0xFF9abdf1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.air,
                                    color: Colors.grey.shade500,
                                  ),
                                  Text(
                                    " WIND",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: h * 0.195,
                              width: w * 0.35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xff44455a), width: 10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "N",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: h * 0.02,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "W",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: h * 0.02,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "${data.wind_mph}",
                                              style: TextStyle(
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "km/h",
                                              style: TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: h * 0.015),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "E",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: h * 0.02,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "S",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: h * 0.02,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      Container(
                        height: h * 0.21,
                        width: w * 0.30,
                        decoration: BoxDecoration(
                          color: Color(0xFF9abdf1),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0xFF9abdf1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 14, left: 14, right: 14),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.water_drop,
                                    color: Colors.grey.shade500,
                                  ),
                                  Text(
                                    " Rain",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "${data.is_day} m",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: h * 0.020,
                                ),
                              ),
                            ),
                            Text(
                              "🧭🧭",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: h * 0.010,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
    );
  }
}
