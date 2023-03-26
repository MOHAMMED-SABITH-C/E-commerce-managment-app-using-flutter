import 'package:flutter/material.dart';
import 'package:flutter_application_2/3rddb/sort&search3.dart';
import 'package:flutter_application_2/Users/RegisterU.dart';
import 'package:flutter_application_2/Users/SelectItem.dart';
import 'package:flutter_application_2/Users/cart/cartDisplay.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_2/counter.dart';
 import 'package:flutter_application_2/editdb.dart';
import 'package:flutter_application_2/list.dart';
import 'package:flutter_application_2/seconddb/SelectTable2.dart';
import 'package:flutter_application_2/seconddb/db_functions2.dart';
import 'package:flutter_application_2/seconddb/updatedb2.dart';

import '4rthdb/sort&search4.dart';
import 'dropdown.dart';
import 'floatingbar.dart';
import 'seconddb/sort&search2.dart';
import 'selectdb.dart';
import 'seconddb/editdb2.dart';
import 'sort&serch.dart';
//import 'splash.dart';
class BottomNavigation extends StatefulWidget {
   String table  ;
   late String phone;
   BottomNavigation({Key? key,required this.table}) : super(key: key);
  
//final tables = 2;
  @override
  State<BottomNavigation> createState() => table == 'Electronic Devices' ? _BottomNavigationState():table == 'vegitables'? _BottomNavigationState2():table == 'Fruits'?_BottomNavigationState3() 
  :table == 'USER'?_BottomNavigationStateU():_BottomNavigationState();
  

//   Future<void> tableS() async{
//  // if(table == 1)
//   {

//   }

//   }
}

class _BottomNavigationStateU extends State<BottomNavigation>{

  int _currentIndex =0;
  final _pages2 = [
    //RegisterU(),
    SelectItems(),
    CartDisplay(time: 1,)
   //listcreation0( type: 'vegitables',),
   //SelectDbD2(table: 'vegitables',),
    //Selectdb(),
   //SearchSort2(),
   //Editdb2(),
  // UpdateDb02(),
  //floatBar(type: 'vegitables')

  ];
  @override
  Widget build(BuildContext context) {
// print(widget.phone);
    return Scaffold(

      body: _pages2[_currentIndex],
      
      // APPBAR FOR SIGNOUT*****************************

      // appBar:AppBar(title: Text('USER'),actions: [IconButton(onPressed: (){
      //     //signout(context);
      //     Navigator.of(context).pushAndRemoveUntil(
      //       MaterialPageRoute(
      //         builder: (context)=>BottomNavigation(
      //           table: 'Electronic Devices',)
      //         ),
      //         (route)=>false
      //       );
      //   }, icon:Icon(Icons.exit_to_app))],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        //  BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
        ]
        ),
    );

}
}

class _BottomNavigationState2 extends State<BottomNavigation>{

  int _currentIndex =0;
  final _pages2 = [
   // listcreation( type: 'vegitables',),
   SelectDbD2(table: 'vegitables',),
    //Selectdb(),
   SearchSort2(),
   //Editdb2(),
  // UpdateDb02(),
  floatBar(type: 'vegitables')

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages2[_currentIndex],
      appBar:AppBar(title: Text('vegitables')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.edit),label: 'Edit'),
        ]
        ),
    );

}
}



class _BottomNavigationState3 extends State<BottomNavigation>{

  int _currentIndex =0;
  final _pages3 = [
    //listcreation( type: 'Fruits',),
    SelectDbD2(table: 'Fruits',),
   SearchSort3(),
  // Editdb2(),
   floatBar(type: 'Fruits')
   //UpdateDb3(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages3[_currentIndex],
      appBar:AppBar(title: Text('Fruits')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        onTap: (newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.edit),label: 'Edit'),
        ]
        ),
    );

}
}

// class _BottomNavigationState4 extends State<BottomNavigation>{

//   int _currentIndex =0;
//   final _pages4 = [
//     //listcreation( type: 'Fruits',),
//     SelectDbD2(table: 'Shirts',),
//    SearchSort4(),
//   // Editdb2(),
//    floatBar(type: 'Shirts')
//    //UpdateDb3(),

//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: _pages4[_currentIndex],
//       appBar:AppBar(title: Text('Shirts')),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,

//         onTap: (newIndex){
//           setState(() {
//             _currentIndex = newIndex;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.edit),label: 'Edit'),
//         ]
//         ),
//     );

// }
// }


// class _BottomNavigationState3 extends State<BottomNavigation>{
  
//   final _currentIndex =0;

//   final _pages3 = [

//   ];
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(

//    );
//   }

// }

class _BottomNavigationState extends State<BottomNavigation> {

 
  int _currentIndex = 0;
  

  final _pages1 = [
    //listcreation(type: 'Electronic Devices'),
    SelectDbD2(table: 'Electronic Devices',),
  //Selectdb(),
    //counter(),
   // dropdownButton(),
   SearchSort(),
   //Editdb(),
    floatBar(type: 'Electronic Devices',),
   
  ];
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: _pages1[_currentIndex],
      appBar:AppBar( title:Text('Electronic Devices')),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (newIndex){
          setState(() {
            _currentIndex = newIndex;
            
          });
        },
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),label:'Home'),
          BottomNavigationBarItem(icon:Icon(Icons.search),label:'Search'),
          BottomNavigationBarItem(icon:Icon(Icons.edit),label:'Edit')
        ] 
        )
    );
  }


}