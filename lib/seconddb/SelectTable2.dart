import 'package:flutter_application_2/model/data_model.dart';
// import 'package:sqflite/sqflite.dart';

// Future <List<StudentModel>> Display() async{
//   final Database db = await database;
//}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/3rddb/db_fundtion3.dart';
import 'package:flutter_application_2/Displaydb.dart';
import 'package:flutter_application_2/Users/RegisterU.dart';
import 'package:flutter_application_2/Users/loginUser.dart';
import 'package:flutter_application_2/buttenNavig.dart';
import 'package:flutter_application_2/list.dart';
import 'package:flutter_application_2/seconddb/db_functions2.dart';

class SelectDbD2 extends StatelessWidget {
  SelectDbD2({super.key,required this.table});

late String table;
  final _list = [
    'Electronic Devices',
    'vegitables',
    'Fruits',
   //'Shirts',
    'USER'
  ];

  @override
  Widget build(BuildContext context) {
    //getAllStudents3();
    return
      Container(
     //Scaffold(
     // appBar: AppBar(title: Text('MOHAMMED SABITH C')),
    //  body: SafeArea(
     // body: 
        child: 
        Center(
            child: Padding(
          //padding: EdgeInsets.only(top :20.2),
          padding: EdgeInsets.all(10),

          child: Column(
            children: [
          //  Expanded(
             // child: 
              DropdownButtonFormField(
                hint: Text('Select Table'),
                items: _list.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (values) {

                  print(values);
                  if (values == 'Electronic Devices') {
                    //  print(values);
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return BottomNavigation(table: '$values');
                    }));
                  } else if (values == 'vegitables') {
                    //  print(values);
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return BottomNavigation(
                        table: '$values',
                      );
                    }));
                  } else if(values == 'Fruits'){
                    print(values);
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return BottomNavigation(
                        table: '$values',
                      );
                    }));
                  }
                  // else if( values == 'Shirts'){
                  //   print(values);
                  //   Navigator.of(context)
                  //       .pushReplacement(MaterialPageRoute(builder: (context) {
                  //     return BottomNavigation(
                  //       table: '$values',
                  //     );
                  //   }));
                  // }
                  else if( values == 'USER'){
                    print(values);
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return Login(type: '2nd',phone: '',name: '',);//list: null,);
                        
                      
                    }));
                  }
                },
              ),
           // ),

            SizedBox(height: 80,),
            Expanded(
              //flex: 2,
              child: listcreations(type: '$table'),)
              
          ]),
        )
            //],
            ),
      //),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../model/data_model.dart';

// class SelectTable2 extends StatelessWidget {
//    SelectTable2({super.key});

//   int index =0;




//   @override
//   Widget build(BuildContext context,) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(padding: EdgeInsets.all(10),
//           child:getDynamicTable(),)
//         ]),
//        // ElevatedButton(child: Text('hi'),onPressed: (){},)
//     );
    
//   }

//   Table getDynamicTable() {
//     List<TableRow>rows = [];
//   List<StudentModel> objects ;
//   if(objects!=null){
//     for(int i=0;i<this.objects.length,++i){
//       final data = objects.
//     rows.add(TableRow(children: [
//       Text(''+objects.name),
//       Text(''+objects.price),
//       Text('id566'),
      
//     ]));
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'main.dart';
// // import 'package:flutter_session_manager/flutter_session_manager.dart';
// // class newPage extends StatelessWidget {
// // const newPage({Key? key}) : super(key: key);
// // @override
// // Widget build(BuildContext context) {
// // return MaterialApp(
// // title: 'Flutter Demo',
// // theme: ThemeData(
// // primarySwatch: Colors.green,
// // ),
// // home: const MyHomePage(title: 'Flutter Demo Page 2'),
// // );
// // }
// // }
// // class MyHomePage extends StatefulWidget {
// // const MyHomePage({Key? key, required this.title}) : super(key: key);
// // final String title;
// // @override
// // State<MyHomePage> createState() => _MyHomePageState();
// // }
// // class _MyHomePageState extends State<MyHomePage> {
// // int _counter = 0;
// // var sessionManager = SessionManager();
// // @override
// // void initState() {
// // super.initState();
// // setSessionValue();
// // }
// // setSessionValue()
// // async {
// // dynamic count = await SessionManager().get("count");
// // if(count!=null)
// // {
// // _counter=int.parse('$count');
// // _counter=_counter-1;
// // _incrementCounter();
// // }
// // }
// // Future<void> _incrementCounter() async {
// // setState(() {
// // _counter++;
// // });
// // await sessionManager.set("count", _counter);
// // }
// // @override
// // Widget build(BuildContext context) {
// // return Scaffold(
// // appBar: AppBar(
// // title: Text(widget.title),
// // ),
// // body: Center(
// // child: Column(
// // children: <Widget>[
// // const Text(
// // 'Second Page Count :',
// // ),
// // Text(
// // '$_counter',
// // style: Theme.of(context).textTheme.headline4,
// // ),
// // RaisedButton(
// // child: new Text('Jump To Previous Page'),
// // onPressed: () {
// // Navigator.push(
// // context,
// // MaterialPageRoute(builder: (context) => MyApp()),
// // );
// // },
// // )
// // ],
// // ),
// // ),
// // floatingActionButton: FloatingActionButton(
// // onPressed: _incrementCounter,
// // tooltip: 'Increment',
// // child: const Icon(Icons.add),
// // ), 
// // );
// // }
// // }


