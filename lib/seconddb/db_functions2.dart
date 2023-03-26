import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/data_model.dart';

ValueNotifier<List<StudentModel2>> StudnetModelNotifier2 = ValueNotifier([]);

late Database _db;

Future<void > InitilizeDataBase2() async{
// _db = await openDatabase('student.db',      //id INTEGER ,
  _db =await openDatabase('objects022.db',
  version: 1,
  onCreate:(Database db, int version) async{
    await db.execute('CREATE TABLE objects022 ( name TEXT PRIMARY KEY , price INTEGER, type TEXT , count TEXT, duration TEXT,img TEXT)');
  } ,
   );

   getAllStudents2();
}

Future<void> addStudent2(StudentModel2 value) async{
//  final studentDB = await Hive.openBox<StudentModel>('students_db');
//   await studentDB.add(value);
 await _db.rawInsert('INSERT INTO objects022 (name,price,type,count,duration,img) VALUES (?,?,?,?,?,?)',[value.name,value.price,value.type,value.count,value.duration,value.image]);


getAllStudents2();
  // StudnetModelNotifier.value.add(value);
  // StudnetModelNotifier.notifyListeners();

}

Future<void> getAllStudents2() async{
  // final studentDB = await Hive.openBox<StudentModel>('students_db');
  // StudnetModelNotifier.value.clear();
  
 final _values = await _db.rawQuery('SELECT * FROM objects022',);
 print(_values);
 print ('hitable2');
StudnetModelNotifier2.value.clear();

_values.forEach((map1) {
  final objects1= StudentModel2.fromMap(map1);
 // print(objects1);
  StudnetModelNotifier2.value.add(objects1);


  StudnetModelNotifier2.notifyListeners();
 });

//  StudnetModelNotifier.value.addAll(_values);  //(studentDB.values);
}
//int

Future<void> deleteStudent2(String name) async{
  print(name);
 // id='';
//await deleteDatabase('objects0.db');
  await _db.rawDelete('DELETE FROM objects022 WHERE name = ? ',['$name']);
  getAllStudents2();
}

Future<void > updateDb2(String price,String count,String valid,String name) async{
  print('updating');
   await _db.rawUpdate('UPDATE objects022 SET price = ?, count = ?,duration = ?  where name = ?',[price,count,valid,name]);

   getAllStudents2();
}

Future<void >SearchDb2(String col,String name) async{
  print(name);
  if(col=='name')
  { 
     final _value =await _db.rawQuery('Select * from objects022 where name like ?',['%$name%']);

  print(_value);
  StudnetModelNotifier2.value.clear();

_value.forEach((map1) {
  final objects1= StudentModel2.fromMap(map1);
 // print(objects1);
  StudnetModelNotifier2.value.add(objects1);


  StudnetModelNotifier2.notifyListeners();
 });
  }
  else{
     final _value =await _db.rawQuery('Select * from objects022 where type like ?',['%$name%']);
    print(_value);

    StudnetModelNotifier2.value.clear();

_value.forEach((map1) {
  final objects1= StudentModel2.fromMap(map1);
  //print(objects1);
  StudnetModelNotifier2.value.add(objects1);


  StudnetModelNotifier2.notifyListeners();
 });
  }

}

Future<void> SearchDbA2(String type,String name) async{
  print('$type,$name');
  final _values = await _db.rawQuery('Select * from objects022 where name like ? and type = ?',['%$name%','$type']);
  print(_values);

  StudnetModelNotifier2.value.clear();

_values.forEach((map1) {
  final objects1= StudentModel2.fromMap(map1);
  //print(objects1);
  StudnetModelNotifier2.value.add(objects1);


  StudnetModelNotifier2.notifyListeners();
 });
}

Future<void>sort2(String srt,String obj) async{
  print (srt);
  if(srt =='ASC'){
  final _values = await _db.rawQuery('Select * from objects022 ORDER BY $obj ASC');
  print(_values);
  StudnetModelNotifier2.value.clear();

_values.forEach((map1) {
  final objects1= StudentModel2.fromMap(map1);
  //print(objects1);
  StudnetModelNotifier2.value.add(objects1);


  StudnetModelNotifier2.notifyListeners();
 });
  }
  else if(srt == 'DESC'){
  final _values = await _db.rawQuery('Select * from objects022 ORDER BY $obj DESC');
  print(_values) ; 

  StudnetModelNotifier2.value.clear();

_values.forEach((map1) {
  final objects1= StudentModel2.fromMap(map1);
 // print(objects1);
  StudnetModelNotifier2.value.add(objects1);


  StudnetModelNotifier2.notifyListeners();
 });
  }
 // getAllStudents2();
}
// Future<void> alter() async{
//   final val = await _db.rawUpdate('ALTER TABLE objects02 ALTER COLUMN price INTEGER');
// }

Future<void> ItemDetails2(String name) async{
  // var table;
  print('$name');
  final _values = await _db.rawQuery('Select * from objects022 where name like ? ',['$name',]);
  // table = _values;

  print(_values);
 // return table;
  //return ItemDetails();

   StudnetModelNotifier2.value.clear();

_values.forEach((map) {
  final objects1= StudentModel2.fromMap(map);
  print(objects1.name);
   StudnetModelNotifier2.value.add(objects1);

    //;
   StudnetModelNotifier2.notifyListeners();
    });
    //getAllStudents2();
}

Future<void > updateDb2C(String count,String name) async{
  if(count == '0'){
    await _db.rawDelete('DELETE FROM objects022 WHERE name = ?',[name]);
  }else{
    
   await _db.rawUpdate('UPDATE objects022 SET count = ? where name = ?',[count,name]);
  }
  print('updating count');

   getAllStudents2();
}