import 'package:flutter_application_2/model/data_model.dart';


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
    return
      Container(
    
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
            ),
    );
  }
}




