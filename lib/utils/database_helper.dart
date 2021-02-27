import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_usage/Model/Student.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String databaseName = "student";
  String columnId = "id";
  String columnName = "name";
  String columnCon = "continuous";


  factory DatabaseHelper(){
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "student.db");
    debugPrint(path);
    var studentDb = openDatabase(path, version: 1, onCreate: _onCreateM);
    return studentDb;
  }

  FutureOr<void> _onCreateM(Database db, int version) async{
    await db.execute("CREATE TABLE $databaseName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT, $columnCon INTEGER )");
    debugPrint("veri tabanı oluşturuldu");
  }


  Future<List<Map>> getAllStudents()async{
    Database db = await _getDatabase();
    var result= await db.query(databaseName,orderBy:'$columnId DESC');
    return result;

  }

  Future<int> addDatabase(Student student) async{
  Database db = await _getDatabase();
  var result= await db.insert(databaseName,student.toMap(),nullColumnHack:"$columnId" );
  return result;
  }

}