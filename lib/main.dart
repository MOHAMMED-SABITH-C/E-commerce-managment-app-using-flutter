
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

//////////////////////////important for windows
 import 'dart:io';
// import 'package:flutter/material.dart';

// void main() {
// //  runApp(const MaterialApp(home: Myapp(),));
//   runApp(Myapp());
// }

// class Myapp extends StatelessWidget {
//   const Myapp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primaryColor: Colors.blue),
//       home: HomeScreen(),
//     );
//   }
// }

// String name = 'MOHAMMED SABITH C';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 19, 245, 7),
//       // appBar: AppBar(title: Text('Flutter first frame'),),
//       body: SafeArea(
//        //   child: Container(
//               child: Column(
//                 children: [
//                   Expanded(
//                       flex:2,
//                     child: Container(
//              // width: double.infinity,
//              // height: double.infinity,
//              child:Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:[
//                   Text(
//                     name,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w800,
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//              ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color:Colors.yellow,
//                         borderRadius:BorderRadius.circular(50),
//                         border:Border.all(
//                           color: Colors.cyan,
//                           width: 10,
//                           ),
//                       ),
//                   //  color:Color.fromARGB(255, 251, 0, 0),
//                   child:Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextButton(
//                           onPressed: () {
//                             name = 'MOHAMMED SABITH C';
//                           },
//                           child: Text('click me')),
//                       CloseButton(),
//                     ],
//                   ),
//                     ),
//                   ),
//               //),
//                // ],
//              // ),
//               //),
      
//               Expanded(
//                 child: Container(
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//         //child: Expanded(
//                         children: [
//                       IconButton(onPressed: (){},icon: Icon(Icons.mic)
//         ),
//                           //onPressed: () {}, icon: Icon(Icons.access_alarm)),
//                       ElevatedButton(onPressed: () {}, child: Text('hi')),
//                     ],
//                     ),
//                     ),
//               )
//                ],
        
//       ),
//     ),
//     );
//       //          ],
//   }
// }


////////////////////////////newproject///////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// main(){
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme:ThemeData(primaryColor:Colors.amber),
//       home: Screen(),
//     );
//   }
// }


// class Screen extends StatelessWidget {
//   Screen({Key? key}) : super(key: key);

//   final _textControl=TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor:Color.fromARGB(255, 57, 254, 8),
//       body:SafeArea(
//         child: Padding(
//           padding:EdgeInsets.all(30),
//           child: Container(
//             decoration: BoxDecoration(
//             borderRadius:BorderRadius.only(
//               topLeft:Radius.circular(10.0),
//               topRight: Radius.circular(10.0)
//                )
//             ,
//             color:Colors.cyan,
//             ),
//             child: Column(children: [
//               TextField(
//                 controller: _textControl,
//                 style:TextStyle(color:Colors.white),
//                 decoration: InputDecoration(
//                   hintText:'type anything',
//                   //fillColor:Colors.blue,
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               ElevatedButton(onPressed:(){
//                 print(_textControl.text);
//               }, child: Text('click me')),
//               Text('Hi I am MOHAMMED SABITH C',
//               style:TextStyle(color:Colors.white) ,),
//                        ],),
//           ),
//         ),
//       )
//     );
//   }
// }
 
 /////////////////////////////new Project/////////////////////////////////////////

//import 'package:flutter/cupertino.dart';'''
////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Users/cart/db_functionC.dart';
import 'package:flutter_application_2/Users/db_functionU.dart';
//////////////////////////////////////////
// import 'package:flutter_application_2/calculator.dart';
// import 'package:flutter_application_2/counter.dart';
//import 'package:flutter_application_2/database_1.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
// import 'package:flutter_application_2/monymange/fluidbar.dart';
// import 'package:flutter_application_2/monymange/bottomtop.dart';
// import 'package:flutter_application_2/personalMM/db_money1.dart';
// import 'package:flutter_application_2/list.dart';
// import 'package:flutter_application_2/model/data_model.dart';

import '3rddb/db_fundtion3.dart';
import '4rthdb/db_function4.dart';
import 'editdb.dart';
// import 'package:flutter_application_2/screan_1.dart';
// import 'package:flutter_application_2/screen_2.dart';
// import 'package:flutter_application_2/screen_3.dart';
// import 'package:flutter_application_2/splash.dart';
//import 'package:hive_flutter/adapters.dart';
//import 'package:shared_preferences/shared_preferences.dart';

 import 'buttenNavig.dart';
import 'seconddb/db_functions2.dart';

// import 'dropdown.dart';
// import 'floatingbar.dart';
import 'log.dart';
//import 'package:flutter_application_2/firstPage.dart';
//late SharedPreferences sharedPreferences;
// import 'monymange/payment.dart';

 Future<void>main() async {
 WidgetsFlutterBinding.ensureInitialized();
 // sharedPreferences= await SharedPreferences.getInstance();
 await InitilizeDataBaseUser1();
 await InitilizeDataBaseUserC();
 await InitilizeDataBase2();
 await InitilizeDataBase1();
await InitilizeDataBase3();
// await InitilizeDataBase4();
//  alter();
//  await initialiZe();
//  await initialiZe();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( theme:ThemeData(primarySwatch: Colors.blue,),
      // home: listcreation(),
     // home: calculator(),
//  home:screen1()    ,
//     //  routes:{
//     //   'screen_1':(context){
//     //     return screen1();
//     //   },
//     //   'screen_2':(context){
//     //     return screen2();
//     //   },jhhh
//     //   'screen_3':(context){
//     //     return screen3();
//     //   }
//     //  }
    // home: splsh(),
   
   // home:LoginPage(),
  // home : counter(),
   //home : floatBar(),
   
  
  //  /////////////////////
  home: Logi(),
  
  // home:topbar()//fluidbar()//payment(),
  
  
  //  home: BottomNavigation(table: 'Electronic Devices',),
   
   //home: dropdownButton(),


  // home:loginP(),

 //  home: Editdb(),
       );
  }
}