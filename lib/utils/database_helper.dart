import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String tableName = "student";
  String studentId = "id";
  String studentName = "name";
  String studentContinuous = "continuous";

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.internal();
      return _databaseHelper;
    }else {
      return _databaseHelper;
    }
  }

  DatabaseHelper.internal();


 Future<Database> _getDatabase() async{
  if(_database == null){
    _database= await initializeDatabase();
    return _database;
  }else{
    return _database;
  }

  }

  initializeDatabase() async{
  Directory directory = await getApplicationDocumentsDirectory();
  String path = join(directory.path+"table.db");
  var StudentDatabase= openDatabase(path,version: 1,onCreate:  _onCreated);
  return StudentDatabase;

  }

  FutureOr<void> _onCreated(Database db ,int version)async {
   await db.execute("CREATE TABLE $tableName($studentId INTEGER PRIMARY KEY AUTOINCREMENT ,$studentName TEXT , $studentContinuous INTEGER ");

   }


}

