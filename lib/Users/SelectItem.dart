import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/Users/Search&sortuser.dart';
import 'package:flutter_application_2/buttenNavig.dart';
import 'package:flutter_application_2/list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectItems extends StatelessWidget {
   SelectItems({super.key});



int index =0;

final List imgList =[
  Image.asset('lib/images/i1.jpg'),
  Image.asset('lib/images/i2.jpg'),
  Image.asset('lib/images/i3.jpg'),
  Image.asset('lib/imges/i5.png')
];

final _List =[
    'Electronic Devices',
    'Vegitables',
    'Fruits',
];
  @override
  Widget build(BuildContext context) {
    // print()
    return Scaffold(
      //appBar: AppBar(title: Text('USER'),),

      body: Container(
        child: Center(
            child: ListView.separated(
              itemCount: _List.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(_List[index]),
                  //subtitle: Text('D'),
                 // leading: Image(image: imgList[index],width: 5,height: 5,),
                  onTap: () {

                    Navigator.of(context).push(
                      MaterialPageRoute(builder:(context){
                      //  return listcreation0(type: _List[index]);
                      return SearchSortU(num: index);
                  },)
                    );
                  },
                );
              }),
                separatorBuilder: (context, index) {
                  return Divider(thickness: 3,color: Colors.black,);
                },
               // itemCount: 4,
                
              ),
            ),
      ),
      
    );
  }

//   signout(BuildContext context) async{
//  //   final sharedPre=await SharedPreferences.getInstance();
//  //   await sharedPre.clear();
//      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>BottomNavigation(table: 'Electronic Devices',)),(route)=>false);
//   }

  
}

