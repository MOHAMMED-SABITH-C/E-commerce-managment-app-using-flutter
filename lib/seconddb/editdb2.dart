import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/model/data_model.dart';

import 'db_functions2.dart';

class Editdb2 extends StatelessWidget {
   Editdb2({super.key});
    String type ='vegitables';
DateTime today = DateTime.now();

final _txt1=TextEditingController();
final _txt2=TextEditingController();
final _txt3=TextEditingController();
final _txt4=TextEditingController();
final _txt5=TextEditingController();

//late String type ;

final _lists = [
  'PACKET',
  'LOOSE',
  
];

  @override
  Widget build(BuildContext context) {
    getAllStudents2();
    return Scaffold(
      appBar: AppBar(title:Text('TABLE $type'),
        actions: [
       // Icon(Icons.reddit)
       
       //Text('Table $type')
      ]),
      body: Container(

      child: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [

              Expanded(
               flex:2,
                child:Column( 
                 // mainAxisSize: MainAxisSize.min,
                  children:[
              Expanded(
                child: TextField(
                  controller:_txt1 ,
                  
                 decoration: const InputDecoration(
                  label: Text('Name of object'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                 ),
                ),
              ),
               SizedBox(height: 20,),
              

              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _txt2,
                  decoration: const InputDecoration(
                    label: Text('price for 1 kg'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Expanded(
                child: DropdownButtonFormField(
                  items: _lists.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                    );
                  }).toList(),
                  hint:Text('Select category'), 
                  onChanged: (String? value){
                    type = value!;
                  }
                  ),
              )
                  ]
                )
              ),

                  //  SizedBox(height: -20,),
              Expanded(
                child:Container(
                   // width:double.infinity,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                   // crossAxisAlignment: CrossAxisAlignment.end,
                  //   mainAxisSize: MainAxisSize.min,
                    children: [
                      new Flexible(
                      //  child:Expanded(
                          child: TextField(
                            controller: _txt3,
                            keyboardType: TextInputType.number,
                           //                       maxLength: 5,
                            decoration: const InputDecoration(
                              label: Text('count'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              )
                            ),
                          ),
                   //     ),
                      ),

                      SizedBox(width: 30,),
                      new Flexible(
                     //  child:Expanded(
                         child: TextField(
                            controller: _txt4,
                            keyboardType: TextInputType.datetime,
                          //121121  maxLength: 5,
                            decoration: const InputDecoration(
                              label: Text('warranty'),
                              hintText:'valid upto',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )
                            ),
                          ),
                       ),
                   //   )
                    ],
                  ),
                ) 
              ),

               SizedBox(height: 30,),

               TextField(
                            controller: _txt5,
                           // keyboardType: TextInputType.datetime,
                          //121121  maxLength: 5,
                            decoration: const InputDecoration(
                              label: Text('src'),
                              hintText:'Image address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )
                            ),
                          ),
            
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: Text('ADD') ,
                      onPressed: () {
                      sendData(context);
                    },),
                  ],
                ),
              ),
            )
            ],
          
        
            
          ), 
          ),
      ),
        
      ),
    );
    
  }


  Future <void> sendData(context) async{
    final _name = _txt1.text.trim();
    final _type = type;
    final _price = _txt2.text.trim();
    final _count = _txt3.text.trim();
    final _duration = _txt4.text.trim();
    final _image = _txt5.text.trim();
    
 //if(_name != null && _price != null && _count != null && _duration != null && _type != null)
  //  {
      final  _objects = StudentModel2(name: _name, price: _price,type: _type, count: _count , duration: _duration,image: _image );
      addStudent2(_objects);
      print(today);

   // }
   // else
   // { print('fill all field');}
  }
}