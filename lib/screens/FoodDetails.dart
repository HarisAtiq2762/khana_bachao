import 'package:flutter/material.dart';
import 'package:khana_bachao/modals/customSlider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
class FoodDetails extends StatelessWidget {
  FoodDetails({Key key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController foodType = TextEditingController();
  TextEditingController amountOfFood = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController pickupAddress = TextEditingController();


  _submitForm(String name,String type,String amount,String number,String pickupAddress,context) async {
    final database = await FirebaseDatabase.instance;
    database.reference().child('forms').push().set({
      'Restaurant Name':name,
      'Food Type':type,
      'Amount':amount,
      'Contact Number':number,
      'Pickup Addresss': pickupAddress,
      'Pieces' : Provider.of<CustomSlider>(context,listen: false).value.toString()
    });
  }

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
                  child: Text('Enter Your Food Details',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                  child: Text('Help The Nearby',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: size.height*0.03,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          labelText: '  Enter Restaurant Name',
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 15,fontWeight: FontWeight.w400)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: TextField(
                      controller: foodType,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: '  Enter Food Type',
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 15,fontWeight: FontWeight.w400)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: TextField(
                      controller: amountOfFood,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: '  Enter Amount of Food',
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 15,fontWeight: FontWeight.w400)
                      ),
                    ),
                  ),
                ),
                Consumer<CustomSlider>(
                  builder: (context,cs,child){
                    return Slider(
                        min: 10.0,
                        max: 100.0,
                        value: cs.value!=null?cs.value:10.0,
                        onChanged: (val){
                          cs.changeValue(val);
                        }
                    );
                  }
                ),
                Consumer<CustomSlider>(
                  builder: (context,cs,child){
                    return Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0,0.0,15.0,15.0),
                        child: Text(
                          cs.value!=null?cs.value.round().toString()+' pieces':'10.0'+' pieces',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Color(0xffa606b1),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: TextField(
                      controller: number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: '  Contact Number',
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 15,fontWeight: FontWeight.w400)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: TextField(
                      controller: pickupAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: '  Pickup Address',
                          labelStyle: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 15,fontWeight: FontWeight.w400)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: ()async{
                        _submitForm(name.text,foodType.text,amountOfFood.text,number.text,pickupAddress.text,context);
                        showDialog(context: context, builder: (context){
                          return Center(
                            child: Container(
                              // width: size.width * 0.5,
                              height: size.height *0.3,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.done,size: 40.0,color: Color(0xffa606b1),),
                                    SizedBox(height: size.height*0.01,),
                                    Text('Food Supply posted',style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffa606b1),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('SUBMIT FORM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.05,),
              ],
            ),
          ),
        ),
      )
    );
  }
}
