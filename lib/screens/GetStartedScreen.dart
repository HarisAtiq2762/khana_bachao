import 'package:flutter/material.dart';
import 'package:khana_bachao/screens/SelectType.dart';
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage('assets/images/khana bachao logo pg.png'),
                  width: size.width*0.5,
                ),
              ),
              // SizedBox(height: size.height*0.05,),
              Center(
                child: Container(
                  height: size.height*0.5,
                  child: Image(
                    image: AssetImage('assets/images/child.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // SizedBox(height: size.height*0.05,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectType()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffa606b1),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  width: size.width*0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Get Started',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),
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
