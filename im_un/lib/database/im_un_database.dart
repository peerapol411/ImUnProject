import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class ImUnDB {
  String dbName;

  ImUnDB({
    required this.dbName,
  });

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    //สร้าง DB
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> InsertData(List transaction) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("transaction");

    //json
    var keyID = store.add(db, {
      "protein": transaction[0],
      "date": transaction[1],
      "check": transaction[2],
      "moreProtein": transaction[3],
      "cal": transaction[4],
      "moreCal": transaction[5],
      "check2": transaction[6],
    });
    db.close();
    return keyID;
  }

  Future<int> InsertDataIBW(List transaction) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("calIBW");

    //json
    var keyID = store.add(db, {
      "weight": transaction[0],
      "date": transaction[1],
      "calperdate": transaction[2],
    });
    db.close();
    return keyID;
  }

  
  Future<int> InsertDataProtein(List transaction) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("calProtein");

    //json
    var keyID = store.add(db, {
      "proteinG": transaction[0],
      "date": transaction[1],
      "proteinP": transaction[2],
    });
    db.close();
    return keyID;
  }


  Future<int> InsertDataBreakfast(List transactionBreakfast) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("breakfast");

    //json
    var keyID = store.add(db, {
      "protein": transactionBreakfast[0],
      "cal": transactionBreakfast[1],
      "date": transactionBreakfast[2],
    });
    db.close();
    return keyID;
  }

  Future<int> InsertDataLunch(List transactionLunch) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("lunch");

    //json
    var keyID = store.add(db, {
      "protein": transactionLunch[0],
      "cal": transactionLunch[1],
      "date": transactionLunch[2],
    });
    db.close();
    return keyID;
  }

  Future<int> InsertDataDinner(List transactionDinner) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("dinner");

    //json
    var keyID = store.add(db, {
      "protein": transactionDinner[0],
      "cal": transactionDinner[1],
      "date": transactionDinner[2],
    });
    db.close();
    return keyID;
  }

  Future<List> loadAlldata() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("transaction");
    var snapshot = await store.find(db);
    List transactionList = [];
    for (var record in snapshot) {
      transactionList.add(record);
    }
    return transactionList;
  }

  Future<List> loadDataBreakfast() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("breakfast");
    var snapshot = await store.find(db);
    List transactionList = [];
    for (var record in snapshot) {
      transactionList.add(record);
    }
    return transactionList;
  }

  Future<List> loadDataLunch() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("lunch");
    var snapshot = await store.find(db);
    List transactionList = [];
    for (var record in snapshot) {
      transactionList.add(record);
    }
    return transactionList;
  }

  Future<List> loadDataDinner() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("dinner");
    var snapshot = await store.find(db);
    List transactionList = [];
    for (var record in snapshot) {
      transactionList.add(record);
    }
    return transactionList;
  }

  Future<List> loadAlldataIBW() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("calIBW");
    var snapshot = await store.find(db);
    List transactionList = [];
    for (var record in snapshot) {
      transactionList.add(record);
    }
    return transactionList;
  }

  Future<List> loadAlldataProtein() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("calProtein");
    var snapshot = await store.find(db);
    List transactionList = [];
    for (var record in snapshot) {
      transactionList.add(record);
    }
    return transactionList;
  }
}
