import 'package:flutter/material.dart';
class ObSecurePass extends ChangeNotifier{
  bool isHide;
  ObSecurePass({this.isHide});

  void changeValue(bool val){
    isHide = val;
    print(val);
    notifyListeners();
  }
}