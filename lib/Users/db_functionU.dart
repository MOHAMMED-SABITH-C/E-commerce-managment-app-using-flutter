



//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/data_model.dart';
import 'loginUser.dart';

ValueNotifier<List<UserModel>> UserModelNotifier1 = ValueNotifier([]);
//ValueNotifier<List<StudentModel2>> StudnetModelNotifier2 = ValueNotifier([]);

late Database _db;

Future<void > InitilizeDataBaseUser1() async{
// _db = await openDatabase('student.db',      //id INTEGER ,
  _db =await openDatabase('user0.db',
  version: 1,
  onCreate:(Database db, int version) async{
    await db.execute('CREATE TABLE user0 (name TEXT, age TEXT , phone TEXT PRIMARY KEY, email TEXT)');
    //await db.execute('''CREATE TABLE IF NOT EXISTS cart(id INTEGER primary key ,userid TEXT,objects TEXT)''');
  } ,

   );

   getDetailsU();
}

Future<void> addUser1(UserModel value) async{
//  final studentDB = await Hive.openBox<StudentModel>('students_db');
//   await studentDB.add(value);
 await _db.rawInsert('INSERT INTO user0 (name,age,Phone,email) VALUES (?,?,?,?)',[value.name,value.age,value.phone,value.email]);


getDetailsU();
  // StudnetModelNotifier.value.add(value);
  // StudnetModelNotifier.notifyListeners();

}


Future<void> getDetailsU() async{
  // final studentDB = await Hive.openBox<StudentModel>('students_db');
  // StudnetModelNotifier.value.clear();
  
 final _values = await _db.rawQuery('SELECT * FROM user0',);
 print(_values);
 print ('hitable2');
UserModelNotifier1.value.clear();

_values.forEach((map1) {
  final objects1= UserModel.fromMap(map1);
 // print(objects1);
  UserModelNotifier1.value.add(objects1);


  UserModelNotifier1.notifyListeners();
 });
}

Future<UserModel> SearchUser(String phone) async{
  // User fetchedUser;
 // var obj ;
  final _values = await _db.rawQuery('Select * from user0 where phone = ? ',['$phone']);
  print(_values);
  if(_values.length>0){
    return UserModel.fromMap(_values.first);
  }else{
      // return null;
     return UserModel.fromMap(_values.first);
  }
//   UserModelNotifier1.value.clear();
// _values.forEach((map1) {
//   final objects1= UserModel.fromMap(map1);
//   //obj=objects1;
//  print(objects1);
//   UserModelNotifier1.value.add(objects1);
     
//   UserModelNotifier1.notifyListeners();

// });
  }
//      if(obj == null){
//     print('hinot valid+$obj');
// return showDialog(
//   context: context,
//   barrierDismissible: false,
//    builder: ((BuildContext context) {
//     Navigator.of(context).pushReplacement(
//        MaterialPageRoute(
//               // builder: (context)=>Login()
//               // ),
//               // (route)=>false
//               builder: (context) {
//                 return Login();
//               },
//        ),
//             );
//     //);
//     return AlertDialog(
//       title: Text('Not Registerd'),
//       // actions: [
//       //   TextButton(
//       //     onPressed: (){
//       //       Navigator.of(context).pop();
//       //     },
//       //     child: Text('Please Enter a valid number'),
//       //   )
//       // ],

//   //print('$phone');

// // var snapshot = await Firestore.instance.collection()

//     );
     
//    }));

  //print(objects1);


 // return objects1.name;
 //);
//}

Future<void> deleteUser1(String id) async{
  print(id);
 // id='';
//await deleteDatabase('objects0.db');
  await _db.rawDelete('DELETE FROM User0 WHERE id=?',[id]);
  getDetailsU();
}

