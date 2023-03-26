import 'package:flutter/cupertino.dart';
//import 'package:flutter_application_2/seconddb/db_functions2.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/data_model.dart';

ValueNotifier<List<StudentModel>> StudnetModelNotifier = ValueNotifier([]);
ValueNotifier<List<StudentModel1S>> StudnetModelNotifier1S = ValueNotifier([]);


late Database _db;



Future<void > InitilizeDataBase1() async{
 //_db = await openDatabase('student.db',      //id INTEGER ,
  // final dbpath = await sql.getDatabasePath();
  // return sql.openDatabase(path.join(dbpath,'objects0.db'),onCreate: (db,version) => _createDb(db),version: 1)
   _db =await openDatabase('objects01.db',
  version: 1,
  onCreate:(Database db, int version) async{
    //Batch batch = db.batch();
    ///batch
    db.execute('CREATE TABLE objects01 ( name TEXT PRIMARY KEY , price INTEGER , type TEXT , count TEXT, duration TEXT,imag TEXT)');
   // batch.execute('CREATE TABLE objects02 ( name TEXT PRIMARY KEY , price TEXT , type TEXT , count TEXT, duration TEXT');
  // db.execute('CREATE TABLE objects02 ( name TEXT PRIMARY KEY , price TEXT , type TEXT , count TEXT, duration TEXT)');
  } ,
   );
   getAllStudents();
}

// Future<void > InitilizeDataBase3() async{
//  //_db = await openDatabase('student.db',      //id INTEGER ,
//   // final dbpath = await sql.getDatabasePath();
//   // return sql.openDatabase(path.join(dbpath,'objects0.db'),onCreate: (db,version) => _createDb(db),version: 1)
//    _db3 =await openDatabase('objects03.db',
//   version: 1,
//   onCreate:(Database db, int version) async{
//     //Batch batch = db.batch();
//     ///batch
//     db.execute('CREATE TABLE objects03 ( name TEXT PRIMARY KEY , price TEXT , type TEXT , count TEXT, duration TEXT)');
//    // batch.execute('CREATE TABLE objects02 ( name TEXT PRIMARY KEY , price TEXT , type TEXT , count TEXT, duration TEXT');
//   // db.execute('CREATE TABLE objects02 ( name TEXT PRIMARY KEY , price TEXT , type TEXT , count TEXT, duration TEXT)');
//   } ,
//    );
//    getAllStudents3();
// }

Future<void> addStudent(StudentModel value) async{
//  final studentDB = await Hive.openBox<StudentModel>('students_db');
//   await studentDB.add(value);
////if(type == 'Electronic Devices'){
 await _db.rawInsert('INSERT INTO objects01 (name,price,type,count,duration,imag) VALUES (?,?,?,?,?,?)',[value.name,value.price,value.type,value.count,value.duration,value.image]);

getAllStudents();
//}else if(type == 'Fruits')
//{
//   print('Fruits');
//   await _db3.rawInsert('INSERT INTO objects03 (name,price,type,count,duration) VALUES (?,?,?,?,?)',[value.name,value.price,value.type,value.count,value.duration]);

// getAllStudents3();
// }

  // StudnetModelNotifier.value.add(value);
  // StudnetModelNotifier.notifyListeners();

}

// Future<void> getAllStudents3() async{
//   // final studentDB = await Hive.openBox<StudentModel>('students_db');
//   // StudnetModelNotifier.value.clear();
  
//  final _values = await _db3.rawQuery('SELECT * FROM objects03',);
//  print(_values);
// StudnetModelNotifier3.value.clear();

// _values.forEach((map) {
//   final objects= StudentModel.fromMap(map);
//   StudnetModelNotifier3.value.add(objects);

//   StudnetModelNotifier3.notifyListeners();
//  });

// //  StudnetModelNotifier.value.addAll(_values);  //(studentDB.values);
// }

Future<void> getAllStudents() async{
  // final studentDB = await Hive.openBox<StudentModel>('students_db');
  // StudnetModelNotifier.value.clear();
  
 final _values = await _db.rawQuery('SELECT * FROM objects01',);
 print(_values);
StudnetModelNotifier.value.clear();

_values.forEach((map) {
  final objects= StudentModel.fromMap(map);
  StudnetModelNotifier.value.add(objects);

  StudnetModelNotifier.notifyListeners();
 });
 StudnetModelNotifier1S.value.clear();

_values.forEach((map) {
  final objects= StudentModel1S.fromMap(map);
  StudnetModelNotifier1S.value.add(objects);

  StudnetModelNotifier1S.notifyListeners();
 });


//  StudnetModelNotifier.value.addAll(_values);  //(studentDB.values);
}
//int

Future<void> deleteStudent(String name) async{
  print(name);
 // id='';
//await deleteDatabase('objects0.db');
  await _db.rawDelete('DELETE FROM objects01 WHERE name=?',[name]);
  getAllStudents();
}

Future<void > updateDb(String price,String count,String duration,String name) async{
  print('updating');
   await _db.rawUpdate('UPDATE objects01 SET price = ?, count = ?,duration = ? where name = ?',[price,count,duration,name]);

   getAllStudents();
}

Future<void >SearchDb(String col,String name) async{
  print(name);
  if(col=='name')
  { 
     final _value =await _db.rawQuery('Select * from objects01 where name like ?',['%$name%']);

  print(_value);
  StudnetModelNotifier1S.value.clear();

_value.forEach((map1) {
  final objects= StudentModel1S.fromMap(map1);
 // print(objects);
  StudnetModelNotifier1S.value.add(objects);


  StudnetModelNotifier1S.notifyListeners();
 });
  }
  else{
     final _value =await _db.rawQuery('Select * from objects01 where type like ?',['%$name%']);
    print(_value);
    StudnetModelNotifier1S.value.clear();

_value.forEach((map) {
  final objects1= StudentModel1S.fromMap(map);
  //print(objects1);
  StudnetModelNotifier1S.value.add(objects1);


  StudnetModelNotifier1S.notifyListeners();
    });
  }

}

Future<void> SearchDbA(String type,String name) async{
  print('$type,$name');
  final _values = await _db.rawQuery('Select * from objects01 where name like ? and type = ?',['%$name%','$type']);
  print(_values);

  StudnetModelNotifier1S.value.clear();

_values.forEach((map) {
  final objects1= StudentModel1S.fromMap(map);
  //print(objects1);
  StudnetModelNotifier1S.value.add(objects1);


  StudnetModelNotifier1S.notifyListeners();
    });
}

Future<void>sort(String srt,String obj) async{
  obj='price';
  print (srt);
  //final _values;
  if(srt =='ASC'){
    // if(obj == 'name')  
    //   String name='name';
    // if(obj == 'price')
    //   String name = 'price';
  final _values = await _db.rawQuery('Select * from objects01 ORDER BY $obj ASC');
  print(_values);
  StudnetModelNotifier1S.value.clear();

_values.forEach((map) {
  final objects1= StudentModel1S.fromMap(map);
 //print(objects1);
  StudnetModelNotifier1S.value.add(objects1);


  StudnetModelNotifier1S.notifyListeners();
    });
  }
  else if(srt == 'DESC'){
  final _values = await _db.rawQuery('Select * from objects01 ORDER BY $obj DESC');
  print(_values) ; 
  StudnetModelNotifier1S.value.clear();

_values.forEach((map) {
  final objects1= StudentModel1S.fromMap(map);
 // print(objects1);
  StudnetModelNotifier1S.value.add(objects1);


  StudnetModelNotifier1S.notifyListeners();
    });
  }

 // getAllStudents2();
}


//display product 0details

Future<void> ItemDetails(String name) async{
 //var table;
  print('$name');
  final _values = await _db.rawQuery('Select * from objects01 where name like ? ',['$name',]);
 // table = _values;

 // print(table);
 // return table;
  //return ItemDetails();

   StudnetModelNotifier1S.value.clear();

//table.
_values.forEach((map) {
  final objects1= StudentModel1S.fromMap(map);
 // print(objects1);
   StudnetModelNotifier1S.value.add(objects1);

    //;
   StudnetModelNotifier1S.notifyListeners();
    });
    
}

Future<void > updateDb1C(String count,String name) async{
   if(count == '0'){
    await _db.rawDelete('DELETE FROM objects01 WHERE name = ?',[name]);
  }else{
    
   await _db.rawUpdate('UPDATE objects01 SET count = ? where name = ?',[count,name]);
  }
  print('updating count');
   getAllStudents();
}