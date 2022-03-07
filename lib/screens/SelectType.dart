import 'package:flutter/material.dart';
import 'package:khana_bachao/modals/bottomNavBar.dart';
import 'package:khana_bachao/screens/LoginScreen.dart';
import 'package:khana_bachao/widgets/MyBottomNavBar.dart';
import 'package:provider/provider.dart';
class SelectType extends StatelessWidget {
  const SelectType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  image: AssetImage('assets/images/khana bachao logo pg.png'),
                  width: size.width*0.3,
                ),
              ),
              SizedBox(height: size.height*0.15,),
              Text('Get started with us',style: TextStyle(color: Colors.grey,fontSize: 40,fontWeight: FontWeight.w400)),
              Text('Login As',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold)),
              SizedBox(height: size.height*0.05,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffa606b1),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  width: size.width*0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Provider',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: size.width*0.3,color: Color(0xffa606b1),height: size.height*0.002,),
                  Text('  OR  ',style: TextStyle(color: Colors.grey,fontSize: 30,fontWeight: FontWeight.w400),),
                  Container(width: size.width*0.3,color: Color(0xffa606b1),height: size.height*0.002,),
                ],
              ),
              SizedBox(height: size.height*0.05,),
              GestureDetector(
                onTap: (){
                  Provider.of<MyBottomNavBarModal>(context,listen: false).index=2;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBottomNavBar()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffa606b1),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  width: size.width*0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Needy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
