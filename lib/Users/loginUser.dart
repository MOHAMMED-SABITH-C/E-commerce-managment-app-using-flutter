import 'package:flutter/material.dart';
import 'package:flutter_application_2/Users/RegisterU.dart';
import 'package:flutter_application_2/Users/db_functionU.dart';
import 'package:flutter_application_2/buttenNavig.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
   Login({super.key,required this.type,required this.phone,required this.name});//,required this.list});
   late String type;
  late String phone='';
  late String name='';

  @override
  State<Login> createState() => _LoginState2() ;
}


class _LoginState2 extends State<Login> {
Future<SharedPreferences> _pref = SharedPreferences.getInstance();

final _txte1=TextEditingController();
final _txte3=TextEditingController();
 late String name1 ='' ;

    late String age ='';

    late String phone ='';

    late String email ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),
      actions: [IconButton(onPressed: (){
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context)=>BottomNavigation(table: 'Electronic Devices')
              ),
              (route)=>false
            );
        }, icon:Icon(Icons.exit_to_app))
      ],),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              TextField(
              //  keyboardType: TextInputType.number,
              obscureText: true,
                controller: _txte1,
                decoration: const InputDecoration(
                  label: Text('name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

              Flexible(
                child: ElevatedButton.icon(
                  onPressed: (){
                    print('login');
                      sendDataU2();
                    if(name1 != '' && phone != ''){
                 
                   } else{

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior:SnackBarBehavior.floating,
                  backgroundColor: Colors.cyan,
                  margin:EdgeInsets.all(10),
                  content: Text("Please Enter Phone No or User Name",style: TextStyle(color: Colors.red),)
                  )
                          );
                      }
              
                  },
                   icon: Icon(Icons.update_sharp),
                    label: Text('Login')
                    ),
              ),

              Flexible(
                child: ElevatedButton.icon(
                  onPressed: (){
                    print('sign up');
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return RegisterU();
                        })
                      );
                    },
              
                   icon: Icon(Icons.update_sharp),
                    label: Text('Sign Up')
                    ),
              )
              ],)
                  
      ]),
    );
  }

   sendDataU2() async{
     name1 = _txte1.text.trim();
     phone = _txte3.text.trim();
     print(phone+name1);
  if(name1.isNotEmpty && phone.isNotEmpty){
    await SearchUser(phone).then((value) => {
      if(value != null){
        print('notnull'),
      setSP(value).whenComplete(() {

      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: ((context) {
                         return BottomNavigation(table:'USER');

                        }),));
      })
      }else{
        print('nullvalue'),
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior:SnackBarBehavior.floating,
                  backgroundColor: Colors.cyan,
                  margin:EdgeInsets.all(10),
                  content: Text("Please valid Phone No and User Name",style: TextStyle(color: Colors.red),)
                  )
                          )
      }
    });
  }
    
  }

  Future setSP(UserModel user) async{
    final SharedPreferences sp = await _pref;

    sp.setString('phone', user.phone);
    sp.setString('name', user.name);
  }
}
