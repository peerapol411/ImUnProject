// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:project_mom/controller/im_un_controller.dart';
import 'package:get/get.dart';

import '../database/im_un_database.dart';

class menuDailyLunch extends StatefulWidget {
  const menuDailyLunch({Key? key}) : super(key: key);

  @override
  State<menuDailyLunch> createState() => _menuDailyLunchState();
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}

class _menuDailyLunchState extends State<menuDailyLunch> {
  List<NewItem> items = <NewItem>[
    new NewItem(
        false,
        'หมวดเนื้อสัตว์',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(children: <Widget>[
              //put the children here
            ])),
        new Icon(
          Icons.list,
        )),
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
        new Column(children: <Widget>[
          //put the children here
        ]),
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

  var timeFormat = DateFormat('dd/MM/yyyy HH:mm');

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
                        'คำนวณโปรตีนมื้อกลางวัน',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      IconButton(
                        onPressed: () async {
                          await _controller.loadTransactionLunch();

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
                                          _controller.lastesCalLunch == ''
                                              ? Text('ยังไม่คำนวณ')
                                              : Text(timeFormat.format(
                                                  DateTime.parse(_controller
                                                      .lastesCalLunch))),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('โปรตีนมื้อกลางวัน : '),
                                          _controller.lastesCalProLunch == ''
                                              ? Text('ยังไม่คำนวณ')
                                              : Text(double.parse(_controller
                                                          .lastesCalProLunch)
                                                      .toStringAsFixed(2) +
                                                  ' ส่วน'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('แคลอรี่มื้อกลางวัน : '),
                                          _controller.lastesCalCalLunch == ''
                                              ? Text('ยังไม่คำนวณ')
                                              : Text(_controller
                                                      .lastesCalCalLunch +
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
                                                : Colors.grey.shade300),
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
                                                                .firstLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .firstLunchValue[
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
                                                          .firstLunchValue[
                                                              index]
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
                                                                .firstLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .firstLunchValue[
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
                                                            .firstLunchValue[
                                                                index]
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
                                                            .firstLunchValue[
                                                                index]
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
                                              : Colors.grey.shade300,
                                        ),
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
                                                                .secondLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .secondLunchValue[
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
                                                          .secondLunchValue[
                                                              index]
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
                                                                .secondLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .secondLunchValue[
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
                                                            .secondLunchValue[
                                                                index]
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
                                                            .secondLunchValue[
                                                                index]
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
                                              : Colors.grey.shade300,
                                        ),
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
                                                  fontSize: 16,
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
                                                                .thirdLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .thirdLunchValue[
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
                                                          .thirdLunchValue[
                                                              index]
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
                                                                .thirdLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .thirdLunchValue[
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
                                                            .thirdLunchValue[
                                                                index]
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
                                                            .thirdLunchValue[
                                                                index]
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
                                                                .fourthLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .fourthLunchValue[
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
                                                          .fourthLunchValue[
                                                              index]
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
                                                                .fourthLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .fourthLunchValue[
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
                                                              .fourthLunchValue[
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
                                                            .fourthLunchValue[
                                                                index]
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
                                              : Colors.grey.shade300,
                                        ),
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
                                                                .riceLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .riceLunchValue[
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
                                                          .riceLunchValue[index]
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
                                                                .riceLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .riceLunchValue[
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
                                                (int.parse(_controller
                                                            .riceLunchValue[
                                                                index]
                                                            .text) *
                                                        0.3)
                                                    .toStringAsFixed(2),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                (int.parse(_controller
                                                            .riceLunchValue[
                                                                index]
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
                                              : Colors.grey.shade300,
                                        ),
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
                                                                .fruitLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .fruitLunchValue[
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
                                                          .fruitLunchValue[
                                                              index]
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
                                                                .fruitLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .fruitLunchValue[
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
                                                (int.parse(_controller
                                                            .fruitLunchValue[
                                                                index]
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
                                                            .fruitLunchValue[
                                                                index]
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
                                              : Colors.grey.shade300,
                                        ),
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
                                                                .vegetLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .vegetLunchValue[
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
                                                          .vegetLunchValue[
                                                              index]
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
                                                                .vegetLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .vegetLunchValue[
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
                                                (int.parse(_controller
                                                            .vegetLunchValue[
                                                                index]
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
                                                            .vegetLunchValue[
                                                                index]
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
                                              : Colors.grey.shade300,
                                        ),
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
                                                                .milkLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value = value - 10;
                                                          }
                                                          _controller
                                                                  .milkLunchValue[
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
                                                          .milkLunchValue[index]
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
                                                                .milkLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value = value + 10;
                                                          _controller
                                                                  .milkLunchValue[
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
                                                ((int.parse(_controller
                                                            .milkLunchValue[
                                                                index]
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
                                                                .milkLunchValue[
                                                                    index]
                                                                .text) *
                                                            0.625)
                                                        .toString())
                                                    : index == 1
                                                        ? ((int.parse(_controller
                                                                    .milkLunchValue[
                                                                        index]
                                                                    .text) *
                                                                0.5)
                                                            .toString())
                                                        : ((int.parse(_controller
                                                                    .milkLunchValue[
                                                                        index]
                                                                    .text) *
                                                                0.33)
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
                                              : Colors.grey.shade300,
                                        ),
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
                                                                .oilLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          if (value <= 0) {
                                                          } else {
                                                            value--;
                                                          }
                                                          _controller
                                                                  .oilLunchValue[
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
                                                          .oilLunchValue[index]
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
                                                                .oilLunchValue[
                                                                    index]
                                                                .text);
                                                        setState(() {
                                                          value++;
                                                          _controller
                                                                  .oilLunchValue[
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
                                                ((int.parse(_controller
                                                            .oilLunchValue[
                                                                index]
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
                                                            .oilLunchValue[
                                                                index]
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
                  await _controller.clearDataSave2();
                  await _controller.calProteinLunch();
                  await _controller.calCalLunch();
                  var statement = [
                    _controller.totalValueLunch,
                    _controller.totalCalLunch,
                    DateTime.now().toString(),
                  ];
                  var db = ImUnDB(dbName: "ImUnTransaction.db");
                  await db.InsertDataLunch(statement);
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
    'ผลไม้ขนาดกลาง ½ ผล',
    'ผลไม้ค่อนข้างเล็ก 1 ผล ',
    'ผลไม้ขนาดเล็ก 2-3 ผล',
    'ผลไม้ 4 ผล',
    'ผลไม้พวง เล็กมาก 5-6 ผล',
    'ผลไม้ขนาดใหญ่ 6-8 ชิ้นคำ ',
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
