import 'dart:math';

import 'package:flutter/material.dart';
          import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/3rddb/db_fundtion3.dart';
import 'package:flutter_application_2/4rthdb/db_function4.dart';
import 'package:flutter_application_2/Users/SelectItem.dart';
//import 'package:flutter_application_2/Users/UserBill.dart';
import 'package:flutter_application_2/Users/cart/db_functionC.dart';
import 'package:flutter_application_2/Users/cart/printcartBill.dart';
import 'package:flutter_application_2/Users/db_functionU.dart';
import 'package:flutter_application_2/Users/printBill.dart';
import 'package:flutter_application_2/buttenNavig.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/model/data_model.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/seconddb/db_functions2.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'checkU.dart';

class BuyLog extends StatefulWidget {
   BuyLog({super.key,required this.from,required this.table,required this.image,required this.name,required this.price,required this.count,required this.Ccount,required this.type,required this.list});
 
 late String image;
 late String from;
 late var list;
 late String type ;
  late String table ;
 late String Ccount;
 late String name='';
 late String price='';
 late String count='';
 late String name1 ='';
 late String phone='';
 late int number = 1;
 late int c=0;

  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  @override
  State<BuyLog> createState() => from == 'cart'? _BuyLogStateCart():_BuyLogState2();
}


class _BuyLogState2 extends State<BuyLog> {
final _txte1=TextEditingController();

//final _txte2=TextEditingController();
final _txte3=TextEditingController();

final _txte4 =TextEditingController();
 //late String name1 ='' ;

    late String name1;

     late String phone ;

    // late String email ='';
// late var data =null ;


  @override
  Widget build(BuildContext context) {
    print(widget.Ccount);
    return Scaffold(
      appBar: AppBar(title: Text('conform'),actions: [],),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              TextField(
              //  keyboardType: TextInputType.number,
                controller: _txte1,
                decoration: const InputDecoration(
                  label: Text('name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),

              ),

              SizedBox(height: 20,),

              TextField(
                controller: _txte3,
                
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Number ',
                  label: Text('Phone No'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),
              SizedBox(height: 20,),
              TextField(
              //  keyboardType: TextInputType.number,
                controller: _txte4,
                decoration: const InputDecoration(
                  label: Text('Address'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),

              ),


              Flexible(
                child: ElevatedButton.icon(
                  onPressed: (){

                    print('BUY'+widget.name+' '+ widget.phone);

                    if(_txte1 != null && _txte3 != null && _txte4 !=null){
                    
                      sendDataU22();
     
                    }
                    else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior:SnackBarBehavior.floating,
                  backgroundColor: Colors.cyan,
                  margin:EdgeInsets.all(10),
                  content: Text("Please Enter a name , phone no,Address")
                  )
                          );
                    }
                  },
                   icon: Icon(Icons.print),
                    label: Text('SUBMIT')
                    ),
              )
                  
           // ],
          //),
       // )
       /// ),
    //);
 // }

      ]),
    );
  }

//}
  Future<void> sendDataU22() async{
     name1 = _txte1.text.trim();
    phone = _txte3.text.trim();
    String Address = _txte4.text.trim();
    late String shPhone;
    late String shName;
    print(widget.table);
    //widget.phone =phone;
    // email = _txte4.text.trim();
    // if(name1.isNotEmpty && phone.isNotEmpty){
    //   if(name1.isNotEmpty && phone.isNotEmpty){
      final SharedPreferences sp = await widget._pref;
      setState(() {
         shPhone = sp.getString('phone')??'';
        shName = sp.getString('name')??'';
       
      });
    await SearchUser(phone).then((value) => {
    //   if(value != null){
      if(shName == name1 && shPhone == phone){

         if(widget.table =='Electronic Devices'){
          print('update'+widget.Ccount),

                      updateDb1C(widget.Ccount, widget.name),
                      updateDbC('',widget.Ccount,widget.price, widget.name, phone,'buy'),
                      }
                      else if(widget.table =='Vegitables'){
                      updateDb2C(widget.Ccount, widget.name),
                      updateDbC('',widget.Ccount,widget.price, widget.name, phone,'buy'),

                      }
                      else if(widget.table == 'Fruits'){
                        updateDb3C(widget.Ccount, widget.name),
                      updateDbC('',widget.Ccount,widget.price, widget.name, phone,'buy'),
                      }
                      else if(widget.table =='Shirts'){
                        updateDb4C(widget.Ccount, widget.name),
                      updateDbC('',widget.Ccount,widget.price, widget.name, phone,'buy'),
                      },
                        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: ((context) {
                         return 
                        PrintBill(type:'1st',address:Address,image:widget.image, phone: phone,  objName: widget.name, price: widget.price, count: widget.count,list : value);

      
                        }),))
      
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior:SnackBarBehavior.floating,
                  backgroundColor: Colors.cyan,
                  margin:EdgeInsets.all(10),
                  content: Text("Please valid Phone No and User Name",style: TextStyle(color: Colors.red),)
                  )
                          )
      }
  });
    }
  }
    
//   }
// }

class _BuyLogStateCart extends State<BuyLog> {
final _txte1=TextEditingController();

//final _txte2=TextEditingController();
final _txte3=TextEditingController();

final _txte4 =TextEditingController();
 //late String name1 ='' ;

    late String name1;

     late String phone ;

    // late String email ='';
// late var data =null ;


  @override
  Widget build(BuildContext context) {
  print('hcekking');
    return Scaffold(
      appBar: AppBar(title: Text('conform'),actions: [],),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              TextField(
              //  keyboardType: TextInputType.number,
                controller: _txte1,
                decoration: const InputDecoration(
                  label: Text('name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),

              ),

              SizedBox(height: 20,),

              TextField(
                controller: _txte3,
                
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Number ',
                  label: Text('Phone No'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),
              SizedBox(height: 20,),
               TextField(
              //  keyboardType: TextInputType.number,
                controller: _txte4,
                decoration: const InputDecoration(
                  label: Text('Address'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),

              ),


              Flexible(
                child: ElevatedButton.icon(
                  onPressed: (){

                    print('BUY'+widget.name+' '+ widget.phone);

                    if(_txte1 != '' && _txte3 != ''){
                      sendDataU2();
     
                    }
                    else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior:SnackBarBehavior.floating,
                  backgroundColor: Colors.cyan,
                  margin:EdgeInsets.all(10),
                  content: Text("Please Enter a name  phone no")
                  )
                          );
                    }
                  },
                   icon: Icon(Icons.print),
                    label: Text('SUBMIT')
                    ),
              )
                  
           // ],
          //),
       // )
       /// ),
    //);
 // }

      ]),
    );
  }

//}
  Future<void> sendDataU2() async{
     name1 = _txte1.text.trim();
   String Address = _txte4.text.trim();
    phone = _txte3.text.trim();
    late String shPhone;
    late String shName;
    print(widget.table);
    //widget.phone =phone;
    // email = _txte4.text.trim();
     if(name1.isNotEmpty && phone.isNotEmpty){
      final SharedPreferences sp = await widget._pref;
      setState(() {
         shPhone = sp.getString('phone')??'';
        shName = sp.getString('name')??'';
       
      });
      if(phone == shPhone && name1 == shName ){
        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: ((context) {
                         return printCartBill(time: 1,Address:Address);
                       // PrintBill(type:'1st',image:widget.image, phone: phone,  objName: widget.name, price: widget.price, count: widget.count,list : value);

                        }),));
                        // .then((value){
                        //           getcart(shPhone);    
                        //             });
       }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior:SnackBarBehavior.floating,
                  backgroundColor: Colors.cyan,
                  margin:EdgeInsets.all(10),
                  content: Text("Please valid Phone No and User Name",style: TextStyle(color: Colors.red),)
                  )
                          );
      }
  //   await SearchUser(phone).then((value) => {
  //     if(value != null){
  //       //  if(widget.table =='Electronic Devices'){
  //       //   print('update'),

  //       //               updateDb1C(widget.Ccount, widget.name),
  //       //               updateDbC('',widget.Ccount,widget.price, widget.name, phone,'buy')
  //       //               }
  //       //               else if(widget.table =='Vegitables'){
  //       //               updateDb2C(widget.Ccount, widget.name),
  //       //               updateDbC('',widget.Ccount,widget.price, widget.name, phone,'buy')

  //       //               }
  //       //               else if(widget.table == 'Fruits'){
  //       //                 updateDb3C(widget.Ccount, widget.name),
  //       //               updateDbC('',widget.Ccount,widget.price, widget.name, phone,'buy')
  //       //               }
  //       //               else if(widget.table =='Shirts'){
  //       //                 updateDb4C(widget.Ccount, widget.name),
  //       //               updateDbC('',widget.Ccount,widget.price, widget.name, phone,'buy')
  //       //               },
  //                       Navigator.of(context).pushReplacement(
  //                       MaterialPageRoute(builder: ((context) {
  //                        return printCartBill();
  //                      // PrintBill(type:'1st',image:widget.image, phone: phone,  objName: widget.name, price: widget.price, count: widget.count,list : value);

  //                       }),))
  //     }else{
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                 behavior:SnackBarBehavior.floating,
  //                 backgroundColor: Colors.cyan,
  //                 margin:EdgeInsets.all(10),
  //                 content: Text("Please valid Phone No and User Name",style: TextStyle(color: Colors.red),)
  //                 )
  //                         )
  //     }
  //   });
  }
    
  }
}
