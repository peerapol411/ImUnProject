// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:project_mom/controller/im_un_controller.dart';
import 'package:get/get.dart';

import '../database/im_un_database.dart';

class menuDailyBreakfast extends StatefulWidget {
  const menuDailyBreakfast({Key? key}) : super(key: key);

  @override
  State<menuDailyBreakfast> createState() => _menuDailyBreakfastState();
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}

class _menuDailyBreakfastState extends State<menuDailyBreakfast> {
  var timeFormat = DateFormat('dd/MM/yyyy HH:mm');

  List<NewItem> items = <NewItem>[
    new NewItem(
        false,
        'หมวดเนื้อสัตว์',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(children: <Widget>[
              //put the children here
            ])),
        new Icon(Icons.list)),
    //give all your items here
  ];

  List<NewItem> items2 = <NewItem>[
    new NewItem(
        false,
        'หมวดข้าว - แป้ง',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(children: <Widget>[
              //put the children here
            ])),
        new Icon(Icons.list)),
    //give all your items here
  ];

  List<NewItem> items3 = <NewItem>[
    new NewItem(
        false,
        'หมวดผลไม้',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(children: <Widget>[
              //put the children here
            ])),
        new Icon(Icons.list)),
    //give all your items here
  ];

  List<NewItem> items4 = <NewItem>[
    new NewItem(
        false,
        'หมวดผักสุก',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(children: <Widget>[
              //put the children here
            ])),
        new Icon(Icons.list)),
    //give all your items here
  ];

  List<NewItem> items5 = <NewItem>[
    new NewItem(
        false,
        'หมวดนม',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(children: <Widget>[
              //put the children here
            ])),
        new Icon(Icons.list)),
    //give all your items here
  ];

  List<NewItem> items6 = <NewItem>[
    new NewItem(
        false,
        'หมวดไขมัน',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(children: <Widget>[
              //put the children here
            ])),
        new Icon(Icons.list)),
    //give all your items here
  ];

  ImUnController _controller = Get.put(ImUnController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เมนูอาหารแนะนำ'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'คำนวณโปรตีนมื้อเช้า',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      IconButton(
                        onPressed: () async {
                          await _controller.loadTransactionBreakfast();
                          showDialog<String>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Icon(
                                  Icons.info_outline,
                                  size: 40,
                                  color: Colors.green,
                                ),
                                content: Container(
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('บันทึกล่าสุด : '),
                                          _controller.lastesCalBreak == ''
                                              ? Text('ยังไม่คำนวณ')
                                              : Text(timeFormat.format(
                                                  DateTime.parse(_controller
                                                      .lastesCalBreak))),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('โปรตีนมื้อเช้า : '),
                                          _controller.lastesCalPro == ''
                                              ? Text('ยังไม่คำนวณ')
                                              : Text(double.parse(_controller
                                                          .lastesCalPro)
                                                      .toStringAsFixed(2) +
                                                  ' ส่วน'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('แคลอรี่มื้อเช้า : '),
                                          _controller.lastesCalCal == ''
                                              ? Text('ยังไม่คำนวณ')
                                              : Text(_controller.lastesCalCal +
                                                  ' kCal'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.history_outlined),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          items[index].isExpanded = !items[index].isExpanded;
                        });
                      },
                      children: items.map((item) {
                        return new ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return new ListTile(
                                leading: item.iconpic,
                                title: new Text(
                                  item.header,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ));
                          },
                          isExpanded: item.isExpanded,
                          body: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'อาหาร 1 ส่วน',
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'จำนวนที่รับประทาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          '(ช้อนโต๊ะ)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'โปรตีน',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(ส่วน)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'พลังงาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(กิโลแคลอรี่)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: foodNameLowest.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: index % 2 == 0
                                              ? Colors.white
                                              : Colors.grey.shade300,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 85,
                                              child: Text(
                                                foodNameLowest[index],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: index % 2 == 0
                                                        ? Color(0xFFdadfeb)
                                                        : Colors.black26,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 8),
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .firstValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .firstValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      _controller
                                                          .firstValue[index]
                                                          .text,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .firstValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .firstValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add_circle,
                                                        size: 20,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                (double.parse(_controller
                                                            .firstValue[index]
                                                            .text) /
                                                        2)
                                                    .toStringAsFixed(2),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              margin: EdgeInsets.only(right: 8),
                                              alignment: Alignment.center,
                                              child: Text(
                                                (int.parse(_controller
                                                            .firstValue[index]
                                                            .text) *
                                                        35)
                                                    .toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: foodNameLow.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            color: index % 2 == 0
                                                ? Colors.white
                                                : Colors.grey.shade300),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 85,
                                              child: Text(
                                                foodNameLow[index],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: index % 2 == 0
                                                        ? Color(0xFFdadfeb)
                                                        : Colors.black26,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 8),
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .secondValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .secondValue[
                                                                      index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      _controller
                                                          .secondValue[index]
                                                          .text,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .secondValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .secondValue[
                                                                      index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add_circle,
                                                        size: 20,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                (double.parse(_controller
                                                            .secondValue[index]
                                                            .text) /
                                                        2)
                                                    .toStringAsFixed(2),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                (int.parse(_controller
                                                            .secondValue[index]
                                                            .text) *
                                                        55)
                                                    .toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: foodNameMedium.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            color: index % 2 == 0
                                                ? Colors.white
                                                : Colors.grey.shade300),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 85,
                                              child: Text(
                                                foodNameMedium[index],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: index % 2 == 0
                                                        ? Color(0xFFdadfeb)
                                                        : Colors.black26,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 8),
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .thirdValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .thirdValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      _controller
                                                          .thirdValue[index]
                                                          .text,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .thirdValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .thirdValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add_circle,
                                                        size: 20,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                (double.parse(_controller
                                                            .thirdValue[index]
                                                            .text) /
                                                        2)
                                                    .toStringAsFixed(2),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                (int.parse(_controller
                                                            .thirdValue[index]
                                                            .text) *
                                                        75)
                                                    .toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: foodNameHigh.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            color: index % 2 == 1
                                                ? Colors.white
                                                : Colors.grey.shade300),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 85,
                                              child: Text(
                                                foodNameHigh[index],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: index % 2 == 1
                                                        ? Color(0xFFdadfeb)
                                                        : Colors.black26,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 8),
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .fourthValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .fourthValue[
                                                                      index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      _controller
                                                          .fourthValue[index]
                                                          .text,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .fourthValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .fourthValue[
                                                                      index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add_circle,
                                                        size: 20,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text((double.parse(
                                                          _controller
                                                              .fourthValue[
                                                                  index]
                                                              .text) /
                                                      2)
                                                  .toStringAsFixed(2)),
                                            ),
                                            Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                (int.parse(_controller
                                                            .fourthValue[index]
                                                            .text) *
                                                        100)
                                                    .toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              Container(
                                height: 20,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    new ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          items2[index].isExpanded = !items2[index].isExpanded;
                        });
                      },
                      children: items2.map((NewItem item) {
                        return new ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return new ListTile(
                                leading: item.iconpic,
                                title: new Text(
                                  item.header,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ));
                          },
                          isExpanded: item.isExpanded,
                          body: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'ข้าว - แป้ง',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '1 ส่วน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'จำนวนที่รับประทาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 30),
                                        child: Text(
                                          '(ทัพพี)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'โปรตีน',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(ส่วน)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'พลังงาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(กิโลแคลอรี่)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: Container(
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: rice.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                              color: index % 2 == 0
                                                  ? Colors.white
                                                  : Colors.grey.shade300),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 85,
                                                child: Text(
                                                  rice[index],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: index % 2 == 0
                                                          ? Color(0xFFdadfeb)
                                                          : Colors.black26,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 8),
                                                width: 120,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: InkWell(
                                                        onTap: () {
                                                          int value = int.parse(
                                                              _controller
                                                                  .riceValue[
                                                                      index]
                                                                  .text);
                                                          setState(() {
                                                            if (value <= 0) {
                                                            } else {
                                                              value--;
                                                            }
                                                            _controller
                                                                    .riceValue[
                                                                        index]
                                                                    .text =
                                                                value
                                                                    .toString();
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.remove_circle,
                                                          size: 20,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        _controller
                                                            .riceValue[index]
                                                            .text,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: InkWell(
                                                        onTap: () {
                                                          int value = int.parse(
                                                              _controller
                                                                  .riceValue[
                                                                      index]
                                                                  .text);
                                                          setState(() {
                                                            value++;
                                                            _controller
                                                                    .riceValue[
                                                                        index]
                                                                    .text =
                                                                value
                                                                    .toString();
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.add_circle,
                                                          size: 20,
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                padding:
                                                    EdgeInsets.only(left: 4),
                                                child: Text(
                                                  (int.parse(_controller
                                                              .riceValue[index]
                                                              .text) *
                                                          0.3)
                                                      .toStringAsFixed(2),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  (int.parse(_controller
                                                              .riceValue[index]
                                                              .text) *
                                                          80)
                                                      .toString(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ),
                              Container(
                                height: 20,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // ignore: unnecessary_new

                    new ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          items3[index].isExpanded = !items3[index].isExpanded;
                        });
                      },
                      children: items3.map((NewItem item) {
                        return new ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return new ListTile(
                                leading: item.iconpic,
                                title: new Text(
                                  item.header,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ));
                          },
                          isExpanded: item.isExpanded,
                          body: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'ผลไม้ 1 ส่วน',
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'จำนวนที่รับประทาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          '(ผล)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'โปรตีน',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(ส่วน)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'พลังงาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(กิโลแคลอรี่)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: fruit.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            color: index % 2 == 0
                                                ? Colors.white
                                                : Colors.grey.shade300),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 85,
                                              child: Text(
                                                fruit[index],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: index % 2 == 0
                                                        ? Color(0xFFdadfeb)
                                                        : Colors.black26,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 8),
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .fruitValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .fruitValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      _controller
                                                          .fruitValue[index]
                                                          .text,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .fruitValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .fruitValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add_circle,
                                                        size: 20,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                (int.parse(_controller
                                                            .fruitValue[index]
                                                            .text) *
                                                        0)
                                                    .toStringAsFixed(2),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                (int.parse(_controller
                                                            .fruitValue[index]
                                                            .text) *
                                                        60)
                                                    .toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              Container(
                                height: 20,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    new ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          items4[index].isExpanded = !items4[index].isExpanded;
                        });
                      },
                      children: items4.map((NewItem item) {
                        return new ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return new ListTile(
                                leading: item.iconpic,
                                title: new Text(
                                  item.header,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ));
                          },
                          isExpanded: item.isExpanded,
                          body: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'ผักสุก 1 ส่วน',
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'จำนวนที่รับประทาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          '(ทัพพี)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'โปรตีน',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(ส่วน)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'พลังงาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(กิโลแคลอรี่)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: veget.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            color: index % 2 == 0
                                                ? Colors.white
                                                : Colors.grey.shade300),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 85,
                                              child: Text(
                                                veget[index],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: index % 2 == 0
                                                        ? Color(0xFFdadfeb)
                                                        : Colors.black26,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 8),
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .vegetValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .vegetValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      _controller
                                                          .vegetValue[index]
                                                          .text,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .vegetValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .vegetValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add_circle,
                                                        size: 20,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                (int.parse(_controller
                                                            .vegetValue[index]
                                                            .text) *
                                                        0)
                                                    .toStringAsFixed(2),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                (int.parse(_controller
                                                            .vegetValue[index]
                                                            .text) *
                                                        25)
                                                    .toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              Container(
                                height: 20,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    new ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          items5[index].isExpanded = !items5[index].isExpanded;
                        });
                      },
                      children: items5.map((NewItem item) {
                        return new ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return new ListTile(
                                leading: item.iconpic,
                                title: new Text(
                                  item.header,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ));
                          },
                          isExpanded: item.isExpanded,
                          body: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'นม 1 ส่วน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          '(240 ซีซี)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'จำนวนที่รับประทาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          '(ซีซี)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          'โปรตีน',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          '(ส่วน)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'พลังงาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(กิโลแคลอรี่)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: milk.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            color: index % 2 == 0
                                                ? Colors.white
                                                : Colors.grey.shade300),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 85,
                                              child: Text(
                                                milk[index],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: index % 2 == 0
                                                        ? Color(0xFFdadfeb)
                                                        : Colors.black26,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 8),
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .milkValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value = value - 10;
                                                          }
                                                          _controller
                                                                  .milkValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      _controller
                                                          .milkValue[index]
                                                          .text,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .milkValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value = value + 10;
                                                          _controller
                                                                  .milkValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add_circle,
                                                        size: 20,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                ((int.parse(_controller
                                                            .milkValue[index]
                                                            .text) /
                                                        240)
                                                    .toStringAsFixed(2)),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                index == 0
                                                    ? ((int.parse(_controller
                                                                .milkValue[
                                                                    index]
                                                                .text) *
                                                            0.625)
                                                        .toStringAsFixed(2))
                                                    : index == 1
                                                        ? ((int.parse(_controller
                                                                    .milkValue[
                                                                        index]
                                                                    .text) *
                                                                0.5)
                                                            .toStringAsFixed(2))
                                                        : ((int.parse(_controller
                                                                    .milkValue[
                                                                        index]
                                                                    .text) *
                                                                0.33)
                                                            .toStringAsFixed(
                                                                2)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              Container(
                                height: 20,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    new ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          items6[index].isExpanded = !items6[index].isExpanded;
                        });
                      },
                      children: items6.map((NewItem item) {
                        return new ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return new ListTile(
                                leading: Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: item.iconpic,
                                ),
                                title: new Text(
                                  item.header,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ));
                          },
                          isExpanded: item.isExpanded,
                          body: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'ไขมัน 1 ส่วน ',
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'จำนวนที่รับประทาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          '(ตามปริมาณ)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'โปรตีน',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(ส่วน)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'พลังงาน',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '(กิโลแคลอรี่)',
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: oil.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            color: index % 2 == 0
                                                ? Colors.white
                                                : Colors.grey.shade300),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 85,
                                              child: Text(
                                                oil[index],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: index % 2 == 0
                                                        ? Color(0xFFdadfeb)
                                                        : Colors.black26,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 8),
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .oilValue[index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .oilValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      _controller
                                                          .oilValue[index].text,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        int value = int.parse(
                                                            _controller
                                                                .oilValue[index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .oilValue[index]
                                                                  .text =
                                                              value.toString();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add_circle,
                                                        size: 20,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                ((int.parse(_controller
                                                            .oilValue[index]
                                                            .text) *
                                                        0)
                                                    .toStringAsFixed(2)),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                ((int.parse(_controller
                                                            .oilValue[index]
                                                            .text) *
                                                        45)
                                                    .toString()),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              Container(
                                height: 20,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
              ),
              InkWell(
                onTap: () async {
                  await _controller.clearDataSave();
                  await _controller.calProteinBreakfast();
                  await _controller.calCalBreakfast();
                  var statement = [
                    _controller.totalValueBreakfast,
                    _controller.totalCalBreakfast,
                    DateTime.now().toString(),
                  ];
                  var db = ImUnDB(dbName: "ImUnTransaction.db");
                  await db.InsertDataBreakfast(statement);
                  print(db);

                  showDialog<String>(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pop(context);

                        Navigator.pop(context);
                      });
                      return AlertDialog(
                        title: const Icon(
                          Icons.check_circle_outline_rounded,
                          size: 60,
                          color: Colors.green,
                        ),
                        content: const Text(
                          'บันทึกข้อมูลเสร็จสิ้น!',
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color(0xFF4d9e49),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'ยืนยัน',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> oil = [
    'น้ำมันหมู/ไก่ 1 ช้อนชา',
    'เนยสด 1 ช้อนชา',
    'กะทิ/ครีมชีส 1 ช้อนโต๊ะ',
    'ครีมสด 2 ช้อนโต๊ะ',
    'น้ำมันพืช/เนยเทียม 1 ช้อนชา',
    'มายองเนส/น้ำสลัดข้น 1 ช้อนชา',
    'น้ำสลัดน้ำใส 1 ช้อนโต๊ะ',
    'น้ำมันมะกอก/คาโนล่า 1 ช้อนชา',
    'ถั่วลิสง 10 เมล็ด',
  ];

  List<String> milk = [
    'นมไขมันเต็มส่วน',
    'นมพร่องมันเนย',
    'นมขาดมันเนย',
  ];

  List<String> veget = [
    'ถั่วฝักยาว',
    'ดอกแค',
    'แครอท',
    'เห็ดฟาง',
    'มะเขือเปราะ',
    'ดอกกะหล่ำ',
    'ข้าวโพดอ่อน',
    'ผักกระเฉด',
    'หน่อไม้',
    'บรอกโคลี',
    'ถั่วงอก',
    'มะละกอดิบ',
  ];

  List<String> fruit = [
    'ผลไม้ขนาดกลาง ½ ผล เช่น กล้วยหอม ฝรั่ง แก้วมังกรมะม่วงสุก/ดิบ',
    'ผลไม้ค่อนข้างเล็ก 1 ผล เช่น กล้วยน้ำว้า แอปเปิ้ล ส้ม',
    'ผลไม้ขนาดเล็ก 2-3 ผล เช่น ขนุน มะขาม ส้มโอ ชมพู่',
    'ผลไม้ 4 ผล เช่น มังคุด เงาะ พุทธา',
    'ผลไม้พวง เล็กมาก 5-6 ผล เช่น ลิ้นจี่ ลำไย ลองกอง',
    'ผลไม้ขนาดใหญ่ 6-8 ชิ้นคำ เช่น แตงโม สัปปะรด มะละกอสุข',
  ];

  List<String> rice = [
    'ข้าวสวย 1 ทัพพี',
    'ข้าวเหนียว ½ ทัพพี',
    'ข้าวต้ม 2 ทัพพี',
    'ขนมจีน 1 จับ',
    'เส้นใหญ่ 1 ทัพพี',
    'วุ้นเส้น 1 ทัพพี',
    'บะหมี่ 1 ทัพพี (ครึ่งก้อน)',
    'ลูกเดือยสุก 1 ทัพพี',
    'มันเทศต้มสุก 1 ทัพพี',
    'ฟักทองสุก 1 ทัพพี',
    'ถั่วแดงสุก 1 ทัพพี',
    'ขนมปัง 1 แผ่น',
    'ข้าวโพด ½ ฝักกลาง',
    'แครกเกอร์ 8 แผ่น',
    'แครกเกอร์แผ่นเหลี่ยม 3 แผ่น',
  ];

  List<String> foodNameLowest = [
    'เนื้อปลาสุก 2 ช้อนโต๊ะ',
    'เนื้ออกไก่สุก 2 ช้อนโต๊ะ',
    'ไข่ขาว 2 ฟอง',
    'เนื้อกุ้งสุก 2 ช้อนโต๊ะ',
    'ปลาทู',
    'หมูสับ 2 ช้อนโต๊ะ',
  ];

  List<String> foodNameLow = [
    'ลูกชิ้นหมู/ไก่ 4 ลูก',
    'นมถั่วเหลือง (ไม่หวาน)',
  ];

  List<String> foodNameMedium = [
    'ไข่ไก่ 1 ฟอง',
    'เต้าหู้แข็ง 2 ช้อนโต๊ะ',
    'เต้าหู้อ่อน 2 ช้อนโต๊ะ',
    'เนื้อหมูสุก 2 ช้อนโต๊ะ',
    'เนื้อวัวสุก 2 ช้อนโต๊ะ',
  ];

  List<String> foodNameHigh = [
    'ไส้กรอก',
    'กุนเชียง',
    'หมูยอ',
    'แฮม',
    'เนื้อวัวสุก 2 ช้อนโต๊ะ',
    'หมูสับ 2 ช้อนโต๊ะ',
  ];
}

class ExpansionPanelListChecklist {}
