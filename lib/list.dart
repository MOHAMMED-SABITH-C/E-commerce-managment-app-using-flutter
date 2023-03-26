//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/3rddb/db_fundtion3.dart';
import 'package:flutter_application_2/4rthdb/db_function4.dart';
import 'package:flutter_application_2/Users/fetchobj.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/model/data_model.dart';

import 'buttenNavig.dart';
import 'seconddb/db_functions2.dart';

class listcreation0 extends StatefulWidget {
   listcreation0({Key? key,required this.type}) : super(key: key);
final String type ;

 
// final _list = [
//     'Electronic Devices',
//     'vegitables',
//     'Fruits',
//     'Shirts',
// ];

@override
 State<listcreation0> createState() => type =='Electronic Devices'? _tableDisplay1():
 type == 'Vegitables'? _tableDisplay2():type =='Fruits'?_tableDisplay3():_tableDisplay2();
}

 class _tableDisplay1 extends State<listcreation0>{
     @override
   Widget build(BuildContext context) {

      getAllStudents();
    return Scaffold(
      // appBar: AppBar(title: const Text("Electronic Devices"),),
      body: SafeArea( 
         child: ValueListenableBuilder(
                        valueListenable: StudnetModelNotifier1S, 
                        builder: (BuildContext context, List<StudentModel1S> studentList, Widget? child){
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final data = studentList[index];
                             String image = data.image;
                             return ListTile(
                                title: Text(data.name),
                                subtitle: Text((data.price).toString()),
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    
                                    minWidth:44,
                                    minHeight: 44,
                                    maxHeight: 64,
                                    maxWidth: 64, ),
                                   child: Image.asset("$image"),
                                
                                  ),
                                //CircleAvatar(radius: 30,
                               // backgroundImage: AssetImage("$image"),
                              //  ),
                                hoverColor: Colors.red,
                                onTap: () {
                                  print(data.name+'hi');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context){
                                      return Buyobj(name:data.name,image:image,table: 'Electronic Devices',);
                                    })
                                  )
                                  .then((value){
                                  getAllStudents();    
                                    });
                               //   listcreation0(type: 'Electron Devices',);
                                },
                                // trailing: IconButton(onPressed:(){
                                  
                                //   if(data.name!=null)
                                //     deleteStudent(data.name);
                                // }, 
                                // icon:Icon(Icons.delete)
                                // ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(thickness: 5,);
                            },
                            itemCount: studentList.length,
                           // reverse: true,
                            );
                        }
                  ),
                  
      ),
      );
      
  }
 }

  class _tableDisplay2 extends State<listcreation0>{
     @override
   Widget build(BuildContext context) {
    getAllStudents2();
    //int index =0;
    return Scaffold(
      // appBar: AppBar(title:  Text('Vegitables'),),
      body: SafeArea( 
         child: ValueListenableBuilder(
                        valueListenable: StudnetModelNotifier2, 
                        builder: (BuildContext context, List<StudentModel2> studentList, Widget? child){
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final data = studentList[index];
                              String image = data.image;

                           //   late String image = data.image;
                              print(data.price);
                             return ListTile(
                                title: Text(data.name),
                                subtitle: Text((data.price).toString()),
                                // leading: CircleAvatar(radius: 30),
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    
                                    minWidth:44,
                                    minHeight: 44,
                                    maxHeight: 64,
                                    maxWidth: 64, ),
                                    child: Image.asset("$image"),
                                
                                  ),
                                hoverColor: Colors.red,
                                onTap:() {

                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context){
                                      return Buyobj(name:data.name,image: image,table: 'Vegitables',);
                                    })
                                  )
                                  .then((value){
                                  getAllStudents2();    
                                    });
                           //       listcreation0(type: 'Vegitables',);
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: studentList.length,
                           // reverse: true,
                            );
                        }
                  ),
                  
      ),
      );
      
  }
 }

  class _tableDisplay3 extends State<listcreation0>{
     @override
   Widget build(BuildContext context) {
getAllStudents3();
    return Scaffold(
      // appBar: AppBar(title: const Text("Fruits"),),
      body: SafeArea( 
         child: ValueListenableBuilder(
                        valueListenable: StudnetModelNotifier3, 
                        builder: (BuildContext context, List<StudentModel3> studentList, Widget? child){
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final data = studentList[index];
                              String image = data.image;

                             return ListTile(
                                title: Text(data.name),
                                subtitle: Text(data.price),
                                 leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    
                                    minWidth:44,
                                    minHeight: 44,
                                    maxHeight: 64,
                                    maxWidth: 64, ),
                                    child: Image.asset("$image"),
                                
                                  ),
                                // leading: CircleAvatar(radius: 30),
                              //  hoverColor: Colors.red,
                                 onTap:() {

                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context){
                                      return Buyobj(name:data.name,image: image,table: 'Fruits',);
                                    })
                                  )
                                  .then((value){
                                  getAllStudents3();    
                                    });

                                },
                              //   trailing: IconButton(onPressed:(){
                                  
                              //     if(data.name!=null)
                              //       deleteStudent(data.name);
                              //   }, 
                              //   icon:Icon(Icons.delete)
                              //   ),
                               );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(thickness: 5,);
                            },
                            itemCount: studentList.length,
                           // reverse: true,
                            );
                        }
                  ),
                  
      ),
      );
      
  }
 }

//   class _tableDisplay4 extends State<listcreation0>{
//      @override
//    Widget build(BuildContext context) {
// getAllStudents4();
//     return Scaffold(
//       appBar: AppBar(title: const Text("Shirts"),),
//       body: SafeArea( 
//          child: ValueListenableBuilder(
//                         valueListenable: StudnetModelNotifier4, 
//                         builder: (BuildContext context, List<StudentModel4> studentList, Widget? child){
//                           return ListView.separated(
//                             itemBuilder: (context, index) {
//                               final data = studentList[index];
//                               String image = data.image;

//                              return ListTile(
//                                 title: Text(data.name),
//                                 subtitle: Text(data.price),
//                                leading: ConstrainedBox(
//                                   constraints: BoxConstraints(
                                    
//                                     minWidth:44,
//                                     minHeight: 44,
//                                     maxHeight: 64,
//                                     maxWidth: 64, ),
//                                     child: Image.asset("$image"),
                                
//                                   ),
//                                 // leading: CircleAvatar(radius: 30),
//                                 hoverColor: Colors.red,
//                                  onTap:() {

//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(builder: (context){
//                                       return Buyobj(name:data.name,image: '',table: 'Shirts',);
//                                     })
//                                   );

//                                 },
//                                 // trailing: IconButton(onPressed:(){
                                  
//                                 //   if(data.name!=null)
//                                 //     deleteStudent(data.name);
//                                 // }, 
//                                 // icon:Icon(Icons.delete)
//                                 // ),
//                               );
//                             },
//                             separatorBuilder: (context, index) {
//                               return const Divider();
//                             },
//                             itemCount: studentList.length,
//                           //  reverse: true,
//                             );
//                         }
//                   ),
                  
//       ),
//       );
      
//   }
//   }
  