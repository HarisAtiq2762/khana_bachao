import 'package:flutter/material.dart';
import 'package:khana_bachao/modals/bottomNavBar.dart';
import 'package:khana_bachao/modals/checkBox.dart';
import 'package:khana_bachao/modals/customSlider.dart';
import 'package:khana_bachao/modals/obsecurePass.dart';
import 'package:khana_bachao/screens/GetStartedScreen.dart';
import 'package:khana_bachao/screens/LoginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CheckBox()),
      ChangeNotifierProvider(create: (_) => ObSecurePass()),
      ChangeNotifierProvider(create: (_) => CustomSlider()),
      ChangeNotifierProvider(create: (_) => MyBottomNavBarModal()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Map<int, Color> color =
  {
    50:Color(0xffa606b1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(136,14,79, .4),
    400:Color.fromRGBO(136,14,79, .5),
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Color.fromRGBO(136,14,79, .8),
    800:Color.fromRGBO(136,14,79, .9),
    900:Color.fromRGBO(136,14,79, 1),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xffa606b1, color),
      ),
      home: GetStartedScreen(),
    );
  }
}