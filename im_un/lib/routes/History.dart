import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project_mom/controller/im_un_controller.dart';
import 'package:project_mom/database/im_un_database.dart';

class Knowledge extends StatefulWidget {
  const Knowledge({Key? key}) : super(key: key);

  @override
  State<Knowledge> createState() => _KnowledgeState();
}

class _KnowledgeState extends State<Knowledge> {
  var myFormat = DateFormat('dd-MM-yyyy HH:mm');
  ImUnController _controller = Get.put(ImUnController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ประวัติการบันทึก'),
            Icon(Icons.calendar_month_outlined),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(
          reverse: true,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _controller.dataTransaction.length,
          itemBuilder: (BuildContext context, index) {
            return SingleChildScrollView(
              child: _controller.dataTransaction.isEmpty
                  ? Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'ยังไม่มีประวัติการบันทึก',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        color: Color(0xFFf2f2f2),
                        elevation: 2,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(
                                          left: 10, bottom: 10, top: 10),
                                      child: Text('โปรตีนที่ได้รับ: ' +
                                          _controller.dataTransaction[index]
                                                  ['protein']
                                              .toStringAsFixed(2)),
                                    ),
                                    _controller.dataTransaction[index]
                                                ['moreProtein'] ==
                                            0.0
                                        ? Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text('ทานโปรตีนครบตามจำนวน'),
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                    'ต้องการโปรตีนเพิ่มอีก '),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 4),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  _controller
                                                      .dataTransaction[index]
                                                          ['moreProtein']
                                                      .toStringAsFixed(2),
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  ' ส่วน',
                                                ),
                                              ),
                                            ],
                                          ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(
                                          left: 10, bottom: 10, top: 10),
                                      child: Text('แคลอรี่ที่ได้รับ: ' +
                                          _controller.dataTransaction[index]
                                                  ['cal']
                                              .toStringAsFixed(2)),
                                    ),
                                    _controller.dataTransaction[index]
                                                ['moreCal'] ==
                                            0.0
                                        ? Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(left: 10),
                                            child:
                                                Text('ทานแคลอรี่ครบตามจำนวน'),
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                    'ต้องการแคลอรี่เพิ่มอีก '),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 4),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  _controller
                                                      .dataTransaction[index]
                                                          ['moreCal']
                                                      .toStringAsFixed(2),
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  ' ส่วน',
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, top: 10),
                                      child: _controller.dataTransaction[index]
                                                  ['check'] ==
                                              true
                                          ? Icon(
                                              Icons.disabled_by_default_sharp,
                                              size: 40,
                                              color: Colors.red,
                                            )
                                          : Icon(
                                              Icons.check_circle_rounded,
                                              size: 40,
                                              color: Color(0xFF4d9651),
                                            ),
                                    ),
                                    Container(
                                      height: 15,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: _controller.dataTransaction[index]
                                                  ['check2'] ==
                                              true
                                          ? Icon(
                                              Icons.disabled_by_default_sharp,
                                              size: 40,
                                              color: Colors.red,
                                            )
                                          : Icon(
                                              Icons.check_circle_rounded,
                                              size: 40,
                                              color: Color(0xFF4d9651),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text('วันที่บันทึก: ' +
                                      myFormat.format(
                                        DateTime.parse(_controller
                                            .dataTransaction[index]['date']),
                                      )
                                  // ListTile(
                                  //   leading: Text(
                                  //     myFormat.format(
                                  //       DateTime.parse(_controller.dataTransaction[index]['date']),
                                  //     ),
                                  //   ),
                                  //   title: Text('โปรตีนที่ได้รับ: ' +
                                  //       _controller.dataTransaction[index]['protein'].toStringAsFixed(2)),
                                  // ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
