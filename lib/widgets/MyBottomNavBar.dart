import 'package:flutter/material.dart';
import 'package:khana_bachao/modals/bottomNavBar.dart';
import 'package:khana_bachao/screens/ExploreScreen.dart';
import 'package:khana_bachao/screens/FoodDetails.dart';
import 'package:khana_bachao/screens/HomeScreen.dart';
import 'package:provider/provider.dart';
class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({Key key}) : super(key: key);
  static List _widgetOptions = [
    HomeScreen(),
    FoodDetails(),
    ExploreScreen(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<MyBottomNavBarModal>(
          builder: (context,navBar,child){
            if(navBar.index==null){
              navBar.index=1;
            }
            return _widgetOptions.elementAt(navBar.index!=null?navBar.index:1);
          }
        ),
      ),
      bottomNavigationBar: Consumer<MyBottomNavBarModal>(
        builder: (context,navBar,child){
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedItemColor: Colors.black.withOpacity(0.7),
            selectedItemColor: Colors.black.withOpacity(0.7),
            onTap: (val){
              navBar.changeValue(val);
            },
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                tooltip: 'Home'.toUpperCase(),
                icon: Icon(Icons.home,color: navBar.index==0?Color(0xffa606b1):Colors.black.withOpacity(0.7),),
                title: Text('HOME',style: TextStyle(color: navBar.index==0?Color(0xffa606b1):Colors.black.withOpacity(0.7),),)
              ),
              BottomNavigationBarItem(
                  tooltip: 'charities'.toUpperCase(),
                  icon: Icon(Icons.favorite,color: navBar.index==1?Color(0xffa606b1):Colors.black.withOpacity(0.7),),
                  title: Text('charities'.toUpperCase(),style: TextStyle(color: navBar.index==1?Color(0xffa606b1):Colors.black.withOpacity(0.7),),)
              ),
              BottomNavigationBarItem(
                  tooltip: 'Explore'.toUpperCase(),
                  icon: Icon(Icons.search,color: navBar.index==2?Color(0xffa606b1):Colors.black.withOpacity(0.7),),
                  title: Text('Explore'.toUpperCase(),style: TextStyle(color: navBar.index==2?Color(0xffa606b1):Colors.black.withOpacity(0.7),),)
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,color: navBar.index==3?Color(0xffa606b1):Colors.black.withOpacity(0.7),),
                tooltip: 'profile'.toUpperCase(),
                  title: Text('profile'.toUpperCase(),style: TextStyle(color: navBar.index==3?Color(0xffa606b1):Colors.black.withOpacity(0.7),),)
              ),
            ],
          );
        },
      ),
    );
  }
}
