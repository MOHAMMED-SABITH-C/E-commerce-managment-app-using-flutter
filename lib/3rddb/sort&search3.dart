import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/Displaydb.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/dropdown.dart';

//import 'db_functions2.dart';
import 'db_fundtion3.dart';
//import 'seconddb/db_functions2.dart';
//import 'package:flutter_application_2/list.dart';

class SearchSort3 extends StatelessWidget {
   SearchSort3({super.key});
final _search = TextEditingController();

final _lists = [
  'PACKET',
  'LOOSE'
];
final lists = [
  'Ascending',
  'Descending',
];

late String text = '';
late String type ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(actions: []),
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
              SizedBox(height: 5,),
              TextField(
                controller: _search,
                decoration: InputDecoration(
                  label: Text('name'),
                  hintText: 'Enter the name for search',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ,suffixIcon: IconButton(
                    onPressed: (){
                  text= _search.text.trim();
                      SearchDb3('name',text);
                     // type = 'Fruits';
                  }, icon: Icon(Icons.search))
                ),
              ),
              SizedBox(height: 10,),
              // TextField(
              //   controller: _search2,
              //   decoration: InputDecoration(
              //     label: Text('catogory')
              //   ),
              // ),
              DropdownButtonFormField(
                items: _lists.map((e){
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                },).toList(),
                hint: Text('Select catogory')
                ,onChanged: (String ? value){
                  type =value!;
                  SearchDb3('type',type);
                  },
                  
                  ),
              ElevatedButton.icon(
                onPressed: (){
                  text= _search.text.trim();
                  SearchDbA3(type,text);
              },
               icon:Icon(Icons.search),
                label: Text('Search'))
              ,

                  SizedBox(height: 30,),
                 Expanded(child: listcreations(type: 'Fruits'),)
                  
           //    Expanded(child: listcreation(),)
            ],
          ),
        ),

        ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            showBottomsheet(context);

            },
             child: Icon(Icons.sort),
             
          // hoverColor:Colors.red,
            //mouseCursor:,
            )
    );
  }

  Future<void> showBottomsheet(BuildContext context) async{
    showModalBottomSheet(
      context: context
      , builder: (context){
        return Container(
          height: 200,
          
          child: Column(
            children: [
              CloseButton(
              onPressed:(){Navigator.of(context).pop();}
              ),

              SizedBox(height: 20,),
              DropdownButtonFormField(
                items: lists.map((e){
                  return DropdownMenuItem(
                    value:e,
                    child:Text(e) 
                  );
                }).toList(),
                hint: Text('sort by '),
                 onChanged:(String? value){
                  if(value!=null){
                    print(value);
                  if(value == 'Descending')
                     {sort3('DESC','price');
                  //  // text = 'DESC';
                     }
                  else 
                  if(value == 'Ascending')
                   {
                      sort3('ASC','price');
                  }
                  }
                 }
                 ),


            ],
          ),
        );
      }
      );
  }
}