import 'package:flutter/material.dart';
          // import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/Users/RegisterU.dart';
// import 'package:flutter_application_2/Users/SelectItem.dart';
// import 'package:flutter_application_2/Users/UserBill.dart';
import 'package:flutter_application_2/Users/db_functionU.dart';
import 'package:flutter_application_2/buttenNavig.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
// import 'package:flutter_application_2/list.dart';
import 'package:flutter_application_2/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
   Login({super.key,required this.type,required this.phone,required this.name});//,required this.list});
   late String type;
  // late var list;
  late String phone='';
  late String name='';

  @override
  State<Login> createState() => _LoginState2() ;
}

// class _LoginState extends State<Login>{

//  @override
//    Widget build(BuildContext context) {
//                               print('check logi');
//       print(widget.phone);

//       getAllStudents();
//     return Scaffold(
//      // appBar: AppBar(title: const Text("Electronic Devices"),),
//       body: SafeArea( 
//          child: ValueListenableBuilder(
//                         valueListenable: UserModelNotifier1, 
//                         builder: (BuildContext context, List<UserModel> studentList, Widget? child){
//                          // return ListView(
//                           ////  itemBuilder: (context, index) {
//                               final data = studentList[0];
//                               print(data.phone);
//                               print('check login');
//                               if(data.phone == widget.phone && data.name == widget.name){
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: ((context) {
//                          return BottomNavigation(table: 'USER');
//                           //return UserBill(from: 'BUY',phone:phone,name:name,count:count,price:price);
//                          // return BottomNavigation(table:'USER');
//                         }))
//                       );
//                       }
//                       else{

//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   behavior:SnackBarBehavior.floating,
//                   backgroundColor: Colors.cyan,
//                   margin:EdgeInsets.all(10),
//                   content: Text("Incorrect Phone No or User Name")
//                   )
//                           );
//                       }
//                              return Login(type: '2nd',phone: widget.phone,name: widget.name,);//,list: data,);
//                             //}
//                           //);
//                         }
//          )
//       )
//     );
//    }


// }

class _LoginState2 extends State<Login> {
Future<SharedPreferences> _pref = SharedPreferences.getInstance();

final _txte1=TextEditingController();

//final _txte2=TextEditingController();
final _txte3=TextEditingController();

//final _txte4 =TextEditingController();
 late String name1 ='' ;

    late String age ='';

    late String phone ='';

    late String email ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),
      actions: [IconButton(onPressed: (){
          //signout(context);
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
                // validator: (_){
                //   if(_)
                // },

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
                  //    SearchUser(widget.phone);
                  //  print('login hopinne');

                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(builder: ((context) {
                      // return Login(type: '1st',phone: phone,name: name1,);//, list: widget.list);
                      //   }),));

                     // late var data = widget.list;
                     // print(data.name);
                  //     if(data.phone == phone && data.name == name1){
                  //     Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(builder: ((context) {
                  //         //return UserBill(from: 'BUY',phone:phone,name:name,count:count,price:price);
                  //        // return BottomNavigation(table:'USER');
                  //        return BottomNavigation(table: 'USER');
                  //       }))
                  //     );
                  //     }
                  //     else{

                  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  // behavior:SnackBarBehavior.floating,
                  // backgroundColor: Colors.cyan,
                  // margin:EdgeInsets.all(10),
                  // content: Text("Incorrect Phone No or User Name")
                  // )
                  //         );
                  //     }
                      
            //           Container(
            //  child: ValueListenableBuilder(
            //     valueListenable: UserModelNotifier1, 
            //     builder: (BuildContext context, List<UserModel> studentList, Widget? child){
            //               data = studentList[0];
            //               return Expanded(
            //                 child: Login()
                          
            //               );
                         // Container(

                        //  child:Column(children: [

  //                       //  ],)
  //                   }
  //                 }
  //                 );
  //               //          );
  //               }
  //            ));

  //  //final user = UserModel(name:name1, age:age,phone:phone, email:email);
  //                     //addUser1(user);
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
                //      sendDataU2();
                 //   if(name1 != '' && phone != ''){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return RegisterU();
                         // return BottomNavigation(table:'USER');
                        })
                      );
                    //  SearchUser(phone);

   //final user = UserModel(name:name1, age:age,phone:phone, email:email);
                      //addUser1(user);
                    },
              
                //  },
                   icon: Icon(Icons.update_sharp),
                    label: Text('Sign Up')
                    ),
              )
              ],)

                  
           // ],
          //),
       // )
       /// ),
    //);
 // }

      ]),
    );
  }

//}
   sendDataU2() async{
     name1 = _txte1.text.trim();
    // age = _txte2.text.trim();
     phone = _txte3.text.trim();
     print(phone+name1);
    // email = _txte4.text.trim();
  //   widget.name=name1;
  // widget.phone =phone;
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