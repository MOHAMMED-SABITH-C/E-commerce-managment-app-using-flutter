import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/Users/Buy.dart';
import 'package:flutter_application_2/Users/Buyobject.dart';
import 'package:flutter_application_2/Users/cart/db_functionC.dart';
// import 'package:flutter_application_2/Users/cart/printcartBill.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartDisplay extends StatefulWidget {
   CartDisplay({super.key,required this.time});
   late int time;
  late String phone;
  // getcart(phone);
  // final _CartDisplayState cart = new _CartDisplayState();
  // _CartDisplayState().getD();

  @override
  State<CartDisplay> createState() => _CartDisplayState();
}

class _CartDisplayState extends State<CartDisplay> {
Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  late int _itemCount; 
  late String name;
  //late String table;
  late String count='5' ;
  late String image;
  late String price;
  // late int limit ;
  late String ogprice;
      // getD();
  int index =0;
  @override
  Widget build(BuildContext context) {
    // print('repeated');
   if(widget.time==1)
    getD();
    widget.time =0;
  // updateDbC(count, name,_itemCount.toString());
    return Scaffold(
      body: SafeArea( 
        // Text('hi');
         child: Column(
           children: [
             Expanded(
               child: ValueListenableBuilder(
                              valueListenable: CartModelNotifier1, 
                              builder: (BuildContext context, List<CartModel> studentList, Widget? child){
                                return ListView.separated(
                                  
                                  itemBuilder: (context, index) {
                                    final data = studentList[index];
                                    // table = data.table;
                                    image = data.image;
                                  //  limit = int.parse(data.lim);
                                    ogprice =data.ogPrice;
                                    price = data.price;
                                  int  _itemCount= int.parse(data.count);
                                  print('$count c $price p $_itemCount i');
                                   return ListTile(
                                      title: Text(data.objName),
                                      isThreeLine: true,
                                      //Text(data.price),
                                 
                                     // leading: CircleAvatar(radius: 30),
                                     leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    
                                    minWidth:44,
                                    minHeight: 44,
                                    maxHeight: 64,
                                    maxWidth: 64, ),
                                    child: Image.asset("$image"),
                                
                                  ),
                                      subtitle:Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                        SizedBox(height: 5,),
             
                                        Text(data.price),
                                        SizedBox(height: 5,),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton.icon(onPressed: (){
                                            deleteCart1(data.objName,data.phone);
                                            getcart(widget.phone);
             
                                         },
                                           icon: Icon(Icons.delete,size: 20,color: Colors.red,),
                                            label: Text('Remove',style: TextStyle(color: (Colors.black)),)
                                            ,style:ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(146, 184, 181, 181),
                                            ) ,
                                            ),
                                        )         
                                        // FlatButt
                                                             ],), 
                                    
                                    onTap: () {
                                       // print(data.name+'hi');
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context){
                                            //return Buyobj(name:data.name,table: 'Electronic Devices',);
                                            return Buyobject(name: data.objName,image: data.image, table: data.table, type: '', price: data.price, limit:int.parse(data.lim) , warranty: ''); 
                                          })
                                        );
                                     //   listcreation0(type: 'Electron Devices',);
                                      },
                                      trailing: 
                                      //  Flexible(
                                              // child: 
                                              Padding(
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
                                                                              int c=int.parse(data.count) -_itemCount;
                                                                              count = (int.parse(data.lim) - _itemCount).toString();
                                                                              // count = c.toString();
                                                                price = (_itemCount*int.parse(data.ogPrice)).toString();
                                                                print(count+price);
                                                                updateDbC(_itemCount.toString(),count, data.objName, price, data.phone,'cart');
                                                                getcart(widget.phone);
             
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
                                                                      // FlatButton(
                                                                        onTap: () {
                                                                          print(int.parse(data.lim));
                                                                          setState(() {
                                                                            if(_itemCount < int.parse(data.lim))
                                                                              {_itemCount++;
                                                                   count = (int.parse(data.lim) - _itemCount).toString();
                                                                price = (_itemCount*int.parse(data.ogPrice)).toString();
                                                                updateDbC(_itemCount.toString(),count, data.objName, price, data.phone,'cart');
                                                                getcart(widget.phone);
                                                                print(count+price);
             
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
                                            // ),
                                      // IconButton(onPressed:(){
                                        
                                      //   if(data.objName!=null)
                                      //     deleteCart1(data.objName,data.phone);
                                      // }, 
                                      // icon:Icon(Icons.delete,color:  Colors.red,)
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

                      SizedBox(width: double.infinity,
                      child:ElevatedButton(onPressed: (){
                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: ((context) {
                                            return
                                        BuyLog(from: 'cart',table:'',image:'',name:'',price:'',count: '',Ccount:'',type: '',list: '',);
                                          }))
                                        );
                                  //       .then((value){
                                  // getcart(widget.phone);    
                                  //   });
                    //  printCartBill();
                                              },
                       child: Text('Buy Now'))
                      ),
           ],
         ),
                  
      ),
      );
      
  }

  Future <void> getD()async{
    print('getd');
  // late String phone;
  // widget.time=0;
    final SharedPreferences sp = await _pref;

    setState(() {
    // final 
    //  ph 
      // = ph;
    String phone= sp.getString('phone')??'';
    getcart(phone);
    widget.phone = phone;
      //final
      //  na
      String name1= sp.getString('name')??'';
        // =na; 

    });

      // print(price+'hm');
  }
 }
    // );
//   }
// }