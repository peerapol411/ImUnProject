// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:pie_chart/pie_chart.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project_mom/controller/im_un_controller.dart';
import 'package:project_mom/database/im_un_database.dart';
import 'package:project_mom/routes/MenuDailyDinner.dart';
import 'package:project_mom/routes/MenuDailyLunch.dart';

import 'MenuDailyBreakfast.dart';

class menuDailyMain extends StatefulWidget {
  const menuDailyMain({Key? key}) : super(key: key);

  @override
  State<menuDailyMain> createState() => _menuDailyMainState();
}

class _menuDailyMainState extends State<menuDailyMain> {
  ImUnController _controller = Get.put(ImUnController());
  bool getClick = false;
  bool indexSelected1 = false;
  bool indexSelected2 = false;
  int qtyBreakfast = 0;
  int qtyLunch = 0;
  int qtyDinner = 0;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    if (_controller.dataTransactionIBW.isEmpty) {
    } else {
      _controller.calPerdate.text = _controller.calperdateSave;
    }

    if (_controller.dataTransactionProtein.isEmpty) {
    } else {
      _controller.proteinPerdate.text = _controller.proteinPart;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('คำนวณโปรตีนใน 1 วัน'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'ข้อมูลโภชนาการของคุณ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 25, right: 25),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Text('คำนวณโปรตีนโดยระบุโปรตีนที่คุณรับประทานใน 1 วัน'),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                height: 300,
                color: Color(0xFFd9d5d4),
                width: double.infinity,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await _controller.loadTransactionBreakfast();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const menuDailyBreakfast()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          color: Color(0xFFc8e5e6),
                          elevation: 3,
                          child: Center(
                            child: Text(
                              'อาหารเช้า',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF080808),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await _controller.loadTransactionLunch();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const menuDailyLunch()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          color: Color(0xFFe6ddc8),
                          elevation: 3,
                          child: Center(
                            child: Text(
                              'อาหารกลางวัน',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF080808),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await _controller.loadTransactionDinner();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const menuDailyDinner()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          color: Color(0xFFc8d0e6),
                          elevation: 3,
                          child: Center(
                            child: Text(
                              'อาหารเย็น',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF080808),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  if (_controller.check1 == false ||
                      _controller.check2 == false ||
                      _controller.check3 == false) {
                    Flushbar(
                      message: "กรุณาบันทึกอาหารที่รับประทานให้ครบทั้งสามมื้อ",
                      icon: Icon(
                        Icons.info_outline,
                        size: 28.0,
                        color: Colors.red[300],
                      ),
                      margin: EdgeInsets.all(6.0),
                      flushbarStyle: FlushbarStyle.FLOATING,
                      flushbarPosition: FlushbarPosition.TOP,
                      textDirection: Directionality.of(context),
                      borderRadius: BorderRadius.circular(12),
                      duration: Duration(seconds: 3),
                      leftBarIndicatorColor: Colors.red[300],
                    ).show(context);
                  } else {
                    await _controller.loadTransactionBreakfast();
                    await _controller.loadTransactionLunch();
                    await _controller.loadTransactionDinner();

                    _controller.totalValue = 0.0;
                    _controller.totalCal = 0.0;

                    await _controller.calculateProtein();
                    await _controller.calculateCal();
                    getClick = true;
                    setState(() {});
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                  height: 80,
                  width: double.infinity,
                  child: Card(
                    color: Colors.green,
                    elevation: 3,
                    child: Center(
                      child: Text(
                        'คำนวณ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: getClick,
                child: double.parse(_controller.proteinPerdate.text) == 0.0
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              'ยังไม่ได้คำนวณโปรตีน/แคลอรี่',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'โปรดคำนวณโปรตีน/แคลอรี่ก่อน',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Text(
                              'โปรตีนที่ต้องได้รับต่อวัน คือ ' +
                                  _controller.proteinPerdate.text +
                                  ' ส่วน',
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: PieChart(
                                dataMap: _controller.map,
                                chartType: ChartType.ring,
                                baseChartColor: Colors.grey[300]!,
                                colorList: [Colors.green.shade600, Colors.red],
                              ),
                            ),
                            _controller.result == 0
                                ? Text(
                                    'ยินดีด้วย ทานโปรตีนครบจำนวนแล้ว',
                                  )
                                : Text(
                                    'ยังขาดโปรตีน ' +
                                        _controller.result.toStringAsFixed(2) +
                                        ' ส่วน',
                                  ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                'แคลอรี่ที่ต้องได้รับต่อวัน คือ ' +
                                    _controller.calPerdate.text +
                                    ' Kcal',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: PieChart(
                                dataMap: _controller.map2,
                                chartType: ChartType.ring,
                                baseChartColor: Colors.grey[300]!,
                                colorList: [
                                  Colors.blue.shade700,
                                  Colors.orange
                                ],
                              ),
                            ),
                            _controller.result2 == 0
                                ? Text(
                                    'ยินดีด้วย ทานอาหารครบตามจำนวนแคลอรี่แล้ว',
                                  )
                                : Text(
                                    'ยังขาดแคลอรี่ ' +
                                        _controller.result2.toStringAsFixed(2) +
                                        ' Kcal',
                                  ),
                            InkWell(
                              onTap: () async {
                                bool count;
                                bool count2;
                                if (_controller.result > 0) {
                                  count = true;
                                } else {
                                  count = false;
                                }

                                if (_controller.result2 > 0) {
                                  count2 = true;
                                } else {
                                  count2 = false;
                                }
                                var statement = [
                                  _controller.totalValue,
                                  DateTime.now().toString(),
                                  count,
                                  _controller.result,
                                  _controller.totalCal,
                                  _controller.result2,
                                  count2
                                ];
                                var db = ImUnDB(dbName: "ImUnTransaction.db");
                                await db.InsertData(statement);
                                print(db);

                                showDialog<String>(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(Duration(seconds: 2), () {
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 40),
                                height: 80,
                                width: double.infinity,
                                child: Card(
                                  color: Color(0xFFc8e5e6),
                                  elevation: 3,
                                  child: Center(
                                    child: Text(
                                      'บันทึกข้อมูล',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF080808),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
