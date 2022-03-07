import 'package:flutter/material.dart';
class CheckBox extends ChangeNotifier{
  bool isChecked;
  CheckBox({this.isChecked});

  void changeValue(bool val){
    isChecked = val;
    notifyListeners();
  }
}