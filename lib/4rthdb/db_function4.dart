import 'package:flutter/cupertino.dart';
//import 'package:flutter_application_2/seconddb/db_functions2.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/data_model.dart';

ValueNotifier<List<StudentModel4>> StudnetModelNotifier4= ValueNotifier([]);
//ValueNotifier<List<StudentModel>> StudnetModelNotifier3 = ValueNotifier([]);


late Database _db;





Future<void > InitilizeDataBase4() async{
 //_db = await openDatabase('student.db',      //id INTEGER ,
  // final dbpath = await sql.getDatabasePath();
  // return sql.openDatabase(path.join(dbpath,'objects0.db'),onCreate: (db,version) => _createDb(db),version: 1)
   _db =await openDatabase('objects04.db',
  version: 1,
  onCreate:(Database db, int version) async{
    //Batch batch = db.batch();
    ///batch
    db.execute('CREATE TABLE objects04 ( name TEXT PRIMARY KEY ,size TEXT, price TEXT , type TEXT , count TEXT, sex TEXT)');
   // batch.execute('CREATE TABLE objects02 ( name TEXT PRIMARY KEY , price TEXT , type TEXT , count TEXT, duration TEXT');
  // db.execute('CREATE TABLE objects02 ( name TEXT PRIMARY KEY , price TEXT , type TEXT , count TEXT, duration TEXT)');
  } ,
   );
   getAllStudents4();
}

Future<void> addStudent4(StudentModel4 value) async{
//  final studentDB = await Hive.openBox<StudentModel>('students_db');
//   await studentDB.add(value);


  //print('Fruits');
  await _db.rawInsert('INSERT INTO objects04 (name,size,price,type,count,sex) VALUES (?,?,?,?,?,?)',[value.name,value.size,value.price,value.type,value.count,value.gender]);

getAllStudents4();
}

  // StudnetModelNotifier.value.add(value);
  // StudnetModelNotifier.notifyListeners();


Future<void> getAllStudents4() async{
  // final studentDB = await Hive.openBox<StudentModel>('students_db');
  // StudnetModelNotifier.value.clear();
  
 final _values = await _db.rawQuery('SELECT * FROM objects04',);
 print(_values);
StudnetModelNotifier4.value.clear();

_values.forEach((map) {
  final objects= StudentModel4.fromMap(map);
  StudnetModelNotifier4.value.add(objects);
 // print(objects);
  StudnetModelNotifier4.notifyListeners();
 });

//  StudnetModelNotifier.value.addAll(_values);  //(studentDB.values);
}


//int

Future<void> deleteStudent4(String name) async{
  print(name);
 // id='';
//await deleteDatabase('objects0.db');
  await _db.rawDelete('DELETE FROM objects04 WHERE name=?',[name]);
  getAllStudents4();
}

Future<void > updateDb4(String price,String count,String name) async{
  print('updating');
   await _db.rawUpdate('UPDATE objects03 SET price = ?, count = ? where name = ?',[price,count,name]);

   getAllStudents4();
}

Future<void >SearchDb4(String col,String name) async{
  print(name);
  if(col=='name')
  { 
     final _value =await _db.rawQuery('Select * from objects04 where name like ?',['%$name%']);

  print(_value);
  StudnetModelNotifier4.value.clear();

_value.forEach((map) {
  final objects= StudentModel4.fromMap(map);
  StudnetModelNotifier4.value.add(objects);
 // print(objects);
  StudnetModelNotifier4.notifyListeners();
 });
  }
  else if(col == 'type'){
     final _value =await _db.rawQuery('Select * from objects04 where type like ?',['%$name%']);
    print(_value);
    StudnetModelNotifier4.value.clear();

_value.forEach((map) {
  final objects= StudentModel4.fromMap(map);
  StudnetModelNotifier4.value.add(objects);
  //print(objects);
  StudnetModelNotifier4.notifyListeners();
 });
  }
  else if(col == 'Gender'){
    final _value =await _db.rawQuery('Select * from objects04 where sex like ?',['%$name%']);
    print(_value);
    StudnetModelNotifier4.value.clear();

_value.forEach((map) {
  final objects= StudentModel4.fromMap(map);
  StudnetModelNotifier4.value.add(objects);
  //print(objects);
  StudnetModelNotifier4.notifyListeners();
 });
  }
  else if(col == 'size'){
    final _value =await _db.rawQuery('Select * from objects04 where size like ?',['%$name%']);
    print(_value);
    StudnetModelNotifier4.value.clear();

_value.forEach((map) {
  final objects= StudentModel4.fromMap(map);
  StudnetModelNotifier4.value.add(objects);
  //print(objects);
  StudnetModelNotifier4.notifyListeners();
 });
  }

}

Future<void> SearchDbA4(String type,String name) async{
  print('$type,$name');
  final _values = await _db.rawQuery('Select * from objects04 where name like ? and type = ?',['%$name%','$type']);
  print(_values);
  StudnetModelNotifier4.value.clear();

_values.forEach((map) {
  final objects= StudentModel4.fromMap(map);
  StudnetModelNotifier4.value.add(objects);
 // print(objects);
  StudnetModelNotifier4.notifyListeners();
 });
}

Future<void>sort4(String srt,String obj) async{
  print (srt);
  if(srt =='ASC'){
    obj ='price';
    // if(obj == 'name')  
    //   String name='name';
    // if(obj == 'price')
    //   String name = 'price';
  final _values = await _db.rawQuery('Select * from objects04 ORDER BY $obj ASC');
  print(_values);
  StudnetModelNotifier4.value.clear();

_values.forEach((map) {
  final objects= StudentModel4.fromMap(map);
  StudnetModelNotifier4.value.add(objects);
 // print(objects);
  StudnetModelNotifier4.notifyListeners();
 });
  }
  else if(srt == 'DESC'){
    obj ='price';
  final _values = await _db.rawQuery('Select * from objects04 ORDER BY $obj DESC');
  print(_values) ; 

  StudnetModelNotifier4.value.clear();

_values.forEach((map) {
  final objects= StudentModel4.fromMap(map);
  StudnetModelNotifier4.value.add(objects);
 // print(objects);
  StudnetModelNotifier4.notifyListeners();
 });
  }
 // getAllStudents2();
}

Future<void> ItemDetails4(String name) async{
 late var table;
  print('$name');
  final _values = await _db.rawQuery('Select * from objects04 where name like ? ',['$name',]);
 // table = _values;

  print(_values);
 // return table;
  //return ItemDetails();

   StudnetModelNotifier4.value.clear();

//table
_values.forEach((map) {
  final objects1= StudentModel4.fromMap(map);
 // print(objects1);
   StudnetModelNotifier4.value.add(objects1);

    //;
   StudnetModelNotifier4.notifyListeners();
    });
    
    //getAllStudents4();
}

Future<void > updateDb4C(String count,String name) async{
   if(count == '0'){
    await _db.rawDelete('DELETE FROM objects04 WHERE name = ?',[name]);
  }else{
    
   await _db.rawUpdate('UPDATE objects04 SET count = ? where name = ?',[count,name]);
  }
  print('updating count');
   getAllStudents4();
}