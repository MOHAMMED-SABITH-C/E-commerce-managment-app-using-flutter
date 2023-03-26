import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/3rddb/db_fundtion3.dart';
import 'package:flutter_application_2/3rddb/editdb3.dart';
import 'package:flutter_application_2/3rddb/updatedb3.dart';
import 'package:flutter_application_2/4rthdb/db_function4.dart';
import 'package:flutter_application_2/4rthdb/editdb4.dart';
import 'package:flutter_application_2/Displaydb.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/dropdown.dart';
import 'package:flutter_application_2/editdb.dart';
import 'package:flutter_application_2/list.dart';
import 'package:flutter_application_2/seconddb/db_functions2.dart';
import 'package:flutter_application_2/seconddb/editdb2.dart';
import 'package:flutter_application_2/seconddb/updatedb2.dart';
import 'package:flutter_application_2/updatedb.dart';

import '4rthdb/updatedb4.dart';

class floatBar extends StatelessWidget {
 floatBar({Key? key,required this.type}) : super(key: key);
  String type;
final name = TextEditingController();
late String _name;
final String count ='10';

  @override
  Widget build(BuildContext context) {
   // var setList = showBottomSheet(context);
      // void initState(){
      //   super.initState();
      //   WidgetsBinding.instance.addPostFrameCallback((_) => showBottomSheet(context));
      // }
    //  showBottomSheet(context);
    return Scaffold(
      body:listcreations(type: type,),
      //Center(//child:showBottomSheet(context)
      //child:setList,
     //Center(
        //child: ,
        //Expanded(child:listcreation(type: 'vegitables',)),
      //showBottomSheet(context),
         
      //),
        floatingActionButton:FloatingActionButton(
          onPressed:(){
            showBottomSheet(context);
          } ,
          child: Icon(Icons.settings),
          )
          
    );
  }

  Future<void> showBottomSheet(BuildContext context) async{
    showModalBottomSheet(
     context: context,
     //shape: Border( ),
     
    //barrierColor: Colors.red,
    builder:(context){
      return Container(
      width:double.infinity,
      
      height: 500,
      color:Colors.cyan,
      // child:ListView(
      child: Column(
      children:[
            CloseButton(
              onPressed:(){ Navigator.of(context).pop();}
              ,//child:Icon(Icons.close)
            ),
            SizedBox(height: 20,),
          //  Text('hi'),
          ElevatedButton.icon(
            onPressed: (){
            //  Editdb();
                if(type == 'Electronic Devices'){
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
                return Editdb(type: type,);
            })
           ); 
                }else if(type == 'vegitables'){
                   Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
                return Editdb2();
            })
           ); 
                }else if(type == 'Fruits'){
                   Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
                return Editdb3();
            })
           ); 
                }
                else if( type == 'Shirts'){
                  Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
                return Editdb4(type: type,);
            })
           );
                }
                    //return dropdownButton();
            print(type);

            },
            
             icon: Icon(Icons.edit),
              label: Text('Insert Data')
              ),
              SizedBox(height: 10,),

              // ElevatedButton.icon(
              //   onPressed: (){
              //     deleteStudent(name);
                  
              //     // Navigator.of(context).push(
              //     //   MaterialPageRoute(
              //     //     builder:((context) {
              //     //     // if(name!=null)
              //     //     if(name!=null){
              //     //         deleteStudent(name!);}
              //     //     }) 
              //     //     )
              //     // );
              //   },
              //    icon: Icon(Icons.delete_forever),
              //     label: Text('DELETE')
              //     ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  label: Text('name',style: TextStyle(color: Colors.red),),
                  hintText: 'Enter the name for delete related datas',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  suffixIcon: IconButton(color: Colors.red,
                    onPressed: (){
                     final _name =name.text.trim();
                     //name = '';
                     if(type == 'Electronic Devices'){
                      deleteStudent(_name);
                     }else if(type == 'vegitables'){
                      deleteStudent2(_name);
                     }else if(type == 'Fruits') {
                      deleteStudent3(_name);
                     }else if(type == 'Shirts'){
                      deleteStudent4(_name);
                     }
                    },
                     icon: Icon(Icons.delete))
                ),
              ),
              SizedBox(height: 10,),

                  ElevatedButton.icon(
                    onPressed: (){
                       if(type == 'Electronic Devices'){
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
              return UpdateDb0();

            })
           ); 
                }else if(type == 'vegitables'){
                   Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
              return UpdateDb02();

            })
           ); 
                }else if(type == 'Fruits'){
                   Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
              return UpdateDb03();

            })
           ); 
                }
                else if(type == 'Shirts'){
                   Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
              return UpdateDb04();

            })
           ); 
                }
                    //return dropdownButton();
            print('update');

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder:(context){
                      //       return UpdateDb03();
                      //     } 
                      //     )
                      // );
                      
                      //updateDb(price,count,name);

                  }, icon: Icon(Icons.security_update),
                  label: Text('update'), 
                  ),
                  

      ]
        ),
      );
    },
    );
  }
}

