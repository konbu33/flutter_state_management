import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MenuState extends ChangeNotifier {
  MenuState();

  String selectedValue = 'Select State Management => ';

  List<String> menuList = [
    'StatelessWidget',
    'StatefulWidget',
    'InheritedWidget',
    'Bloc',
    'Provider_Change_Notifier',
    'Provider_State_Notifier',
    'Riverpod',
    'Riverpod_Consumer_StatefulWidget',
  ];

  // MenuState copyWith(String selectedValue) {
  //   return MenuState(selectedValue: selectedValue);
  // }

  void updateSelectedValue(String selectedValue) {
    this.selectedValue = selectedValue;
    notifyListeners();
  }
}
