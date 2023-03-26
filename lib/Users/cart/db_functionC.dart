



import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../../../model/data_model.dart';

ValueNotifier<List<CartModel>> CartModelNotifier1 = ValueNotifier([]);
//ValueNotifier<List<StudentModel2>> StudnetModelNotifier2 = ValueNotifier([]);

late Database _db;

Future<void > InitilizeDataBaseUserC() async{
// _db = await openDatabase('student.db',      //id INTEGER ,
  _db =await openDatabase('cart11.db',
  version: 1,
  onCreate:(Database db, int version) async{
    await db.execute('CREATE TABLE cart11 ( price TEXT,ogPrice TEXT,lim TEXT,count TEXT,objN TEXT,phone TEXT,img TEXT,tableName TEXT,PRIMARY KEY (phone,objN))');
    //await db.execute('''CREATE TABLE IF NOT EXISTS cart(id INTEGER primary key ,userid TEXT,objects TEXT)''');
  } ,

   );

   getDetailsC();
}

Future<void> addToCart1(CartModel value) async{
//  final studentDB = await Hive.openBox<StudentModel>('students_db');
//   await studentDB.add(value);
//  await _db.rawInsert('INSERT INTO cart0 (price,count,objN,phone) VALUES (?,?,?,?)',[value.price,value.count,value.objName,value.phone]);

 await _db.rawInsert('INSERT INTO cart11 (price,ogPrice,lim,count,objN,phone,img,tableName) VALUES (?,?,?,?,?,?,?,?)',[value.price,value.ogPrice,value.lim,value.count,value.objName,value.phone,value.image,value.table]);


// getDetailsC();
  // StudnetModelNotifier.value.add(value);
  // StudnetModelNotifier.notifyListeners();

}


Future<void> getDetailsC() async{
  // final studentDB = await Hive.openBox<StudentModel>('students_db');
  // StudnetModelNotifier.value.clear();
  
 final _values = await _db.rawQuery('SELECT * FROM cart11');
 print(_values);
 print ('hitable2');
CartModelNotifier1.value.clear();

_values.forEach((map1) {
  final objects1= CartModel.fromMap(map1);
 // print(objects1);
  CartModelNotifier1.value.add(objects1);


  CartModelNotifier1.notifyListeners();
 });
}

Future<void> SearchUserC(String phone) async{
  print('$phone');
  final _values = await _db.rawQuery('Select * from cart11 where phone like ? ',['$phone']);
  print(_values);

  CartModelNotifier1.value.clear();

_values.forEach((map1) {
  final objects1= CartModel.fromMap(map1);
  //print(objects1);
  CartModelNotifier1.value.add(objects1);


  CartModelNotifier1.notifyListeners();
 });
}

Future<void> deleteCart1(String id,String phone) async{
  print(id);
 // id='';
//await deleteDatabase('objects0.db');
  await _db.rawDelete('DELETE FROM cart11 WHERE objN=? and phone =?',[id,phone]);
  // getDetailsC();
}

Future<void > updateDbC(String count,String limit,String name,String price,String phone,String us)async{
   if(count == '0' && us !='buy'){
    await _db.rawDelete('DELETE FROM cart11 WHERE objN = ? and phone = ?',[name,phone]);
  }else if(us != 'buy'){
    
   await _db.rawUpdate('UPDATE cart11 SET count = ?, price = ? where objN = ? and phone = ?',[count,price,name,phone]);
  }
  if(us == 'buy'){
   await _db.rawUpdate('UPDATE cart11 SET lim = ? where objN = ? and phone = ?',[limit,name,phone]);

  }
  print('updating count');
  
  //  getDetailsC();
}

Future<void> getcart(String phone) async{
  // final studentDB = await Hive.openBox<StudentModel>('students_db');
  // StudnetModelNotifier.value.clear();
  
 final _values = await _db.rawQuery('Select * from cart11 where phone like ? ',['$phone']);
 print(_values);
 print ('hitable2');
CartModelNotifier1.value.clear();

_values.forEach((map1) {
  final objects1= CartModel.fromMap(map1);
 // print(objects1);
  CartModelNotifier1.value.add(objects1);


  CartModelNotifier1.notifyListeners();
 });
}
