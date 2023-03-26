import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/Users/SelectItem.dart';
import 'package:flutter_application_2/Users/db_functionU.dart';
import 'package:flutter_application_2/buttenNavig.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'db_functions2.dart';
//import 'db_fundtion3.dart';

class RegisterU extends StatelessWidget {
   RegisterU({super.key});
//String name='Fruits';

final _txte1=TextEditingController();
final _txte2=TextEditingController();
final _txte3=TextEditingController();
final _txte4 =TextEditingController();


 late String name1 ='' ;
    late String age ='';
    late String phone ='';
    late String email ='';

Future<SharedPreferences> _prefR = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('REGISTER'),actions: [

      ]),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
              //  keyboardType: TextInputType.number,
                controller: _txte1,
                decoration: const InputDecoration(
                  label: Text('name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),

              ),

              SizedBox(height:20),

              TextField(
                keyboardType: TextInputType.datetime,
                controller: _txte2,
                decoration: const InputDecoration(
                  label: Text('Date of Birth'),
                  border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10)))
                ),
              ),

              SizedBox(height: 20,),

              TextField(
                controller: _txte3,
                
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Number ',
                  label: Text('Phone No'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                controller: _txte4,
                decoration: InputDecoration(
                  hintText: 'email',
                  label: Text('email'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),
              SizedBox(height: 20,),


              Flexible(
                child: ElevatedButton.icon(
                  onPressed: (){
                      sendDataU2();
                    if(name1 != '' && phone != ''){
   final user = UserModel(name:name1, age:age,phone:phone, email:email);
                      addUser1(user);
      setSP(user).whenComplete(() {

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: ((context) {
                          return BottomNavigation(table:'USER');
                        }))
                      );
      });
                    }
              
                  },
                   icon: Icon(Icons.update_sharp),
                    label: Text('Sign up')
                    ),
              )
                  
            ],
          ),
        )
        ),
    );
  }

  Future<void> sendDataU2() async{
     name1 = _txte1.text.trim();
     age = _txte2.text.trim();
     phone = _txte3.text.trim();
     email = _txte4.text.trim();

     

    
  }
  Future setSP(UserModel user) async{
    final SharedPreferences sp = await _prefR;

    sp.setString('phone', user.phone);
    sp.setString('name', user.name);
  }
}