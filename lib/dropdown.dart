import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class dropdownButton extends StatelessWidget {
   dropdownButton({Key? key}) : super(key: key);

final _list = [
  'Phone',
  'Acceseries',
  'Laptop',
];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    //return Container(
      body:Center(
        child: DropdownButtonFormField(
          hint: Text('select'),
          items: _list.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
          );
          }).toList() ,
           onChanged: (value){
           // print(value);
           }),
      )
    );
  }
}