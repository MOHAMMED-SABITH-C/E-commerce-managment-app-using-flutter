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
                                  //PrintBill(Uname:data.name,phone: data.phone,email: data.email,objName:widget.name,price: widget.price,count: widget.count,);
                            //  return ListTile(
                            //     title: Text(data.name),
                            //     subtitle: Text(data.phone),
                            //     leading: CircleAvatar(radius: 30),
                            //     hoverColor: Colors.red,
                            //     onTap: () {
                            //       // Navigator.of(context).push(
                            //       //   MaterialPageRoute(builder: (context){
                            //       //     return Buyobj(name:data.name,table: 'Electronic Devices',);
                            //       //   })
                            //       // );
                            // //      listcreation0(type: 'Electronic Devices',);
                            //     },
                            //     trailing: IconButton(onPressed:(){
                                  
                            //       if(data.name!=null)
                            //      //   deleteStudent(data.name);
                            //      print(data.name);
                            //     }, 
                            //     icon:Icon(Icons.delete)
                            //     ),
                            //   );
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

