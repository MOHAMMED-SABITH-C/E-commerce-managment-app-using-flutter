import 'package:flutter/cupertino.dart';
//import 'package:flutter_application_2/seconddb/db_functions2.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/data_model.dart';

ValueNotifier<List<StudentModel3>> StudnetModelNotifier3= ValueNotifier([]);
//ValueNotifier<List<StudentModel>> StudnetModelNotifier3 = ValueNotifier([]);


late Database _db;





Future<void > InitilizeDataBase3() async{
 //_db = await openDatabase('student.db',      //id INTEGER ,
  // final dbpath = await sql.getDatabasePath();
  // return sql.openDatabase(path.join(dbpath,'objects0.db'),onCreate: (db,version) => _createDb(db),version: 1)
   _db =await openDatabase('objects033.db',
  version: 1,
  onCreate:(Database db, int version) async{
    //Batch batch = db.batch();
    ///batch
    db.execute('CREATE TABLE objects033 ( name TEXT PRIMARY KEY , price INTEGER , type TEXT , count TEXT, duration TEXT,img TEXT)');
   // batch.execute('CREATE TABLE objects02 ( name TEXT PRIMARY KEY , price TEXT , type TEXT , count TEXT, duration TEXT');
  // db.execute('CREATE TABLE objects02 ( name TEXT PRIMARY KEY , price TEXT , type TEXT , count TEXT, duration TEXT)');
  } ,
   );
   getAllStudents3();
}

Future<void> addStudent3(StudentModel3 value) async{
//  final studentDB = await Hive.openBox<StudentModel>('students_db');
//   await studentDB.add(value);


  print('Fruits');
  await _db.rawInsert('INSERT INTO objects033 (name,price,type,count,duration,img) VALUES (?,?,?,?,?,?)',[value.name,value.price,value.type,value.count,value.duration,value.image]);

getAllStudents3();
}

  // StudnetModelNotifier.value.add(value);
  // StudnetModelNotifier.notifyListeners();


Future<void> getAllStudents3() async{
  // final studentDB = await Hive.openBox<StudentModel>('students_db');
  // StudnetModelNotifier.value.clear();
  
 final _values = await _db.rawQuery('SELECT * FROM objects033',);
 print(_values);
StudnetModelNotifier3.value.clear();

_values.forEach((map) {
  final objects= StudentModel3.fromMap(map);
  StudnetModelNotifier3.value.add(objects);
 // print(objects);
  StudnetModelNotifier3.notifyListeners();
 });

//  StudnetModelNotifier.value.addAll(_values);  //(studentDB.values);
}


//int

Future<void> deleteStudent3(String name) async{
  print(name);
 // id='';
//await deleteDatabase('objects0.db');
  await _db.rawDelete('DELETE FROM objects033 WHERE name=?',[name]);
  getAllStudents3();
}

Future<void > updateDb3(String price,String count,String valid,String name) async{
  print('updating');
   await _db.rawUpdate('UPDATE objects033 SET price = ?, count = ?,duration = ?  where name = ?',[price,count,valid,name]);

   getAllStudents3();
}

Future<void >SearchDb3(String col,String name) async{
  print(name);
  if(col=='name')
  { 
     final _value =await _db.rawQuery('Select * from objects033 where name like ?',['%$name%']);

  print(_value);
  StudnetModelNotifier3.value.clear();

_value.forEach((map) {
  final objects= StudentModel3.fromMap(map);
  StudnetModelNotifier3.value.add(objects);
 // print(objects);
  StudnetModelNotifier3.notifyListeners();
 });
  }
  else{
     final _value =await _db.rawQuery('Select * from objects033 where type like ?',['%$name%']);
    print(_value);
    StudnetModelNotifier3.value.clear();

_value.forEach((map) {
  final objects= StudentModel3.fromMap(map);
  StudnetModelNotifier3.value.add(objects);
  //print(objects);
  StudnetModelNotifier3.notifyListeners();
 });
  }

}

Future<void> SearchDbA3(String type,String name) async{
  print('$type,$name');
  final _values = await _db.rawQuery('Select * from objects033 where name like ? and type = ?',['%$name%','$type']);
  print(_values);
  StudnetModelNotifier3.value.clear();

_values.forEach((map) {
  final objects= StudentModel3.fromMap(map);
  StudnetModelNotifier3.value.add(objects);
 // print(objects);
  StudnetModelNotifier3.notifyListeners();
 });
}

Future<void>sort3(String srt,String obj) async{
  print (srt);
  if(srt =='ASC'){
    obj ='price';
    // if(obj == 'name')  
    //   String name='name';
    // if(obj == 'price')
    //   String name = 'price';
  final _values = await _db.rawQuery('Select * from objects033 ORDER BY $obj ASC');
  print(_values);
  StudnetModelNotifier3.value.clear();

_values.forEach((map) {
  final objects= StudentModel3.fromMap(map);
  StudnetModelNotifier3.value.add(objects);
 // print(objects);
  StudnetModelNotifier3.notifyListeners();
 });
  }
  else if(srt == 'DESC'){
    obj ='price';
  final _values = await _db.rawQuery('Select * from objects033 ORDER BY $obj DESC');
  print(_values) ; 

  StudnetModelNotifier3.value.clear();

_values.forEach((map) {
  final objects= StudentModel3.fromMap(map);
  StudnetModelNotifier3.value.add(objects);
 // print(objects);
  StudnetModelNotifier3.notifyListeners();
 });
  }
 // getAllStudents2();
}

Future<void> ItemDetails3(String name) async{
 late var table;
  print('$name');
  final _values = await _db.rawQuery('Select * from objects033 where name like ? ',['$name',]);
 // table = _values;

  print(_values);
 // return table;
  //return ItemDetails();

   StudnetModelNotifier3.value.clear();

//table
_values.forEach((map) {
  final objects1= StudentModel3.fromMap(map);
 // print(objects1);
   StudnetModelNotifier3.value.add(objects1);

    //;
   StudnetModelNotifier3.notifyListeners();
    });
  //  getAllStudents3();
    
}

Future<void > updateDb3C(String count,String name) async{
   if(count == '0'){
    await _db.rawDelete('DELETE FROM objects033 WHERE name = ?',[name]);
  }else{
    
   await _db.rawUpdate('UPDATE objects033 SET count = ? where name = ?',[count,name]);
  }
  print('updating count');
   getAllStudents3();
}