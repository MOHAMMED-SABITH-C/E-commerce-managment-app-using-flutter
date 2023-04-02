import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/3rddb/db_fundtion3.dart';
import 'package:flutter_application_2/4rthdb/db_function4.dart';
import 'package:flutter_application_2/Displaydb.dart';
import 'package:flutter_application_2/Users/Buyobject.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/list.dart';
import 'package:flutter_application_2/model/data_model.dart';
import 'package:flutter_application_2/seconddb/db_functions2.dart';

class Buyobj extends StatefulWidget {
   Buyobj({super.key,required this.name,required this.image,required this.table});

late String image;
late String name='';
late String table='';

  @override
  State<Buyobj> createState() => table =='Electronic Devices'? _BuyobjState():
  table == 'Vegitables'?_BuyobjState2():table =='Fruits'?_BuyobjState3():table =='Shirts'?_BuyobjState():_BuyobjState();
}

class _BuyobjState extends State<Buyobj> {
 late int limit;

  @override
  Widget build(BuildContext context){
        getAllStudents();
        ItemDetails(widget.name);
      return 
           Container(
             child: ValueListenableBuilder(
                valueListenable: StudnetModelNotifier1S, 
                builder: (BuildContext context, List<StudentModel1S> studentList, Widget? child){
                        final  data = studentList[0];
        print(data.name+'hello');
        print(data.type);
                          limit =int.parse(data.count);
                      //    getAllStudents();
                      return  
                      Buyobject(name: data.name,image : widget.image, table:widget.table ,type:data.type,price: data.price,limit:limit,warranty:data.duration);
                }
             )
           );
  } 
}

  class _BuyobjState2 extends State<Buyobj> {
 // int _itemCount=1;
 late int limit;

 // var data;

 // int width=5;
  @override
  Widget build(BuildContext context){

        ItemDetails2(widget.name);
      return 
           Container(
             child: ValueListenableBuilder(
                valueListenable: StudnetModelNotifier2, 
                builder: (BuildContext context, List<StudentModel2> studentList, Widget? child){
                        final  data = studentList[0];
                          listcreation0(type: 'Vegitables');
        print(data.name);
                          limit =int.parse(data.count);
                      return  
                      Buyobject(name: data.name,image: widget.image, table: widget.table,type: data.type,price: (data.price).toString(),limit:limit,warranty:data.duration)
                      ;
                }
             )
           );
  } 
                        //  getAllStudents2();
  }

  class _BuyobjState3 extends State<Buyobj> {
 // int _itemCount=1;
 late int limit;

  //var data;

 // int width=5;
  @override
  Widget build(BuildContext context){

        ItemDetails3(widget.name);
      return 
           Container(
             child: ValueListenableBuilder(
                valueListenable: StudnetModelNotifier3, 
                builder: (BuildContext context, List<StudentModel3> studentList, Widget? child){
                        final  data = studentList[0];
        print(data.name+'hello');
        print(data.type);
                          limit =int.parse(data.count);
                      return  
                      Buyobject(name: data.name,image: widget.image,table:widget.table ,type:data.type,price: data.price,limit:limit,warranty:data.duration,);
                }
             )
           );
  } 
}
