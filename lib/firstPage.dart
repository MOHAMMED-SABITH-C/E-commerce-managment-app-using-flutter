import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class homeScreen extends StatefulWidget {
   const homeScreen({Key? key}) : super(key: key);
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
    int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
         setState(() {
          count=count+1; 
         }); 
      } ),
    );
  }
}