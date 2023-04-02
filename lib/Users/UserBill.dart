import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/Users/db_functionU.dart';
import 'package:flutter_application_2/Users/printBill.dart';
import 'package:flutter_application_2/model/data_model.dart';

class UserBill extends StatelessWidget {
   UserBill({super.key,required this.from,required this.phone,required this.name,required this.count,required this.price});
  late String from;
  late String phone;
  late String name;
  late String count;
  late String price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Electronic Devices"),),
      body: SafeArea( 
         child: ValueListenableBuilder(
                        valueListenable: UserModelNotifier1, 
                        builder: (BuildContext context, List<UserModel> studentList, Widget? child){
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final data = studentList[index];
                                  print(data.name+'hiBill');
                                  return Expanded(child: Column(),);
                                
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: studentList.length,
                           // reverse: true,
                            );
                        }
                  ),
                  
      ),
      );
      
  }
}

