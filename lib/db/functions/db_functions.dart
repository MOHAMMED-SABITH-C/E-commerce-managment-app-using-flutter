import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/data_model.dart';

ValueNotifier<List<StudentModel>> StudnetModelNotifier = ValueNotifier([]);
ValueNotifier<List<StudentModel1S>> StudnetModelNotifier1S = ValueNotifier([]);


late Database _db;



Future<void > InitilizeDataBase1() async{
 
   _db =await openDatabase('objects01.db',
  version: 1,
  onCreate:(Database db, int version) async{
    db.execute('CREATE TABLE objects01 ( name TEXT PRIMARY KEY , price INTEGER , type TEXT , count TEXT, duration TEXT,imag TEXT)');
  } ,
   );
   getAllStudents();
}



Future<void> addStudent(StudentModel value) async{
 await _db.rawInsert('INSERT INTO objects01 (name,price,type,count,duration,imag) VALUES (?,?,?,?,?,?)',[value.name,value.price,value.type,value.count,value.duration,value.image]);

getAllStudents();


}



Future<void> getAllStudents() async{
  
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


}

Future<void> deleteStudent(String name) async{
  print(name);
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
  if(srt =='ASC'){
   
  final _values = await _db.rawQuery('Select * from objects01 ORDER BY $obj ASC');
  print(_values);
  StudnetModelNotifier1S.value.clear();

_values.forEach((map) {
  final objects1= StudentModel1S.fromMap(map);
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
  StudnetModelNotifier1S.value.add(objects1);


  StudnetModelNotifier1S.notifyListeners();
    });
  }

}



Future<void> ItemDetails(String name) async{
  print('$name');
  final _values = await _db.rawQuery('Select * from objects01 where name like ? ',['$name',]);

   StudnetModelNotifier1S.value.clear();
_values.forEach((map) {
  final objects1= StudentModel1S.fromMap(map);
   StudnetModelNotifier1S.value.add(objects1);

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
