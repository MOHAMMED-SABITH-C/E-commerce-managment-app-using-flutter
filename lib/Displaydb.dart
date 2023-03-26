import 'package:flutter/material.dart';
import 'package:flutter_application_2/3rddb/db_fundtion3.dart';
import 'package:flutter_application_2/4rthdb/db_function4.dart';
import 'package:flutter_application_2/db/functions/db_functions.dart';
import 'package:flutter_application_2/model/data_model.dart';

import 'buttenNavig.dart';
import 'seconddb/db_functions2.dart';

class listcreations extends StatefulWidget {
  listcreations({Key? key, required this.type}) : super(key: key);
  final type;

  final _list = [
    'Electronic Devices',
    'vegitables',
    'Fruits',
    'crew',
  ];

  @override
  State<listcreations> createState() =>
      type == 'Electronic Devices' ? _tableDisplay1() :type == 'vegitables'? _tableDisplay2():type == 'Fruits'? _tableDisplay3():
      type =='Electronic Devices1S'? _tableDisplay1S():type == 'Shirts'?_tableDisplay4():_tableDisplay1();
}

class _tableDisplay1 extends State<listcreations> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Center(
      child: Column(
        children: [
          Table(
            border: TableBorder(bottom: BorderSide(width: 1)),
            columnWidths: {
              0: FlexColumnWidth(2.8),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2.7),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(3.5),
            },
            children: [
              TableRow(
                  //  decoration: ,
                  children: [
                    Column(
                      children: [
                        Text(
                          'NAME',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'PRICE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'TYPE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'NO.OF',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'WARRANTY',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ]),
            ],
          ),
          SizedBox(height: 25,),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: StudnetModelNotifier,
              builder: (BuildContext context, List<StudentModel> studentList,
                  Widget? child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = studentList[index];
                    return Table(
                      border: const TableBorder(
                          //top: BorderSide(width: 1,),
                          bottom: BorderSide(width: 1)),
                      columnWidths: {
                        0: FlexColumnWidth(2.8),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2.7),
                        3: FlexColumnWidth(2.2),
                        4: FlexColumnWidth(3.5),
                      },
                      children: [
                        TableRow(
                            //   decoration: BoxDecoration(size),
                            children: [
                              Column(
                                children: [Text('' + data.name)],),
                              Column(children: [Text((data.price).toString())],),
                              Column(children: [Text(data.type)],),
                              Column( children: [Text(data.count)],),
                              Column(children: [Text(data.duration)],),
                            ])
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: studentList.length,
                  // reverse: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class _tableDisplay2 extends State<listcreations> {
  @override
  Widget build(BuildContext context) {
    getAllStudents2();
    return Center(
      child: Column(
        children: [
          Table(
            border: TableBorder(bottom: BorderSide(width: 1)),
            columnWidths: {
              0: FlexColumnWidth(2.8),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(3),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(2.5),
            },
            children: [
              TableRow(
                  //  decoration: ,
                  children: [
                    Column(
                      children: [
                        Text(
                          'NAME',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'PRICE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'TYPE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'NO.OF',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'TENURE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ]),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: StudnetModelNotifier2,
              builder: (BuildContext context, List<StudentModel2> studentList2,
                  Widget? child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = studentList2[index];
                    return Table(
                      border: TableBorder(
                          //top: BorderSide(width: 1,),
                          bottom: BorderSide(width: 1)),
                      columnWidths: {
                        0: FlexColumnWidth(2.8),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(3),
                        3: FlexColumnWidth(2.2),
                        4: FlexColumnWidth(2.5),
                      },
                      children: [
                        TableRow(
                            //   decoration: BoxDecoration(size),
                            children: [
                              Column(
                                children: [Text('' + data.name)],
                              ),
                              Column(
                                children: [Text((data.price).toString())],
                              ),
                              Column(
                                children: [Text(data.type)],
                              ),
                              Column(children: [Text(data.count)],),
                              Column(children: [Text(data.duration)],),
                            ])
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: studentList2.length,
                  // reverse: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _tableDisplay1S extends State<listcreations> {
  @override
  Widget build(BuildContext context) {
    //getAllStudents3();
    return Center(
      child: Column(
        children: [
          Table(
            border: TableBorder(bottom: BorderSide(width: 1)),
            columnWidths: {
              0: FlexColumnWidth(2.8),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(3),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(2.5),
            },
            children: [
              TableRow(
                  //  decoration: ,
                  children: [
                    Column(children: [Text('NAME',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('PRICE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('TYPE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('NO.OF',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('TENURE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                  ]),
            ],
          ),
          SizedBox(height: 25,),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: StudnetModelNotifier1S,
              builder: (BuildContext context, List<StudentModel1S> studentList2,
                  Widget? child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = studentList2[index];
                    return Table(
                      border: TableBorder(
                          //top: BorderSide(width: 1,),
                          bottom: BorderSide(width: 1)),
                      columnWidths: {
                        0: FlexColumnWidth(2.8),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(3),
                        3: FlexColumnWidth(2.2),
                        4: FlexColumnWidth(2.5),
                      },
                      children: [
                        TableRow(
                            //   decoration: BoxDecoration(size),
                            children: [
                              Column(children: [Text('' + data.name)],),
                              Column(children: [Text(data.price)],),
                              Column(children: [Text(data.type)],),
                              Column(children: [Text(data.count)],),
                              Column(children: [Text(data.duration)],),
                            ])
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: studentList2.length,
                  // reverse: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//table3

class _tableDisplay3 extends State<listcreations> {
  @override
  Widget build(BuildContext context) {
    getAllStudents3();
    return Center(
      child: Column(
        children: [
          Table(
            border: TableBorder(bottom: BorderSide(width: 1)),
            columnWidths: {
              0: FlexColumnWidth(2.8),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(3),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(2.5),
            },
            children: [
              TableRow(
                  //  decoration: ,
                  children: [
                    Column(children: [Text('NAME',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('PRICE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('TYPE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('NO.OF',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('TENURE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                  ]),
            ],
          ),
          SizedBox(height: 25,),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: StudnetModelNotifier3,
              builder: (BuildContext context, List<StudentModel3> studentList2,
                  Widget? child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = studentList2[index];
                    return Table(
                      border: TableBorder(
                          //top: BorderSide(width: 1,),
                          bottom: BorderSide(width: 1)),
                      columnWidths: {
                        0: FlexColumnWidth(2.8),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(3),
                        3: FlexColumnWidth(2.2),
                        4: FlexColumnWidth(2.5),
                      },
                      children: [
                        TableRow(
                            //   decoration: BoxDecoration(size),
                            children: [
                              Column(children: [Text('' + data.name)],),
                              Column(children: [Text(data.price)],),
                              Column(children: [Text(data.type)],),
                              Column(children: [Text(data.count)],),
                              Column(children: [Text(data.duration)],),
                            ])
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: studentList2.length,
                  // reverse: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//table4


class _tableDisplay4 extends State<listcreations> {
  @override
  Widget build(BuildContext context) {
    getAllStudents4();
    return Center(
      child: Column(
        children: [
          Table(
            border: TableBorder(bottom: BorderSide(width: 1)),
            columnWidths: {
              0: FlexColumnWidth(2.8),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(3),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(2.5),
            },
            children: [
              TableRow(
                  //  decoration: ,
                  children: [
                    Column(children: [Text('NAME',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('SIZE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('PRICE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('TYPE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('NO.OF',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                    Column(children: [Text('GENDER',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)],),
                  ]),
            ],
          ),
          SizedBox(height: 25,),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: StudnetModelNotifier4,
              builder: (BuildContext context, List<StudentModel4> studentList2,
                  Widget? child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = studentList2[index];
                    return Table(
                      border: TableBorder(
                          //top: BorderSide(width: 1,),
                          bottom: BorderSide(width: 1)),
                      columnWidths: {
                        0: FlexColumnWidth(2.8),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                        3: FlexColumnWidth(2.5),
                        4: FlexColumnWidth(2.5),
                        5:FlexColumnWidth(2),
                      },
                      children: [
                        TableRow(
                            //   decoration: BoxDecoration(size),
                            children: [
                              Column(children: [Text('' + data.name)],),
                              Column(children: [Text(data.size)],),
                              Column(children: [Text(data.price)],),
                              Column(children: [Text(data.type)],),
                              Column(children: [Text(data.count)],),
                              Column(children: [Text(data.gender)],),
                            ])
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: studentList2.length,
                  // reverse: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
