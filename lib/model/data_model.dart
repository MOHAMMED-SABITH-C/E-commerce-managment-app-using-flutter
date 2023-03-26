


import 'dart:math';

class StudentModel{
 // int? id;
  final String name;

 final int price;
 final String type;
  final String count;
  final String duration;
 final String image;


  //StudentModel({required this.name,required this.age,this.id}); this.id,
StudentModel({ required this.name,required this.price,required this.type,required this.count,required this.duration,required this.image});

  static StudentModel fromMap(Map<String, Object?> map){
  //  final id = map['id'] as int ;
    final name = map['name'] as String;
   final price = map['price'] as int;
    final type = map['type'] as String;
    final count = map['count'] as String;
    final duration = map['duration'] as String;
    final image = map['imag'] as String;
    //SentToTable(name,price,count);
   // return StudentModel(id: id ,name: name, age: age, );
   return StudentModel(name: name, price: price,type: type, count: count, duration: duration,image: image);
  }
}

class StudentModel1S{
 // int? id;
  final String name;

 final String price;
 final String type;
  final String count;
 final String image;
  final String duration;
 //final int age;


  //StudentModel({required this.name,required this.age,this.id}); this.id,
StudentModel1S({ required this.name,required this.price,required this.type,required this.count,required this.duration,required this.image});

  static StudentModel1S fromMap(Map<String, Object?> map){
  //  final id = map['id'] as int ;
    final name = map['name'] as String;
    //final age = map['age'] as String;
   final price = map['price'] as int;
    final type = map['type'] as String;
    final count = map['count'] as String;
    final duration = map['duration'] as String;
    final image = map['imag'] as String;

    //SentToTable(name,price,count);
   // return StudentModel(id: id ,name: name, age: age, );
   return StudentModel1S(name: name, price: (price).toString(),type: type, count: count, duration: duration,image: image);
  }
}

class StudentModel2{
 // int? id;
  final String name;

 final String price;
 final String type;
  final String count;
  final String duration;
 final String image;


  //StudentModel({required this.name,required this.age,this.id}); this.id,
StudentModel2({ required this.name,required this.price,required this.type,required this.count,required this.duration,required this.image});

  static StudentModel2 fromMap(Map<String, Object?> map){
  //  final id = map['id'] as int ;
    final name = map['name'] as String;
   final price = map['price'] as int;// int;
    final type = map['type'] as String;
    final count = map['count'] as String;
    final duration = map['duration'] as String;
    final image = map['img'] as String; 
    //SentToTable(name,price,count);
   // return StudentModel(id: id ,name: name, age: age, );
   return StudentModel2(name: name, price: price.toString(),type: type, count: count, duration: duration,image: image);
  }
}

class StudentModel3{
 // int? id;
  final String name;

 final String price;
 final String type;
  final String count;
  final String duration;
 final String image;


  //StudentModel({required this.name,required this.age,this.id}); this.id,
StudentModel3({ required this.name,required this.price,required this.type,required this.count,required this.duration,required this.image});

  static StudentModel3 fromMap(Map<String, Object?> map){
  //  final id = map['id'] as int ;
    final name = map['name'] as String;
   final price = map['price'] as int;
    final type = map['type'] as String;
    final count = map['count'] as String;
    final duration = map['duration'] as String;
    final image = map['img'] as String;
    //SentToTable(name,price,count);
   // return StudentModel(id: id ,name: name, age: age, );
   return StudentModel3(name: name, price: price.toString(),type: type, count: count, duration: duration,image: image);
  }
}

class StudentModel4{
 // int? id;
  final String name;

  final String size;
 final String price;
 final String type;
  final String count;
  final String gender;


  //StudentModel({required this.name,required this.age,this.id}); this.id,
StudentModel4({ required this.name,required this.size,required this.price,required this.type,required this.count,required this.gender,});

  static StudentModel4 fromMap(Map<String, Object?> map){
  //  final id = map['id'] as int ;
    final name = map['name'] as String;
    final size = map['size'] as String;
   final price = map['price'] as String;
    final type = map['type'] as String;
    final count = map['count'] as String;
    final gender = map['sex'] as String;
    //SentToTable(name,price,count);
   // return StudentModel(id: id ,name: name, age: age, );
   return StudentModel4(name: name,size:size, price: price,type: type, count: count, gender: gender);
  }
}


// class UserModel{
//  // int? id;
//   final String name;

//   final String age;
//  //final String price;
//  final String phone;
//   final String email;
// //  final String duration;


//   //StudentModel({required this.name,required this.age,this.id}); this.id,
// UserModel({ required this.name,required this.age,required this.phone,required this.email});

//   static UserModel fromMap(Map<String, Object?> map){
//   //  final id = map['id'] as int ;
//     final name = map['name'] as String;
//     final age = map['age'] as String;
//    final phone = map['phone'] as String;
//    // final type = map['type'] as String;
//     final email = map['email'] as String;
//     //final duration = map['duration'] as String;
//     //SentToTable(name,price,count);
//    // return StudentModel(id: id ,name: name, age: age, );
//    return UserModel(name: name, age: age,phone: phone, email: email,);
//   }
// }

class UserModel{
 // int? id;
  late String name;

  late String age;
 //final String price;
 late String phone;
   late String email;
//  final String duration;


  //StudentModel({required this.name,required this.age,this.id}); this.id,
UserModel({ required this.name,required this.age,required this.phone,required this.email});

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      'name' : name,
      'age' : age,
      'phone':phone,
      'email':email
    };
    return map;
  }

   UserModel.fromMap(Map<String, dynamic> map){
  //  final id = map['id'] as int ;
     name = map['name'];// as String;
     age = map['age'];// as String;
    phone = map['phone'];// as String;
   // final type = map['type'] as String;
     email = map['email'];// as String;
    //final duration = map['duration'] as String;
    //SentToTable(name,price,count);
   // return StudentModel(id: id ,name: name, age: age, );
  // return UserModel(name: name, age: age,phone: phone, email: email,);
  }
}
  class CartModel{
 // int? id;
 final String ogPrice;
 final String table;
 final String lim;
 final String price;
  final String count;
  final String objName;
 final String phone;
 final String image;


  //StudentModel({required this.name,required this.age,this.id}); this.id,
CartModel({required this.table, required this.price,required this.image,required this.ogPrice,required this.lim, required this.count,required this.objName,required this.phone});

  static CartModel fromMap(Map<String, Object?> map){
  //  final id = map['id'] as int ;
    final prices = map['price'] as String;
   final ogPrice = map['ogPrice'] as String;
   final lim = map['lim'] as String;
    final count = map['count'] as String;
    final objN = map['objN'] as String;
   final phone = map['phone'] as String;
   final image = map['img'] as String;
   final table = map['tableName'] as String;
    //SentToTable(name,price,count);
   // return StudentModel(id: id ,name: name, age: age, );
   return CartModel( table:table,price: prices,image: image,ogPrice: ogPrice,lim: lim,count: count,objName: objN,phone: phone,);
  }
}