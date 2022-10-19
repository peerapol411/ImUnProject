import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_mom/controller/im_un_controller.dart';

import '../database/im_un_database.dart';

class ibwScreen extends StatefulWidget {
  const ibwScreen({Key? key}) : super(key: key);

  @override
  State<ibwScreen> createState() => _ibwScreenState();
}

class _ibwScreenState extends State<ibwScreen> {
  ImUnController _controller = Get.put(ImUnController());

  late String? _gender;
  late String? _age;
  late String? _height;
  late String? _result;
  late String? _result2;
  String genderSelected = 'ชาย';
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _gender = 'ชาย';
    _height = null;
    _result = "...";
    _result2 = "...";
    _age = 'อายุน้อยกว่า 60';
  }

  var timeFormat = DateFormat('dd/MM/yyyy HH:mm');

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'คำนวณ IBW',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'คำนวณน้ำหนัก IBW',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      IconButton(
                        onPressed: () async {
                          await _controller.loadTransactionIBW();
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
                                          _controller.dateCalWgh == ''
                                              ? Text('ยังไม่คำนวณ')
                                              : Text(
                                                  timeFormat.format(
                                                    DateTime.parse(
                                                        _controller.dateCalWgh),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('น้ำหนักที่ควรจะเป็น : '),
                                          _controller.wgh == ''
                                              ? Text('ยังไม่คำนวณ')
                                              : Text(
                                                  double.parse(_controller.wgh)
                                                          .toStringAsFixed(2) +
                                                      ' Kg'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('พลังงานที่ควรได้รับ : '),
                                          _controller.calperdateSave == ''
                                              ? Text('ยังไม่คำนวณ')
                                              : Text(
                                                  _controller.calperdateSave +
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
                    thickness: 2,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: const Text(
                      "กรุณาระบุเพศ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Color(0xFFdcdedc),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButton(
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                        isExpanded: true,
                        underline: Container(),
                        value: _gender,
                        items: <String>[
                          'ชาย',
                          'หญิง',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 12, left: 20),
                    child: const Text(
                      "กรอกช่วงอายุ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Color(0xFFdcdedc),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButton(
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                        isExpanded: true,
                        underline: Container(),
                        value: _age,
                        items: <String>[
                          'อายุมากกว่าหรือเท่ากับ 60',
                          'อายุน้อยกว่า 60',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _age = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "ส่วนสูง (cms.)",
                        icon: Icon(
                          Icons.height_sharp,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "กรุณากรอกส่วนสูง";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _height = value.toString();
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _height = value.toString();
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      child: Text(
                        "คำนวณ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          if (_gender == "ชาย") {
                            print("ชาย");
                            print(_result);
                            setState(() {
                              _result = (int.parse(_height!) - 100).toString();
                            });
                          }
                          if (_gender == "หญิง") {
                            print("หญิง");
                            print(_result);
                            setState(() {
                              _result = (int.parse(_height!) - 105).toString();
                            });
                          }
                          if (_age == "อายุน้อยกว่า 60") {
                            print(_result2);
                            setState(() {
                              _result2 = (int.parse(_result!) * 35).toString();
                              _controller.calPerdate.text = _result2.toString();
                              print(_controller.calPerdate.text);
                            });
                          } else {
                            print(_result2);
                            setState(() {
                              _result2 = (int.parse(_result!) * 30).toString();
                              _controller.calPerdate.text = _result2.toString();
                              print(_controller.calPerdate.text);
                            });
                          }
                        }

                        var statement = [
                          _result,
                          DateTime.now().toString(),
                          _result2,
                        ];

                        var db = ImUnDB(dbName: "ImUnTransaction.db");
                        await db.InsertDataIBW(statement);
                        print(db);

                        // showDialog<String>(
                        //   context: context,
                        //   builder: (context) {
                        //     Future.delayed(Duration(seconds: 2), () {
                        //       Navigator.pop(context);
                        //     });
                        //     return AlertDialog(
                        //       title: const Icon(
                        //         Icons.check_circle_outline_rounded,
                        //         size: 60,
                        //         color: Colors.green,
                        //       ),
                        //       content: const Text(
                        //         'บันทึกข้อมูลเสร็จสิ้น!',
                        //         textAlign: TextAlign.center,
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Card(
                      elevation: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.monitor_weight_rounded,
                              size: 50,
                            ),
                            title: Text(
                              'น้ำหนักที่ควรจะเป็น คือ ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: Text(
                              "${_result} Kg.",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Card(
                      elevation: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.directions_run_rounded,
                              size: 50,
                            ),
                            title: Text(
                              'พลังงานที่ผู้ป่วยควรได้รับ คือ ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: Text(
                              "${_result2} Kcal.",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
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
        ),
      ),
    );
  }
}
