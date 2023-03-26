import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/3rddb/db_fundtion3.dart';
import 'package:flutter_application_2/Users/cart/db_functionC.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/list.dart';
import 'package:flutter_application_2/model/data_model.dart';
import 'package:flutter_application_2/seconddb/db_functions2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Buy.dart';

class Buyobject extends StatefulWidget {
   Buyobject({super.key,required this.name,required this.image,required this.table,required this.type,required this.price,required this.limit,required this.warranty});

late String image;
late String name='';
late String table; 
late String type;
late String price='';
 late int limit;
  late String warranty;

  @override
  State<Buyobject> createState() => _BuyobjectState();
}

class _BuyobjectState extends State<Buyobject> {

Future<SharedPreferences> _pref = SharedPreferences.getInstance();
late String phone='';
late String name='';
 int _itemCount=1;
 late String price=widget.price;
 late String count='';
 late String image = widget.image;
   @override
  Widget build(BuildContext context) {
    // getAllStudents();
    // getAllStudents2();
    // getAllStudents3();
 print("$Image+image");
 print('details');
     return Scaffold(
                              //Text('')
    appBar: AppBar(title:  Text('${widget.type}'),actions: []),//if(widget.type=='Vegitables'){ getAllStudents(),}],),
      //actions: [IconButton(onPressed: (){
      //     //signout(context);
      //     Navigator.of(context).pushAndRemoveUntil(
      //       MaterialPageRoute(
      //         builder: (context)=>listcreation0(
      //           type: widget.table,)
      //         ),
      //         (route)=>false
      //       );
      //   }, icon:Icon(Icons.exit_to_app))
      //],
                           //       print(data);
      body: SafeArea( 
                             // return //Center(
                               child:
                                 Column(
                                  children: [
                                    SizedBox(height: 350,
                                    // child:Image(width:10,height: 50,image:// )
                                    // NetworkImage('https://rukminim1.flixcart.com/image/850/850/l4oi4cw0/computer/i/n/e/a715-5g-gaming-laptop-acer-original-imagfj2g954wfdyz.jpeg?q=90')),
                                    // backgroundImage:lib/images/acer.jpeg
                                    child:Image(image:AssetImage("$image") ),
                                    ),
                                   // Padding(
                                     // padding: const EdgeInsets.only(left: 0),
                                      //child: 
                                   //   Column( 
                                     // children:[ 
                                        Text(widget.name,
                                        style: TextStyle(fontSize: 55,color: Colors.black,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 8,),
                                     Row(
                                      mainAxisAlignment :MainAxisAlignment.spaceBetween,
                                      children: [
                                   //SizedBox(width: 60),
                                      Flexible(

                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Text((_itemCount*int.parse(widget.price)).toString(),
                                          style: TextStyle(
                                            fontSize: 25,color: Color.fromARGB(100, 15, 0, 0),
                                            fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                  // SizedBox(width: 120),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Container(
                                            
                                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                          width: 84,
                                                          padding: EdgeInsets.all(3),
                                                          decoration: BoxDecoration(
                                                            
                                                              borderRadius: BorderRadius.circular(5),
                                                              color:Color.fromARGB(255, 197, 144, 9)), //Theme.of(context).accentColor),
                                                          child: Row(
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      if(_itemCount > 1 )
                                                                        {_itemCount--;
                                                                        count = (widget.limit - _itemCount).toString();
                                                          price = (_itemCount*int.parse(widget.price)).toString();
                                                                        }
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.remove,
                                                                    color: Colors.white,
                                                                    size: 16,
                                                                  )),
                                                              Container(
                                                                width: 40,
                                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                                padding:
                                                                    EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(3),
                                                                    color: Colors.white),
                                                                child: Text(_itemCount.toString(),
                                                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    //print(widget.limit);
                                                                    setState(() {
                                                                      if(_itemCount < widget.limit)
                                                                        {_itemCount++;
                                                             count = (widget.limit - _itemCount).toString();
                                                          price = (_itemCount*int.parse(widget.price)).toString();
                                                                        }
                                                                  });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Colors.white,
                                                                    size: 16,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                        ),
                                      ),
                                     ],),

                                     // ]
                                     // ),
                                    //),

                                    SizedBox(height: 80,),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                       ElevatedButton(onPressed: (){
                                        print(widget.name+'byproduct');
                                        var list=null;
                                       // print(count);
                                        // if(widget.table =='Electronic Devices'){
                                        //   // print('vegitablesssss');
                                        //  // updateDb1C('20', widget.name);
                                        // }
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: ((context) {
                                            return
                                        BuyLog(from: 'buy',table:widget.table,image:widget.image,name:widget.name,price:price,count: _itemCount.toString(),Ccount:count,type: '2nd',list: list,);
                                          }))
                                        );
                                       }, 
                                       child: Text('\n    Buy    \n')),
                                      ElevatedButton.icon(onPressed: (){
                                        getData();
                                        print(name);
                                        //  print(_itemCount);
                                        // final objects = CartModel(price: price, count: _itemCount.toString(), objName: widget.name, phone: widget.phone)
                                      }, icon: Icon(Icons.shopping_cart), label:Text('Add\nto\ncart'))
                                      ],

                                     ),
                                  ],
                               // ),
                              ),
      ),
                  ); 
  }

  Future<void> getData()async{
    // String ph='';
    // String na='';
    final SharedPreferences sp = await _pref;

    setState(() {
    // final 
    //  ph 
      // = ph;
     phone= sp.getString('phone')??'';
      //final
      //  na
       name= sp.getString('name')??'';
        // =na; 

      print(price+'hm');
    });
      // print(ph+'pinne'+na);
      final obj = await CartModel(table: widget.table,price: price,image: image,ogPrice: widget.price,lim: (widget.limit).toString(),count: _itemCount.toString(),objName: widget.name,phone: phone);
      addToCart1(obj);
      getcart(phone);
  }
}