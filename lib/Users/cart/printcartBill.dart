import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/Users/cart/db_functionC.dart';
import 'package:flutter_application_2/buttenNavig.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/model/data_model.dart';
import 'package:flutter_application_2/seconddb/db_functions2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../3rddb/db_fundtion3.dart';
import '../../4rthdb/db_function4.dart';

class printCartBill extends StatefulWidget {
   printCartBill({super.key,required this.time,required this.Address});
    late int time;
    late String Address='';
    late int totalPrice =0;
    late String phone1='';
    late String name1='';

  @override
  State<printCartBill> createState() => _printCartBillState();
}

class _printCartBillState extends State<printCartBill> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  late int total=0;
  @override
  Widget build(BuildContext context) {
    if(widget.time==1)
     {
      getD();
     }
      setState(() {
        
     widget.totalPrice=total;
      });
 
    late String image;
    late String phone;
    late String objName;
    late String price;

    late String count;
    print('getout');
    return Scaffold(
      appBar: AppBar(title: Text('BILL'), actions: [IconButton(onPressed: (){
          //signout(context);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context)=>BottomNavigation(table: 'USER')
              ),
              (route)=>false
            );
        }, icon:Icon(Icons.close))
      ],),
      body: Container(
        color: Color.fromARGB(110, 142, 136, 84),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(
                // width:double.infinity,
                width: 392,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                color: Color.fromARGB(53, 184, 136, 118),
                  
                 borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text('USER ADDRESS',
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    SizedBox(height: 20,),
                    Text(widget.name1,
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    SizedBox(height: 10,),
                    Text(widget.phone1,
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    SizedBox(height: 10,),
                    Text(widget.Address,
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    SizedBox(height: 10,),
                ]),
              ),
             
              
            ],),
            SizedBox(height: 20,),
            Divider(thickness: 20,color: Color.fromARGB(130, 154, 153, 153),),
            Text('Price Details',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            SizedBox(height: 10,),
            Expanded(
              child: ValueListenableBuilder(
                              valueListenable: CartModelNotifier1, 
                              builder: (BuildContext context, List<CartModel> studentList, Widget? child){
                                return ListView.separated(
                                  
                                  itemBuilder: (context, index) {
                                    final data = studentList[index];
                                    image = data.image;
                                    price = data.price;
                                      
                                    total= total+ int.parse(price);
                                    print(widget.totalPrice);
                                  int  _itemCount= int.parse(data.count);
                                  count =(int.parse(data.lim)-int.parse(data.count)).toString();
                                    deleteCart1(data.objName,data.phone);

                                  if(data.table =='Electronic Devices'){
                                print('update');

                      updateDb1C(count, data.objName);
                      }
                      else if(data.table =='Vegitables'){
                      updateDb2C(count, data.objName);

                      }
                      else if(data.table == 'Fruits'){
                        updateDb3C(count, data.objName);
                      }
                      else if(data.table =='Shirts'){
                        updateDb4C(count, data.objName);
                      }
                                   return ListTile(
                                      title: Text(data.objName),
                                      isThreeLine: true,
                                 
                                     leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    
                                    minWidth:44,
                                    minHeight: 44,
                                    maxHeight: 64,
                                    maxWidth: 64, ),
                                    child: Image.asset("$image"),
                                
                                  ),
            
                    subtitle:Text( '('+data.count+' items)', style: TextStyle(
                                                  color: Color.fromARGB(100, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                
            trailing:
                    Text('MRP:\n₹'+price, style: TextStyle(
                                                  fontSize: 20,color: Color.fromARGB(100, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
           
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
            Divider(thickness: 5,color: Color.fromARGB(206, 60, 59, 59),),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                
              // Column(
              //   children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:Text('Total Amount', style: TextStyle(
                                                  fontSize: 30,color: Color.fromARGB(255, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                  ),
                  
                  Align(
                    alignment: Alignment.topRight,
                    child:Text('₹'+(widget.totalPrice).toString(), style: TextStyle(
                                                  fontSize: 30,color: Color.fromARGB(255, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                  ),
            
              ],
            ),
            // Divider(thickness: 5,color: Color.fromARGB(206, 60, 59, 59),),

        ]),
      ),
      
    );
  }
   Future <void> getD()async{
    widget.time=0;
    late String phone0;
    final SharedPreferences sp = await _pref;

    setState(() {
      phone0= sp.getString('phone')??'';
     widget.phone1=phone0;
      widget.name1= sp.getString('name')??'';
      widget.totalPrice;
    });
    getcart(phone0);

     
  }
}
