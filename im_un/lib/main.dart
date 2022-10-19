import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mom/controller/im_un_controller.dart';
import 'package:project_mom/routes/IBW.dart';
import 'package:project_mom/routes/History.dart';
import 'package:project_mom/routes/MenuDailyMain.dart';
import 'package:project_mom/routes/ProteinCal.dart';
import 'package:project_mom/routes/Menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "อิ่มอุ่น",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ImUnController _controller = Get.put(ImUnController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'อิ่มอุ่น',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: IconButton(
              icon: Image.asset('assets/img/IBW.png'),
              iconSize: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ibwScreen()),
                );
              },
            ),
          ),
          Card(
            child: IconButton(
              icon: Image.asset('assets/img/Protein.png'),
              iconSize: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => proteinCalScreen()),
                );
              },
            ),
          ),
          Card(
            child: IconButton(
              icon: Image.asset('assets/img/Menu.png'),
              iconSize: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => menuRecScreen()),
                );
              },
            ),
          ),
          Card(
            child: IconButton(
              icon: Image.asset('assets/img/Calendar.png'),
              iconSize: 50,
              onPressed: () async {
                await _controller.clearDataMap();
                await _controller.clearTextControllerBreakfast();
                await _controller.clearTextControllerLunch();
                await _controller.clearTextControllerDinner();
                await _controller.genTextControllerBreakfast();
                await _controller.genTextControllerLunch();
                await _controller.genTextControllerDinner();
                await _controller.loadTransactionIBW();
                await _controller.loadTransactionProtein();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => menuDailyMain()),
                );
              },
            ),
          ),
          FlatButton(
            onPressed: () async {
              await _controller.loadTransaction();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Knowledge()),
              ).then((value) {
                setState(() {});
              });
            },
            child: Container(
              height: 45,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                border: Border.all(
                  color: Color(0xFFdcdedc),
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ประวัติการบันทึก',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
