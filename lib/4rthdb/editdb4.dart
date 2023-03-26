import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/4rthdb/db_function4.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/model/data_model.dart';

class Editdb4 extends StatelessWidget {
   Editdb4({super.key,required this.type});
    String type ;
    late String gender;
    late String size;
DateTime today = DateTime.now();

final _txt1=TextEditingController();
final _txt2=TextEditingController();
final _txt3=TextEditingController();
//final _txt4=TextEditingController();

//late String type ;

final _list1 = [
  'S',
  'M',
  'L','XL','XXL',
];
final _list2 =[
  'T-shirt','Dress shirt','Polo shirt','Sleeveless shirt',
  'flnnel','Jean jacket','Aloha shirt','Henley shirt','Raglan shirt',
  'Camp shirt','Guayabera','Oxford',
];
final _list3 =[
  'male','female','unisex'
];

  @override
  Widget build(BuildContext context) {
    getAllStudents();
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

              SizedBox(height: 50,),

              Expanded(
                child: DropdownButtonFormField(
                  items: _list1.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                    );
                  }).toList(),
                  hint:Text('Select category'), 
                  onChanged: (String? value){
                    size = value!;
                  }
                  ),
              ),
               SizedBox(height: 20,),
              

              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _txt2,
                  decoration: const InputDecoration(
                    label: Text('price'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Expanded(
                child: DropdownButtonFormField(
                  items: _list2.map((e) {
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
              ),
              SizedBox(height: 50,),

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
              //Expanded(
                child: DropdownButtonFormField(
                  items: _list3.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                    );
                  }).toList(),
                  hint:Text('Select category'), 
                  onChanged: (String? value){
                    gender = value!;
                  }
                  ),
              //)

                     //  child:Expanded(
                        //  child: TextField(
                        //     controller: _txt4,
                        //     keyboardType: TextInputType.datetime,
                        //   //121121  maxLength: 5,
                        //     decoration: const InputDecoration(
                        //       label: Text('warranty'),
                        //       hintText:'valid upto',
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(Radius.circular(10)),
                        //       )
                        //     ),
                        //   ),
                       ),
                   //   )
                    ],
                  ),
                ) 
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
    final _size = size;
    final _type = type;
    final _price = _txt2.text.trim();
    final _count = _txt3.text.trim();
    final _gender = gender;// _txt4.text.trim();
    
 //if(_name != null && _price != null && _count != null && _duration != null && _type != null)
  //  {
      final  _objects = StudentModel4(name: _name,size:_size, price: _price ,type: _type, count: _count , gender: _gender );
      addStudent4(_objects);
      print(today);

   // }
   // else
   // { print('fill all field');}
  }
}