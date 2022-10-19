import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_mom/database/im_un_database.dart';

class ImUnController extends GetxController {
  TextEditingController proteinPerdate = new TextEditingController(text: '0');
  TextEditingController calPerdate = new TextEditingController(text: '0');
  double result = 0;
  double result2 = 0;

  bool check1 = false;
  bool check2 = false;
  bool check3 = false;

  List<TextEditingController> firstValue = [];
  List<TextEditingController> secondValue = [];
  List<TextEditingController> thirdValue = [];
  List<TextEditingController> fourthValue = [];
  List<TextEditingController> riceValue = [];
  List<TextEditingController> fruitValue = [];
  List<TextEditingController> vegetValue = [];
  List<TextEditingController> milkValue = [];

  List<TextEditingController> firstLunchValue = [];
  List<TextEditingController> secondLunchValue = [];
  List<TextEditingController> thirdLunchValue = [];
  List<TextEditingController> fourthLunchValue = [];
  List<TextEditingController> riceLunchValue = [];
  List<TextEditingController> fruitLunchValue = [];
  List<TextEditingController> vegetLunchValue = [];
  List<TextEditingController> milkLunchValue = [];

  List<TextEditingController> firstDinnerValue = [];
  List<TextEditingController> secondDinnerValue = [];
  List<TextEditingController> thirdDinnerValue = [];
  List<TextEditingController> fourthDinnerValue = [];
  List<TextEditingController> riceDinnerValue = [];
  List<TextEditingController> fruitDinnerValue = [];
  List<TextEditingController> vegetDinnerValue = [];
  List<TextEditingController> milkDinnerValue = [];

  List<TextEditingController> oilValue = [];
  List<TextEditingController> oilLunchValue = [];
  List<TextEditingController> oilDinnerValue = [];

  List dataTransaction = [];
  List dataTransactionBreakfast = [];
  List dataTransactionLunch = [];
  List dataTransactionDinner = [];
  List dataTransactionIBW = [];
  List dataTransactionProtein = [];

  String lastesCalBreak = '';
  String lastesCalPro = '';
  String lastesCalCal = '';

  String lastesCalLunch = '';
  String lastesCalProLunch = '';
  String lastesCalCalLunch = '';

  String lastesCalDinner = '';
  String lastesCalProDinner = '';
  String lastesCalCalDinner = '';

  String dateCalWgh = '';
  String wgh = '';
  String calperdateSave = '';

  String proteinGram = '';
  String dateProtein = '';
  String proteinPart = '';

  var map = Map<String, double>();
  var map2 = Map<String, double>();

  double totalValue = 0.0;
  double totalCal = 0.0;
  double totalValueBreakfast = 0.0;
  double totalCalBreakfast = 0.0;
  double totalValueLunch = 0.0;
  double totalCalLunch = 0.0;
  double totalValueDinner = 0.0;
  double totalCalDinner = 0.0;

  Future<void> clearDataMap() async {
    check1 = false;
    check2 = false;
    check3 = false;
    map.clear();
    map2.clear();
  }

  Future<void> clearDataSave() async {
    totalCalBreakfast = 0.0;
    totalValueBreakfast = 0.0;
  }

  Future<void> clearDataSave2() async {
    totalCalLunch = 0.0;
    totalValueLunch = 0.0;
  }

  Future<void> clearDataSave3() async {
    totalCalDinner = 0.0;
    totalValueDinner = 0.0;
  }

  Future<void> clearTextControllerBreakfast() async {
    firstValue.clear();
    secondValue.clear();
    thirdValue.clear();
    fourthValue.clear();
    riceValue.clear();
    fruitValue.clear();
    vegetValue.clear();
    milkValue.clear();
    totalValue = 0.0;
    totalCal = 0.0;
  }

  Future<void> genTextControllerBreakfast() async {
    check1 = true;
    for (var i = 0; i < 6; i++) {
      firstValue.add(new TextEditingController(text: '0'));
      fruitValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 2; i++) {
      secondValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 5; i++) {
      thirdValue.add(new TextEditingController(text: '0'));
    }

    for (var i = 0; i < 4; i++) {
      milkValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 6; i++) {
      fourthValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 15; i++) {
      riceValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 12; i++) {
      vegetValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 9; i++) {
      oilValue.add(new TextEditingController(text: '0'));
      oilLunchValue.add(new TextEditingController(text: '0'));
      oilDinnerValue.add(new TextEditingController(text: '0'));
    }
  }

  Future<void> clearTextControllerLunch() async {
    firstLunchValue.clear();
    secondLunchValue.clear();
    thirdLunchValue.clear();
    fourthLunchValue.clear();
    riceLunchValue.clear();
    fruitLunchValue.clear();
    vegetLunchValue.clear();
    milkLunchValue.clear();
    totalValue = 0.0;
    totalCal = 0.0;
  }

  Future<void> genTextControllerLunch() async {
    check2 = true;

    for (var i = 0; i < 6; i++) {
      firstLunchValue.add(new TextEditingController(text: '0'));
      fruitLunchValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 2; i++) {
      secondLunchValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 5; i++) {
      thirdLunchValue.add(new TextEditingController(text: '0'));
    }

    for (var i = 0; i < 4; i++) {
      milkLunchValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 6; i++) {
      fourthLunchValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 15; i++) {
      riceLunchValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 12; i++) {
      vegetLunchValue.add(new TextEditingController(text: '0'));
    }
  }

  Future<void> clearTextControllerDinner() async {
    firstDinnerValue.clear();
    secondDinnerValue.clear();
    thirdDinnerValue.clear();
    fourthDinnerValue.clear();
    riceDinnerValue.clear();
    fruitDinnerValue.clear();
    vegetDinnerValue.clear();
    milkDinnerValue.clear();
    totalValue = 0.0;
    totalCal = 0.0;
    oilValue.clear();
    oilLunchValue.clear();
    oilDinnerValue.clear();
  }

  Future<void> genTextControllerDinner() async {
    check3 = true;
    for (var i = 0; i < 6; i++) {
      firstDinnerValue.add(new TextEditingController(text: '0'));
      fruitDinnerValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 2; i++) {
      secondDinnerValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 5; i++) {
      thirdDinnerValue.add(new TextEditingController(text: '0'));
    }

    for (var i = 0; i < 4; i++) {
      milkDinnerValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 6; i++) {
      fourthDinnerValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 15; i++) {
      riceDinnerValue.add(new TextEditingController(text: '0'));
    }
    for (var i = 0; i < 12; i++) {
      vegetDinnerValue.add(new TextEditingController(text: '0'));
    }
  }

  Future<void> calculateProtein() async {
    totalValue = double.parse(lastesCalPro) +
        double.parse(lastesCalProLunch) +
        double.parse(lastesCalProDinner);

    map['โปรตีนที่ได้รับต่อวัน'] = totalValue;
    result = double.parse(proteinPerdate.text) - totalValue;
    if (result <= 0) {
      result = 0.0;
    } else {}
    map['โปรตีนที่ต้องการเพิ่ม'] = result;

    print('map');
    print(map);
    print(result);
  }

  Future<void> calculateCal() async {
    totalCal = double.parse(lastesCalCal) +
        double.parse(lastesCalCalLunch) +
        double.parse(lastesCalCalDinner);

    map2['แคลที่ได้รับต่อวัน'] = totalCal;
    result2 = double.parse(calPerdate.text) - totalCal;
    if (result2 <= 0) {
      result2 = 0.0;
    } else {}
    map2['แคลที่ต้องการเพิ่ม'] = result2;

    print('map2222222222222');
    print(map2);
    print(result2);
  }

  //Breakfast

  Future<void> calProteinBreakfast() async {
    for (var i = 0; i < firstValue.length; i++) {
      totalValueBreakfast =
          totalValueBreakfast + (int.parse(firstValue[i].text) / 2);
    }
    for (var i = 0; i < secondValue.length; i++) {
      totalValueBreakfast =
          totalValueBreakfast + (int.parse(secondValue[i].text) / 2);
    }
    for (var i = 0; i < thirdValue.length; i++) {
      totalValueBreakfast =
          totalValueBreakfast + (int.parse(thirdValue[i].text) / 2);
    }
    for (var i = 0; i < fourthValue.length; i++) {
      totalValueBreakfast =
          totalValueBreakfast + (int.parse(fourthValue[i].text) / 2);
    }
    for (var i = 0; i < riceValue.length; i++) {
      totalValueBreakfast =
          totalValueBreakfast + (int.parse(riceValue[i].text) * 0.3);
    }
    for (var i = 0; i < milkValue.length; i++) {
      totalValueBreakfast =
          totalValueBreakfast + (int.parse(milkValue[i].text) / 240);
    }
  }

  Future<void> calCalBreakfast() async {
    for (var i = 0; i < firstValue.length; i++) {
      totalCalBreakfast =
          totalCalBreakfast + (int.parse(firstValue[i].text) * 35);
    }
    for (var i = 0; i < secondValue.length; i++) {
      totalCalBreakfast =
          totalCalBreakfast + (int.parse(secondValue[i].text) * 55);
    }
    for (var i = 0; i < thirdValue.length; i++) {
      totalCalBreakfast =
          totalCalBreakfast + (int.parse(thirdValue[i].text) * 75);
    }
    for (var i = 0; i < fourthValue.length; i++) {
      totalCalBreakfast =
          totalCalBreakfast + (int.parse(fourthValue[i].text) * 100);
    }
    for (var i = 0; i < riceValue.length; i++) {
      totalCalBreakfast =
          totalCalBreakfast + (int.parse(riceValue[i].text) * 80);
    }
    for (var i = 0; i < fruitValue.length; i++) {
      totalCalBreakfast =
          totalCalBreakfast + (int.parse(fruitValue[i].text) * 60);
    }
    for (var i = 0; i < vegetValue.length; i++) {
      totalCalBreakfast =
          totalCalBreakfast + (int.parse(vegetValue[i].text) * 25);
    }
    for (var i = 0; i < milkValue.length; i++) {
      if (i == 0) {
        totalCalBreakfast =
            totalCalBreakfast + (int.parse(milkValue[i].text) * 0.625);
      }
      if (i == 1) {
        totalCalBreakfast =
            totalCalBreakfast + (int.parse(milkValue[i].text) * 0.5);
      }
      if (i == 2) {
        totalCalBreakfast =
            totalCalBreakfast + (int.parse(milkValue[i].text) * 0.33);
      }
    }
    for (var i = 0; i < oilValue.length; i++) {
      totalCalBreakfast = totalCalBreakfast + int.parse(oilValue[i].text) * 45;
    }
  }

  //Lunch

  Future<void> calProteinLunch() async {
    for (var i = 0; i < firstValue.length; i++) {
      totalValueLunch =
          totalValueLunch + (int.parse(firstLunchValue[i].text) / 2);
    }
    for (var i = 0; i < secondValue.length; i++) {
      totalValueLunch =
          totalValueLunch + (int.parse(secondLunchValue[i].text) / 2);
    }
    for (var i = 0; i < thirdValue.length; i++) {
      totalValueLunch =
          totalValueLunch + (int.parse(thirdLunchValue[i].text) / 2);
    }
    for (var i = 0; i < fourthValue.length; i++) {
      totalValueLunch =
          totalValueLunch + (int.parse(fourthLunchValue[i].text) / 2);
    }
    for (var i = 0; i < riceValue.length; i++) {
      totalValueLunch =
          totalValueLunch + (int.parse(riceLunchValue[i].text) * 0.3);
    }
    for (var i = 0; i < milkValue.length; i++) {
      totalValueLunch =
          totalValueLunch + (int.parse(milkLunchValue[i].text) / 240);
    }
  }

  Future<void> calCalLunch() async {
    for (var i = 0; i < firstValue.length; i++) {
      totalCalLunch = totalCalLunch + (int.parse(firstLunchValue[i].text) * 35);
    }
    for (var i = 0; i < secondValue.length; i++) {
      totalCalLunch =
          totalCalLunch + (int.parse(secondLunchValue[i].text) * 55);
    }
    for (var i = 0; i < thirdValue.length; i++) {
      totalCalLunch = totalCalLunch + (int.parse(thirdLunchValue[i].text) * 75);
    }
    for (var i = 0; i < fourthValue.length; i++) {
      totalCalLunch =
          totalCalLunch + (int.parse(fourthLunchValue[i].text) * 100);
    }
    for (var i = 0; i < riceValue.length; i++) {
      totalCalLunch = totalCalLunch + (int.parse(riceLunchValue[i].text) * 80);
    }
    for (var i = 0; i < fruitValue.length; i++) {
      totalCalLunch = totalCalLunch + (int.parse(fruitLunchValue[i].text) * 60);
    }
    for (var i = 0; i < vegetValue.length; i++) {
      totalCalLunch = totalCalLunch + (int.parse(vegetLunchValue[i].text) * 25);
    }
    for (var i = 0; i < milkValue.length; i++) {
      if (i == 0) {
        totalCalLunch =
            totalCalLunch + (int.parse(milkLunchValue[i].text) * 0.625);
      }
      if (i == 1) {
        totalCalLunch =
            totalCalLunch + (int.parse(milkLunchValue[i].text) * 0.5);
      }
      if (i == 2) {
        totalCalLunch =
            totalCalLunch + (int.parse(milkLunchValue[i].text) * 0.33);
      }
    }
    for (var i = 0; i < oilValue.length; i++) {
      totalCalLunch = totalCalLunch + int.parse(oilLunchValue[i].text) * 45;
    }
  }

  //Dinner

  Future<void> calProteinDinner() async {
    for (var i = 0; i < firstValue.length; i++) {
      totalValueDinner =
          totalValueDinner + (int.parse(firstDinnerValue[i].text) / 2);
    }
    for (var i = 0; i < secondValue.length; i++) {
      totalValueDinner =
          totalValueDinner + (int.parse(secondDinnerValue[i].text) / 2);
    }
    for (var i = 0; i < thirdValue.length; i++) {
      totalValueDinner =
          totalValueDinner + (int.parse(thirdDinnerValue[i].text) / 2);
    }
    for (var i = 0; i < fourthValue.length; i++) {
      totalValueDinner =
          totalValueDinner + (int.parse(fourthDinnerValue[i].text) / 2);
    }
    for (var i = 0; i < riceValue.length; i++) {
      totalValueDinner =
          totalValueDinner + (int.parse(riceDinnerValue[i].text) * 0.3);
    }
    for (var i = 0; i < milkValue.length; i++) {
      totalValueDinner =
          totalValueDinner + (int.parse(milkDinnerValue[i].text) / 240);
    }
  }

  Future<void> calCalDinner() async {
    for (var i = 0; i < firstValue.length; i++) {
      totalCalDinner =
          totalCalDinner + (int.parse(firstDinnerValue[i].text) * 35);
    }
    for (var i = 0; i < secondValue.length; i++) {
      totalCalDinner =
          totalCalDinner + (int.parse(secondDinnerValue[i].text) * 55);
    }
    for (var i = 0; i < thirdValue.length; i++) {
      totalCalDinner =
          totalCalDinner + (int.parse(thirdDinnerValue[i].text) * 75);
    }
    for (var i = 0; i < fourthValue.length; i++) {
      totalCalDinner =
          totalCalDinner + (int.parse(fourthDinnerValue[i].text) * 100);
    }
    for (var i = 0; i < riceValue.length; i++) {
      totalCalDinner =
          totalCalDinner + (int.parse(riceDinnerValue[i].text) * 80);
    }
    for (var i = 0; i < fruitValue.length; i++) {
      totalCalDinner =
          totalCalDinner + (int.parse(fruitDinnerValue[i].text) * 60);
    }
    for (var i = 0; i < vegetValue.length; i++) {
      totalCalDinner =
          totalCalDinner + (int.parse(vegetDinnerValue[i].text) * 25);
    }
    for (var i = 0; i < milkValue.length; i++) {
      if (i == 0) {
        totalCalDinner =
            totalCalDinner + (int.parse(milkDinnerValue[i].text) * 0.625);
      }
      if (i == 1) {
        totalCalDinner =
            totalCalDinner + (int.parse(milkDinnerValue[i].text) * 0.5);
      }
      if (i == 2) {
        totalCalDinner =
            totalCalDinner + (int.parse(milkDinnerValue[i].text) * 0.33);
      }
    }
    for (var i = 0; i < oilValue.length; i++) {
      totalCalDinner = totalCalDinner + int.parse(oilDinnerValue[i].text) * 45;
    }
  }

  Future<void> loadTransaction() async {
    var db = ImUnDB(dbName: "ImUnTransaction.db");
    dataTransaction = await db.loadAlldata();
    log(dataTransaction.toString());
  }

  Future<void> loadTransactionBreakfast() async {
    var db = ImUnDB(dbName: "ImUnTransaction.db");
    dataTransactionBreakfast = await db.loadDataBreakfast();
    dataTransactionBreakfast.isEmpty
        ? lastesCalBreak = ''
        : lastesCalBreak =
            dataTransactionBreakfast[dataTransactionBreakfast.length - 1]
                    ['date']
                .toString();
    dataTransactionBreakfast.isEmpty
        ? lastesCalCal = ''
        : lastesCalCal =
            dataTransactionBreakfast[dataTransactionBreakfast.length - 1]['cal']
                .toString();
    print(lastesCalCal);
    dataTransactionBreakfast.isEmpty
        ? lastesCalPro = ''
        : lastesCalPro =
            dataTransactionBreakfast[dataTransactionBreakfast.length - 1]
                    ['protein']
                .toString();
    log(dataTransactionBreakfast.toString());
  }

  Future<void> loadTransactionLunch() async {
    var db = ImUnDB(dbName: "ImUnTransaction.db");
    dataTransactionLunch = await db.loadDataLunch();
    dataTransactionLunch.isEmpty
        ? lastesCalLunch = ''
        : lastesCalLunch = dataTransactionLunch[dataTransactionLunch.length - 1]
                ['date']
            .toString();
    dataTransactionLunch.isEmpty
        ? lastesCalCalLunch = ''
        : lastesCalCalLunch =
            dataTransactionLunch[dataTransactionLunch.length - 1]['cal']
                .toString();
    print(lastesCalCal);
    dataTransactionLunch.isEmpty
        ? lastesCalProLunch = ''
        : lastesCalProLunch =
            dataTransactionLunch[dataTransactionLunch.length - 1]['protein']
                .toString();
    log(dataTransactionLunch.toString());
  }

  Future<void> loadTransactionDinner() async {
    var db = ImUnDB(dbName: "ImUnTransaction.db");
    dataTransactionDinner = await db.loadDataDinner();
    dataTransactionDinner.isEmpty
        ? lastesCalDinner = ''
        : lastesCalDinner =
            dataTransactionDinner[dataTransactionDinner.length - 1]['date']
                .toString();
    dataTransactionDinner.isEmpty
        ? lastesCalCalDinner = ''
        : lastesCalCalDinner =
            dataTransactionDinner[dataTransactionDinner.length - 1]['cal']
                .toString();
    print(lastesCalCal);
    dataTransactionDinner.isEmpty
        ? lastesCalProDinner = ''
        : lastesCalProDinner =
            dataTransactionDinner[dataTransactionDinner.length - 1]['protein']
                .toString();
    log(dataTransactionDinner.toString());
  }

  Future<void> loadTransactionIBW() async {
    var db = ImUnDB(dbName: "ImUnTransaction.db");
    dataTransactionIBW = await db.loadAlldataIBW();
    dataTransactionIBW.isEmpty
        ? dateCalWgh = ''
        : dateCalWgh =
            dataTransactionIBW[dataTransactionIBW.length - 1]['date'];
    dataTransactionIBW.isEmpty
        ? wgh = ''
        : wgh = dataTransactionIBW[dataTransactionIBW.length - 1]['weight'];
    dataTransactionIBW.isEmpty
        ? calperdateSave = ''
        : calperdateSave =
            dataTransactionIBW[dataTransactionIBW.length - 1]['calperdate'];
    log(dataTransactionIBW.toString());
  }

  Future<void> loadTransactionProtein() async {
    var db = ImUnDB(dbName: "ImUnTransaction.db");
    dataTransactionProtein = await db.loadAlldataProtein();
    dataTransactionProtein.isEmpty
        ? dateProtein = ''
        : dateProtein =
            dataTransactionProtein[dataTransactionProtein.length - 1]['date'];
    dataTransactionProtein.isEmpty
        ? proteinGram = ''
        : proteinGram =
            dataTransactionProtein[dataTransactionProtein.length - 1]
                ['proteinG'];
    dataTransactionProtein.isEmpty
        ? proteinPart = ''
        : proteinPart =
            dataTransactionProtein[dataTransactionProtein.length - 1]
                ['proteinP'];
    log(dataTransactionProtein.toString());
  }
}
