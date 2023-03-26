import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/buttenNavig.dart';

class PrintBill extends StatelessWidget {
   PrintBill({super.key,required this.type,required this.address,required this.image,required this.phone,required this.objName,required this.price,required this.count,required this.list});
    late var list;
    late String image;
   late String address;
    late String phone;
    late String type;
    late String objName;
    late String price;
    late String count;

  @override
  Widget build(BuildContext context) {
   // late var dataU = widget.list2;
    late var dataU = list;

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
                width: 196.3,
                height: 220,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                color: Color.fromARGB(53, 184, 136, 118),
                  
                 borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text('USER ADDRESS',
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                    SizedBox(height: 20,),
                    Text(dataU.name,
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    SizedBox(height: 10,),
                    Text(dataU.phone,
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    SizedBox(height: 10,),
                    Text(dataU.email,
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    SizedBox(height: 10,),
                     Text(address,
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    SizedBox(height: 10,),
                ]),
              ),
              Container(
                width: 196.3,
                height: 220,
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("$image"),
                
                ),
                                
               color: Color.fromARGB(83, 145, 193, 200),
                  border: Border.all(color: Colors.black),
                 borderRadius: BorderRadius.circular(5)
                                  ),
                ),
                // child: Column(children: [
                //   //Text('hi')
                // ]),
            //  )
              
            ],),
            SizedBox(height: 20,),
            Text(objName,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 40)),
            SizedBox(height: 20,),
            Divider(thickness: 20,color: Color.fromARGB(130, 154, 153, 153),),
            SizedBox(height: 10,),

            Text('Price Details',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
            SizedBox(height: 10,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                
              // Column(
              //   children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:Text('MRP '+ '('+count+' items)', style: TextStyle(
                                                  fontSize: 20,color: Color.fromARGB(100, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:Text('₹'+price, style: TextStyle(
                                                  fontSize: 20,color: Color.fromARGB(100, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                  ),
              //   ],
              // )
              ],
            ),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                
              // Column(
              //   children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:Text('Product Discount', style: TextStyle(
                                                  fontSize: 20,color: Color.fromARGB(100, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:Text('-₹0', style: TextStyle(
                                                  fontSize: 20,color: Color.fromARGB(100, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                  ),
              //   ],
              // )
              ],
            ),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
              // Column(
              //   children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:Text('Delivery Fee', style: TextStyle(
                                                  fontSize: 20,color: Color.fromARGB(100, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:Text('₹50', style: TextStyle(
                                                  fontSize: 20,color: Color.fromARGB(100, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                  ),
              //   ],
              // )
              ],
            ),
            SizedBox(height: 15,),
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
                    child:Text('₹'+(int.parse(price)+50).toString(), style: TextStyle(
                                                  fontSize: 30,color: Color.fromARGB(255, 15, 0, 0),
                                                  fontWeight: FontWeight.bold),),
                  ),
              //   ],
              // )
              ],
            ),
            Divider(thickness: 5,color: Color.fromARGB(206, 60, 59, 59),),

        ]),
      ),
    );
  }
}