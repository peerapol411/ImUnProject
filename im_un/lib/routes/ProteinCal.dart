import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_mom/controller/im_un_controller.dart';

import '../database/im_un_database.dart';

class proteinCalScreen extends StatefulWidget {
  const proteinCalScreen({Key? key}) : super(key: key);

  @override
  State<proteinCalScreen> createState() => _proteinCalScreenState();
}

class _proteinCalScreenState extends State<proteinCalScreen> {
  ImUnController _controller = Get.put(ImUnController());
  var timeFormat = DateFormat('dd/MM/yyyy HH:mm');

  late String? _bloodHemo;
  late String? _weight;
  late String? _result;
  late String? _result2;
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bloodHemo = 'ได้รับการฟอกเลือด';
    _weight = null;
    _result = "...";
    _result2 = "...";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('คำนวณ Protein'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'คำนวณโปรตีนที่ควรได้รับต่อวัน',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    IconButton(
                      onPressed: () async {
                        await _controller.loadTransactionProtein();

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
                                        _controller.dateProtein == ''
                                            ? Text('ยังไม่คำนวณ')
                                            : Text(timeFormat.format(
                                                DateTime.parse(_controller
                                                    .dateProtein))),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('โปรตีนที่ได้รับ/กรัม : '),
                                        _controller.proteinGram == ''
                                            ? Text('ยังไม่คำนวณ')
                                            : Text(double.parse(_controller
                                                        .proteinGram)
                                                    .toStringAsFixed(2) +
                                                ' กรัม'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('โปรตีนที่ได้รับ/ส่วน : '),
                                        _controller.proteinPart == ''
                                            ? Text('ยังไม่คำนวณ')
                                            : Text(_controller
                                                    .proteinPart +
                                                ' ส่วน'),
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
                Divider(thickness: 2),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, 15, 0, 20), //apply padding to all four sides
                  child: Text(
                    "ท่านได้รับการฟอกเลือดหรือไม่",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 30),
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
                      value: _bloodHemo,
                      items: <String>[
                        'ได้รับการฟอกเลือด',
                        'ไม่ได้รับการฟอกเลือด',
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
                          _bloodHemo = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: TextFormField(
                    decoration:
                        new InputDecoration(labelText: "น้ำหนัก IBW (Kg.)"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "กรุณากรอกน้ำหนัก IBW";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _weight = value.toString();
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _weight = value.toString();
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    child: Text(
                      "คำนวณ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async{
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        if (_bloodHemo == "ได้รับการฟอกเลือด") {
                          print(_result);
                          setState(() {
                            _result = (double.parse(_weight!) * 1.2)
                                .toStringAsFixed(2);
                            _result2 = (double.parse(_result!) / 7)
                                .toStringAsFixed(2);
                            _controller.proteinPerdate.text =
                                _result2.toString();
                          });
                        }
                        if (_bloodHemo == "ไม่ได้รับการฟอกเลือด") {
                          print(_result);
                          setState(() {
                            _result = ((double.parse(_weight!) * 0.8))
                                .toStringAsFixed(2);
                            _result2 = (double.parse(_result!) / 7)
                                .toStringAsFixed(2);
                            _controller.proteinPerdate.text =
                                _result2.toString();
                          });
                          print(_result2);
                        }
                      }

                       var statement = [
                          _result,
                          DateTime.now().toString(),
                          _result2,
                        ];

                        var db = ImUnDB(dbName: "ImUnTransaction.db");
                        await db.InsertDataProtein(statement);
                        print(db);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.egg_alt_outlined, size: 50),
                          title: Text(
                            'จำนวนโปรตีนที่ต้องได้รับต่อวัน/กรัม คือ ',
                            style: TextStyle(fontSize: 15),
                          ),
                          subtitle: Text(
                            "${_result}",
                            style:
                                TextStyle(color: Colors.green, fontSize: 40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading:
                              Icon(Icons.room_service_outlined, size: 50),
                          title: Text(
                            'จำนวนโปรตีนที่ต้องได้รับต่อวัน/ส่วน คือ ',
                            style: TextStyle(fontSize: 15),
                          ),
                          subtitle: Text(
                            "${_result2}",
                            style:
                                TextStyle(color: Colors.green, fontSize: 40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'ตัวอย่างอาหารแลกเปลี่ยนโปรตีน 1 ส่วน',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                SingleChildScrollView(
                  child: GridView.count(
                    physics: ScrollPhysics(),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main01.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('ไข่ขาวสุก 2 ฟอง'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec01.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main02.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('ลูกชิ้นปลา 30 กรัม'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec02.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main03.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('เนื้อหมู 30 กรัม'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec03.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main04.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('เนื้อไก่ 30 กรัม'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec04.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main05.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('หมูสับปั้นก้อน 30 กรัม'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec05.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main06.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('เนื้อปลาสุก 30 กรัม'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec06.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main07.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('กุ้ง 5 ตัว'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec07.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main08.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('ปลาหมึก 30 กรัม'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec08.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main09.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('หมูปิ้ง 30 กรัม'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec09.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          child: IconButton(
                            icon: Image.asset(
                                'assets/img/menu/menu_rec_main10.jpg',
                                fit: BoxFit.fill),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('หมูปิ้ง 30 กรัม'),
                                        content: Container(
                                            child: Image.asset(
                                                'assets/img/menu/menu_rec10.jpg')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
