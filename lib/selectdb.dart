//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter_application_2/list.dart';

class Selectdb extends StatelessWidget {
   Selectdb({super.key});


 late String name ;
  late String price ;
late String count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:SafeArea(
    //  body: Table(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
       // (
          child: Column(
           children: [
            Container(
              // SizedBox(height: 30,),
              // const Text('Select the data base',
              // style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20),
              // textAlign: TextAlign.center,),
              // const SizedBox(height: 50,),
        
             // DropdownMenuItem(child: ),
            ),
            Container(

          child:Table(
            defaultColumnWidth: FixedColumnWidth(120),
            border: TableBorder.all(
              color: Color.fromARGB(255, 55, 42, 42),
              width: 2,

              //style: BorderStyle.solid
            ),
          children:[
          TableRow(
           
              children: [
                               // Padding(
                 // padding: const EdgeInsets.all(8.0),
                  //child:
                   Column(children: [Text('col1',style: TextStyle(fontSize: 18),)],),
              //  ),
                Column(children: [Text('col2',style:TextStyle(fontSize:18),)],),
                Column(children: [Text('col3',style: TextStyle(fontSize: 18),)],),
                ],
             ),
              TableRow(
                  children:[
                    Column(children: [Text('$name')],),
                    Column(children: [Text('$price')],),
                    Column(children: [Text('$count')],),
                   // Column(children: [Text('data1')],),
                   ]
                   )
           ],
          ),
            )
            ],
          ),

        
              
        
        ),
      ),
      //)
    );
  }

Future<void > SentToTable(context) async{
  name =context.name;
  price = context.price;
  count = context.count;
}
}