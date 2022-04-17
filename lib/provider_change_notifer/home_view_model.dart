import 'package:flutter/material.dart';

class HomePageState extends ChangeNotifier {
  int counter = 0;
  String title = "Provider + ChangeNotifier";
  String message = 'message : Provider + ChangeNotifier';

  void increment() {
    counter++;
    notifyListeners();
  }
}
