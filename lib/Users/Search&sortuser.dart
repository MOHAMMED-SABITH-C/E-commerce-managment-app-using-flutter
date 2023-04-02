import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/3rddb/db_fundtion3.dart';
import 'package:flutter_application_2/Displaydb.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/dropdown.dart';
import 'package:flutter_application_2/list.dart';
import 'package:flutter_application_2/seconddb/db_functions2.dart';


class SearchSortU extends StatelessWidget {
   SearchSortU({super.key,required this.num});
   late int num=0;
final _search = TextEditingController();

final _lists = [
  'MOBILE',
  'LAPTOP',
  'HOME APPLICANS',
];
final _lists1 = [
  'PACKET',
  'LOOSE'
];
final _item =[
  'Electronic Devices',
  'Vegitables',
  'Fruits'
];
final lists = [
  'Ascending',
  'Descending',
];
late String types1 ;

late String text = '';
late String type ='';
late String types = 'Electronic Devices1S' ;
  @override
  Widget build(BuildContext context) {
     getAllStudents();
    getAllStudents2();
    getAllStudents3();
    return Scaffold(
     appBar: AppBar(title: Text(_item[num]),actions: []),
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // SizedBox(height: 50,),
              SizedBox(height: 5,),
              TextField(
                controller: _search,
                decoration: InputDecoration(
                  label: Text('name'),
                  hintText: 'Enter the name for search',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ,suffixIcon: IconButton(
                    onPressed: (){
                      if(num==0){

                      types = 'Electronic Devices';
                  text= _search.text.trim();
                      SearchDb('name',text);
                      SearchSortU(num: 0,);
                      }
                      else if(num==1){
                        text= _search.text.trim();
                        SearchDb2('name',text);
                      }
                      else if(num==2){
                         text= _search.text.trim();
                      SearchDb3('name',text);
                      }
                  }, icon: Icon(Icons.search))
                ),
              ),
              SizedBox(height: 10,),
                               // Expanded(child: select(),),
                
            
              DropdownButtonFormField(
                items:num==0? _lists.map((e){
               
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                },).toList()
                :_lists1.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                },).toList(),
                hint: Text('Select catogory')
                ,onChanged: (String ? value){
                  type =value!;
                  if(num==0){
                  SearchDb('type',type);
                  }
                  else if(num==1){
                     SearchDb2('type',type);
                  }
                  else{
                    SearchDb3('type',type);
                  }
                  },
                  
                  ),
              ElevatedButton.icon(
                onPressed: (){
                  text= _search.text.trim();
                  if(num==0){

                  SearchDbA(type,text);
                  }
                  else if(num==1){
                    SearchDbA2(type,text);
                  }else{
                  SearchDbA3(type,text);
                  }
              },
               icon:Icon(Icons.search),
                label: Text('Search'))
              ,

            ],
          ),
        ),

        ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            showBottomsheet(context);

            },
             child: Icon(Icons.sort),
             
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
                     {
                      if(num==0){
                      sort('DESC','price');
                      }
                      else if(num==1){
                        sort2('DESC','price');
                      }
                      else if(num==2){
                        sort3('DESC','price');
                      }
                     }
                  if(value == 'Ascending')
                   {
                    if(num==0){
                      sort('ASC','price');
                    }
                    else if(num==1){
                      sort2('ASC','price');
                    }
                    else if(num==2){
                       sort3('ASC','price');
                    }
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
