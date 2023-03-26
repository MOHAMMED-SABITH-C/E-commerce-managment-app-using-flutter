import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';

//import 'db_functions2.dart';
import 'db_fundtion3.dart';

class UpdateDb03 extends StatelessWidget {
   UpdateDb03({super.key});
String name='Fruits';

final _txte1=TextEditingController();
final _txte2=TextEditingController();
final _txte3=TextEditingController();
final _txte4 =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('TABLE $name'),actions: []),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: _txte1,
                decoration: const InputDecoration(
                  label: Text('Price'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),

              ),

              SizedBox(height:20),

              TextField(
                keyboardType: TextInputType.number,
                controller: _txte2,
                decoration: const InputDecoration(
                  label: Text('Count'),
                  border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10)))
                ),
              ),

              SizedBox(height: 20,),

              TextField(
                controller: _txte3,
                
                decoration: InputDecoration(
                  hintText: 'name spacify the raw ',
                  label: Text('name'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                controller: _txte4,
                decoration: InputDecoration(
                  hintText: 'tenuer',
                  label: Text('valid upto'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),
              SizedBox(height: 20,),


              ElevatedButton.icon(
                onPressed: (){
                    sendDataUp2();
                    Navigator.of(context).pop();

                },
                 icon: Icon(Icons.update_sharp),
                  label: Text('UPDATE')
                  )
                  
            ],
          ),
        )
        ),
    );
  }

  Future<void> sendDataUp2() async{
    final price = _txte1.text.trim();
    final count = _txte2.text.trim();
    final name = _txte3.text.trim();
    final valid = _txte4.text.trim();

    
                updateDb3(price, count,valid, name);
  }
}