// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_2/db/functions/db_functions.dart';

// class Buyobj extends StatefulWidget {
//    Buyobj({super.key,required this.name,required this.table});
// late String name ;
// late String table;

//   @override
//   State<Buyobj> createState() =>table == 'Electronic Devices'? _Buyobj1(name: name):_Buyobj1(name: name);
// }

// class _Buyobj1 extends State<Buyobj> {
//    _Buyobj1({required this.name,});
//   late String name ='';
  
//   var Item =ItemDetails('$name');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.name),actions: []),

//       body: Container(
//         //  child:Expanded(
//             child: Column(children: [
              
//           Expanded(child: Column(children: [
//             Text()
//           ]),)
//             ]),
//           //),
//           ),
      
//     );
//   }
// }

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

// ignore: must_be_immutable
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
 // int _itemCount=1;
 late int limit;

  //var data;

 // int width=5;
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
// class _BuyobjState4 extends State<Buyobj> {
//  // int _itemCount=1;
//  late int limit;

//   //var data;

//  // int width=5;
//   @override
//   Widget build(BuildContext context){

//         ItemDetails4(widget.name);
//       return 
//            Container(
//              child: ValueListenableBuilder(
//                 valueListenable: StudnetModelNotifier4, 
//                 builder: (BuildContext context, List<StudentModel4> studentList, Widget? child){
//                         final  data = studentList[0];
//         print(data.name+'hello');
//         print(data.type);
//                           limit =int.parse(data.count);
//                       return  
//                       Buyobject(name: data.name, table:widget.table ,type:data.type,price: data.price,limit:limit,warranty:data.duration,);
//                 }
//              )
//            );
//   } 
// }
                          //   body:Center(child: Column()),)

                     //     );

  //                         ),
  //          );
  //            // }
  //       );
  //                       }
  //                       else{
  //                         ItemDetails(widget.name);
  //          child: ValueListenableBuilder(
  //             valueListenable: StudnetModelNotifier2, 
  //             builder: (BuildContext context, List<StudentModel2> studentList, Widget? child){
  //                       data = studentList[0];
  //                       limit =int.parse(data.count);

  //                       return Expanded(
  //                         child: Buyobject(name: widget.name, table: widget.table,price: data.price,limit:limit,warranty:data.warranty,),
  //                       );
  //             }
  //       );
  //                       }
  //                       return Scaffold();

  // }
//}

// class _Details extends State<Buyobj>{

// @override
// Widget build(BuildContext context){
// //}       
// //_BuyobjState();                          //return ListView.separated(
//                             //itemBuilder: (context, index) {
//       return Scaffold(
//                               //Text('')
//       appBar: AppBar(title: const Text("Electronic Devices"),),
//                            //       print(data);
//       body: SafeArea( 
//                              // return //Center(
//                                 child:
//                                  Column(
//                                   children: [
//                                     SizedBox(height: 350,),
//                                    // Padding(
//                                      // padding: const EdgeInsets.only(left: 0),
//                                       //child: 
//                                       Column( 
//                                       children:[ 
//                                         Text(data.name,
//                                         style: TextStyle(fontSize: 55,color: Colors.black,fontWeight: FontWeight.bold),),
//                                       SizedBox(height: 8,),
//                                      Row(
//                                       mainAxisAlignment :MainAxisAlignment.spaceBetween,
//                                       children: [
//                                    //SizedBox(width: 60),
//                                       Flexible(

//                                         child: Padding(
//                                           padding: const EdgeInsets.only(left: 20),
//                                           child: Text((_itemCount*int.parse(data.price)).toString(),
//                                           style: TextStyle(
//                                             fontSize: 25,color: Color.fromARGB(100, 15, 0, 0),
//                                             fontWeight: FontWeight.bold),),
//                                         ),
//                                       ),
//                                   // SizedBox(width: 120),
//                                       Flexible(
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(right: 10),
//                                           child: Container(
                                            
//                                                                 margin: EdgeInsets.symmetric(horizontal: 3),
//                                                           width: 84,
//                                                           padding: EdgeInsets.all(3),
//                                                           decoration: BoxDecoration(
                                                            
//                                                               borderRadius: BorderRadius.circular(5),
//                                                               color:Color.fromARGB(255, 197, 144, 9)), //Theme.of(context).accentColor),
//                                                           child: Row(
//                                                             children: [
//                                                               InkWell(
//                                                                   onTap: () {
//                                                                     setState(() {
//                                                                       if(_itemCount > 1 )
//                                                                         _itemCount--;
//                                                                     });
//                                                                   },
//                                                                   child: Icon(
//                                                                     Icons.remove,
//                                                                     color: Colors.white,
//                                                                     size: 16,
//                                                                   )),
//                                                               Container(
//                                                                 width: 40,
//                                                                 margin: EdgeInsets.symmetric(horizontal: 3),
//                                                                 padding:
//                                                                     EdgeInsets.symmetric(horizontal: 3, vertical: 2),
//                                                                 decoration: BoxDecoration(
//                                                                     borderRadius: BorderRadius.circular(3),
//                                                                     color: Colors.white),
//                                                                 child: Text(_itemCount.toString(),
//                                                                   style: TextStyle(color: Colors.black, fontSize: 16),
//                                                                 ),
//                                                               ),
//                                                               InkWell(
//                                                                   onTap: () {
//                                                                     setState(() {
//                                                                       if(_itemCount < limit)
//                                                                         _itemCount++;
//                                                                     });
//                                                                   },
//                                                                   child: Icon(
//                                                                     Icons.add,
//                                                                     color: Colors.white,
//                                                                     size: 16,
//                                                                   )),
//                                                             ],
//                                                           ),
//                                                         ),
//                                         ),
//                                       ),
//                                      ],),

//                                       ]
//                                       ),
//                                     //),

//                                     SizedBox(height: 80,),
//                                      Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [

//                                        ElevatedButton(onPressed: (){
                                        
//                                        }, child: Text('\n    Buy    \n')),
//                                       ElevatedButton.icon(onPressed: (){

//                                       }, icon: Icon(Icons.shopping_cart), label:Text('Add\nto\ncart'))
//                                       ],

//                                      ),
//                                   ],
//                                // ),
//                               ),
//       ),
//                   );       //   }
//                      //     );
//             // }
//          //),
//       //),
//         // );

//   }
// }

//    Builder List<StudentModel1S> details;
// //var Details;
//   @override
//   Widget build(BuildContext context,) {
//     if(widget.table =='Electronic Devices'){
//        // Details = 
//        ItemDetails(widget.name);
//        //print(widget.name);
      
//       final Details = details[1]; 
//         //convert();
//         print(Details.duration);
//         print('object1');

//         // for( var value in Details){

//         // }
// //         Details.forEach((map) {
// //  final objects1= StudentModel1S.fromMap(map);
// //    print(objects1.name);
//   // // StudnetModelNotifier1S.value.add(objects1);

//   //  // return objects1;
//   // // StudnetModelNotifier1S.notifyListeners();
//    //  });


//        // print(Details.price);
//     }
//     return Scaffold(
//     //  appBar: AppBar(title: Text(Details.name)),
//       body:Column(children: [
        

//         Expanded(
//           child: Column(
//             children: [
//           //    Text(''+Details.name.toString(),style: TextStyle(fontSize: 5,color: Colors.teal),)
//             ],
//           )
//           )
//       ],)
//     );
//   }
// }

// void convert() async{
//   Future<List<dynamic>> _futureOfList = ItemDetails('Acer');
//   List list = await _futureOfList;
//   print(list);
// }