import 'package:flutter/material.dart';
import 'package:khana_bachao/modals/checkBox.dart';
import 'package:khana_bachao/modals/obsecurePass.dart';
import 'package:khana_bachao/screens/FoodDetails.dart';
import 'package:khana_bachao/widgets/MyBottomNavBar.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){Navigator.pop(context);},
                        child: Icon(Icons.arrow_back,color: Color(0xffa606b1),size: 35,)),
                    Image(
                      image: AssetImage('assets/images/khana bachao logo pg.png'),
                      width: size.width*0.3,
                    ),
                  ],
                ),
                SizedBox(height: size.height*0.05,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                  child: Text('Login',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                  child: Text('Get started with us.',style: TextStyle(color: Colors.grey,fontSize: 30,fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: size.height*0.03,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                  child: TextField(
                    controller: email,
                    style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        labelText: 'Username or Email',
                        labelStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 20,fontWeight: FontWeight.w400)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                  child: Consumer<ObSecurePass>(
                      builder: (context,passVisibility,child){
                        if(passVisibility.isHide==null){
                          passVisibility.isHide=true;
                        }
                        return TextField(
                          obscureText: passVisibility.isHide,
                          controller: pass,
                          style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              suffixIcon:GestureDetector(
                                  onTap: (){
                                    passVisibility.changeValue(!passVisibility.isHide);
                                  },
                                  child: Icon(passVisibility.isHide==true? Icons.visibility_off_outlined:Icons.remove_red_eye_outlined)),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 20,fontWeight: FontWeight.w400)
                          ),
                        );
                      }
                  ),
                ),
                SizedBox(height: size.height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Consumer<CheckBox>(
                      builder: (context,checkBox,child){
                        return Checkbox(
                            value: checkBox.isChecked!=null?checkBox.isChecked:false,
                            onChanged: (value){
                              checkBox.changeValue(value);
                            });
                      },
                    ),
                    Text('Remember Password'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text('Forget Password?'),
                  ),
                ),
                SizedBox(height: size.height*0.05,),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBottomNavBar()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffa606b1),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      width: size.width*0.7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text('CONTINUE TO LOGIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

