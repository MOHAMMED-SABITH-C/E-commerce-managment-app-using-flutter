

 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Users/cart/db_functionC.dart';
import 'package:flutter_application_2/Users/db_functionU.dart';

import 'package:flutter_application_2/db/functions/db_functions.dart';


import '3rddb/db_fundtion3.dart';
import '4rthdb/db_function4.dart';
import 'editdb.dart';


 import 'buttenNavig.dart';
import 'seconddb/db_functions2.dart';


import 'log.dart';


 Future<void>main() async {
 WidgetsFlutterBinding.ensureInitialized();

 await InitilizeDataBaseUser1();
 await InitilizeDataBaseUserC();
 await InitilizeDataBase2();
 await InitilizeDataBase1();
await InitilizeDataBase3();

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( theme:ThemeData(primarySwatch: Colors.blue,),
    
  home: Logi(),
  
       );
  }
}
