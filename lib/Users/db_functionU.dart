



//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/data_model.dart';
import 'loginUser.dart';

ValueNotifier<List<UserModel>> UserModelNotifier1 = ValueNotifier([]);

late Database _db;

Future<void > InitilizeDataBaseUser1() async{
  _db =await openDatabase('user0.db',
  version: 1,
  onCreate:(Database db, int version) async{
    await db.execute('CREATE TABLE user0 (name TEXT, age TEXT , phone TEXT PRIMARY KEY, email TEXT)');
  } ,

   );

   getDetailsU();
}

Future<void> addUser1(UserModel value) async{
 await _db.rawInsert('INSERT INTO user0 (name,age,Phone,email) VALUES (?,?,?,?)',[value.name,value.age,value.phone,value.email]);


getDetailsU();
}


Future<void> getDetailsU() async{
  
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
  final _values = await _db.rawQuery('Select * from user0 where phone = ? ',['$phone']);
  print(_values);
  if(_values.length>0){
    return UserModel.fromMap(_values.first);
  }else{
     return UserModel.fromMap(_values.first);
  }

  }


Future<void> deleteUser1(String id) async{
  print(id);
  await _db.rawDelete('DELETE FROM User0 WHERE id=?',[id]);
  getDetailsU();
}

