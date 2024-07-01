import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


class CityController extends ChangeNotifier {
  List allCity = [];
  bool Connected = false;

  CityController() {
    connectivity();
  }

  void connectivity() async {
    Connectivity().onConnectivityChanged.listen((event) {
      Connected = event.contains(ConnectivityResult.none) ? false : true;
      if (Connected) {

      }
      notifyListeners();
    });
  }
  //   Api calling
  // Future<void> initData() async {
  //   allCity = await ApiCalling.apiCalling.getCity();
  //   notifyListeners();
  // }
}